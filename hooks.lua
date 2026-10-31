---@param m MarioState
local function spawn_fire_or_ice_ball(m, beh, angle)
    if m.playerIndex ~= 0 then return end
    spawn_sync_object(id_bhvFireOrIceball, E_MODEL_NONE, m.pos.x, m.pos.y + 100, m.pos.z, function(o)
        o.oMoveAngleYaw = angle
        o.oVelY = 15
        o.oBehParams = beh
    end)
end

---@param m MarioState
local function spawn_bubble_projectile(m, angle)
    if m.playerIndex ~= 0 then return end
    spawn_sync_object(id_bhvPowerupBubble, E_MODEL_NONE, m.pos.x, m.pos.y + 50, m.pos.z, function(o)
        o.oMoveAngleYaw = angle
        o.oVelY = m.actionArg == 1 and -3 or -1
        o.oCapUnkF8 = 40 + (m.forwardVel/2)
    end)
end

ACT_POWERUP_PROJ_THROW = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

---@param m MarioState
local function act_proj_throw(m)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]

    local anim = m.actionArg > 0 and "jers_powerups_proj_throw_air" or "jers_powerups_proj_throw_ground"
    smlua_anim_util_set_animation(m.marioObj, anim)
    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, 0x10000)

    if m.actionArg == 0 then
        m.vel.x = 0
        m.vel.z = 0
        perform_ground_step(m)
        if m.actionTimer >= 20 then
            return set_mario_action(m, ACT_IDLE, 0)
        elseif m.actionTimer >= 14 and m.input & INPUT_B_PRESSED ~= 0 then
            m.actionState = 0
        end
    elseif m.actionArg > 0 then
        local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
        if stepResult == AIR_STEP_HIT_WALL then
            return set_mario_action(m, ACT_SOFT_BONK, 0)
        end
        if m.actionTimer >= 16 and m.input & INPUT_B_PRESSED ~= 0 then
            m.actionArg = 2
            m.actionState = 0
        end
    end

    if m.actionState == 0 then
        m.actionTimer = -1
        m.actionState = 1
    end
    if m.actionTimer == 0 then
        play_character_sound(m, CHAR_SOUND_PUNCH_HOO)
        set_anim_to_frame(m, 0)
        if m.actionArg > 0 then
            m.vel.y = 25
        end
        if m.actionArg ~= 2 then
            m.faceAngle.y = m.intendedYaw
        else
            m.forwardVel = m.forwardVel * 0.3
        end
    elseif m.actionTimer == 4 then
        -- spawn projectiles
        if s.powerupFlags == POWERUP_BUBBLE then
            spawn_bubble_projectile(m, m.faceAngle.y)
        else
            spawn_fire_or_ice_ball(m, s.powerupFlags, m.faceAngle.y)
        end
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_POWERUP_PROJ_THROW, act_proj_throw)

local function mario_update(m)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local np = gNetworkPlayers[m.playerIndex]
    local pu = powerupData[s.powerupFlags]
    local isToad = m.character.type == CT_TOAD
    local isLuigi = m.character.type == CT_LUIGI
    local mario_powerup_throw_type = (s.powerupFlags >= 1 and s.powerupFlags <= 4)
    local capTimerToCheck = s.powerupFlags < 0 and m.capTimer or s.capTimer2

    if not e.displayPowerup then
        if e.playerCapCol ~= network_player_get_override_palette_color(np, CAP) then
            e.playerCapCol = network_player_get_override_palette_color(np, CAP)
        end
        if s.powerupFlags == POWERUP_METAL or s.powerupFlags == POWERUP_GOLD then
            m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_METAL
        end
        if s.powerupFlags == POWERUP_VANISH then
            m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_NOISE_ALPHA
        end
    elseif s.powerupFlags then
        if (s.powerupFlags > 0 and s.powerupFlags < 6) or s.powerupFlags == POWERUP_METAL or s.powerupFlags == POWERUP_MASTER then
            if pu and pu.col then
                if e.masterCapRunning then
                    network_player_set_override_palette_color(np, CAP, {r = e.playerR, g = e.playerG, b = e.playerB})
                elseif isToad then -- i hate this little bitch for his palette slots
                    local toadCol = pu.col[CAP]
                    if s.powerupFlags == POWERUP_FIRE then
                        toadCol = {r = 255, g = 0, b = 0}
                        if (e.playerCapCol.r == 255 and e.playerCapCol.g == 0 and e.playerCapCol.b == 0) then
                            toadCol = {r = 255, g = 255, b = 255}
                        end
                    end
                    network_player_set_override_palette_color(np, CAP, toadCol)
                    network_player_set_override_palette_color(np, SHIRT, toadCol)
                    network_player_set_override_palette_color(np, GLOVES, e.playerCapCol)
                    network_player_set_override_palette_color(np, PANTS, e.playerCapCol)
                elseif isLuigi and s.powerupFlags == POWERUP_GOLD then
                    network_player_set_override_palette_color(np, CAP, {r = 150, g = 200, b = 255})
                else
                    for i = 0, PLAYER_PART_MAX - 1 do
                        local colToUse = (pu.col[i] == -1 and e.playerCapCol) or pu.col[i]
                        if pu.col[i] then
                            network_player_set_override_palette_color(np, i, colToUse)
                        end
                    end
                end
            end
            if s.powerupFlags == POWERUP_GOLD then
                m.marioBodyState.modelState = m.marioBodyState.modelState | MODEL_STATE_METAL
                if s.capTimer2 % 3 == 0 then
                    set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)
                end
            end
        end
    end

    if e.shroomScale > 0 then
        m.marioObj.header.gfx.scale.y = math.sin(e.shroomScale * 1.5) * 0.3 + (1.1 - (e.shroomScale/40))
        e.shroomScale = e.shroomScale - 1
    end

    if s.powerupFlags ~= 0 then
        local frameSkip = s.capTimer2 > 90 and 4 or (math.ceil(s.capTimer2/30) + 1)*2
        -- if s.powerupFlags < 0 then
        --     if e.powerupStartTimer > 0 and (s.capTimer2 % frameSkip) == 0 then
        --         m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_METAL
        --         m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_NOISE_ALPHA
        --     end
        -- else
        if m.action ~= ACT_END_PEACH_CUTSCENE and m.action ~= ACT_JUMBO_STAR_CUTSCENE then
            if charSelectExists and charSelect.is_menu_open() then
                e.displayPowerup = false
                if e.CSmenuCheck then
                    network_player_reset_override_palette(np)
                    e.CSmenuCheck = false
                end
            elseif s.capTimer2 < 1 and gNetworkPlayers[0].currActNum ~= 99 then
                network_player_reset_override_palette(np)
                spawn_mist_particles_with_sound(SOUND_MENU_ENTER_PIPE)
                if e.displayPowerup then
                    e.displayPowerup = false
                end
                s.powerupFlags = 0
            elseif ((e.powerupStartTimer > 0 and (e.powerupStartTimer % frameSkip) == 0)
            or (s.capTimer2 < 90 and (m.flags & MARIO_WING_CAP == 0 or m.flags & MARIO_METAL_CAP ~= 0)) and (s.capTimer2 % frameSkip) == 0) then
                network_player_reset_override_palette(np)
                e.displayPowerup = false
            elseif e.prevCharType ~= m.character.type then
                network_player_reset_override_palette(np)
                e.displayPowerup = false
                e.prevCharType = m.character.type
            else
                e.displayPowerup = true
            end
        end
        if e.powerupStartTimer > 0 then
            e.powerupStartTimer = e.powerupStartTimer - 1
        end
        if charSelectExists and not charSelect.is_menu_open() then
            e.CSmenuCheck = true
        end
    end

    -- if (m.action == ACT_THROWING or m.action == ACT_AIR_THROW) and m.actionArg == ARG_THROW then
    --     local soundFrame = m.action == ACT_THROWING and 5 or -1

    --     if m.action == ACT_AIR_THROW then
    --         if (m.pos.y - m.floorHeight) < (m.vel.y * -1) + 1 and m.vel.y < 0 then
    --             set_mario_action(m, ACT_FREEFALL_LAND, 0)
    --         end
    --         if m.input & INPUT_Z_PRESSED ~= 0 then
    --             set_mario_action(m, ACT_GROUND_POUND, 0)
    --         end
    --     end

    --     if mario_powerup_throw_type and s.capTimer2 > 7 then
    --         if m.marioObj.header.gfx.animInfo.animFrame == soundFrame then
    --             play_character_sound(m, s.powerupFlags ~= 0 and CHAR_SOUND_PUNCH_HOO)
    --             if s.powerupFlags == POWERUP_BUBBLE then
    --                 spawn_bubble_projectile(m, m.faceAngle.y)
    --             else
    --                 spawn_fire_or_ice_ball(m, s.powerupFlags, m.faceAngle.y)
    --             end
    --         end
    --         if m.action ~= ACT_THROWING or m.actionTimer < 15 then
    --             m.marioBodyState.handState = MARIO_HAND_RIGHT_OPEN
    --         end
    --     else
    --         if m.marioObj.header.gfx.animInfo.animFrame == soundFrame then
    --             play_character_sound(m, s.powerupFlags ~= 0 and CHAR_SOUND_DOH)
    --         end
    --     end
    -- end

    -- evilswag moveset compat
    if mario_powerup_throw_type and s.capTimer2 > 5 then
        if m.action == ACT_SIDE_FLIP and m.actionArg == 73 and (m.actionTimer == 5 or m.actionTimer == 7) then
            if s.powerupFlags == POWERUP_BUBBLE then
                spawn_bubble_projectile(m, m.faceAngle.y + (m.actionTimer - 6)*0x500)
            else
                spawn_fire_or_ice_ball(m, s.powerupFlags, m.faceAngle.y + (m.actionTimer - 6)*0x500)
            end
        end
        if m.action == ACT_LONG_JUMP and m.input & INPUT_B_PRESSED ~= 0 then
            set_mario_action(m, ACT_POWERUP_PROJ_THROW, 2)
        end
    end

    if m.playerIndex == 0 and e.powerupStored ~= 0 and e.powerupStored ~= nil and m.action & ACT_GROUP_CUTSCENE == 0 and (m.controller.buttonPressed & e.hudPocketInput ~= 0) then
        local spawnBhv = 0
        local spawnModel = E_MODEL_NONE
        if e.powerupStored < 0 then
            spawnBhv = powerupData[e.powerupStored].bhv
            spawnModel = powerupData[e.powerupStored].model
            spawn_sync_object(spawnBhv, spawnModel, m.pos.x, m.pos.y + 200, m.pos.z, function(cap)
                cap.oForwardVel      = 10
                cap.oVelY            = 20
                cap.oMoveAngleYaw    = m.faceAngle.y
                spawn_mist_particles_with_sound(SOUND_GENERAL_COIN_SPURT_2)
            end)
        else
            spawn_powerup_manual(m.pos.x, m.pos.y + 200, m.pos.z, 10, 10, m.faceAngle.y, e.powerupStored, SOUND_POWERUP_USE)
        end
        audio_sample_play(SOUND_POWERUP_USE, m.pos, 1)
        mod_storage_save_integer("pocket_item", 0)
        e.powerupStored = 0
    end

    if e.masterCapRunning then
        s.capTimer2 = m.capTimer
        s.powerupFlags = POWERUP_MASTER
        do_master_cap_effect(m)
        if m.capTimer < 1 and e.powerupStartTimer == 0 then
            e.masterCapRunning = false
            s.capTimer2 = 1
        end
    elseif s.capTimer2 > 0 then
    -- and m.action ~= ACT_READING_AUTOMATIC_DIALOG
    -- and m.action ~= ACT_READING_NPC_DIALOG
    -- and m.action ~= ACT_READING_SIGN
    -- and m.action ~= ACT_IN_CANNON then
        if m.action & ACT_FLAG_INTANGIBLE == 0 or m.action == ACT_PUTTING_ON_CAP then
            s.capTimer2 = s.capTimer2 - 1
        elseif m.flags & MARIO_METAL_CAP ~= 0 then
            m.marioBodyState.modelState = m.marioBodyState.modelState | MODEL_STATE_METAL
        end
        m.capTimer = s.capTimer2
    end
end
hook_event(HOOK_MARIO_UPDATE, mario_update)

local function mario_set_action(m)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local mario_powerup_throw_type = (s.powerupFlags >= 1 and s.powerupFlags <= 4)

    if m.actionArg == ARG_THROW and mario_powerup_throw_type then
        if m.action == ACT_AIR_THROW then
            m.vel.y = 30
            set_anim_to_frame(m, 0)
        end
    end

    if m.action == ACT_JUMBO_STAR_CUTSCENE then
        reset_on_warp()
    end
end
hook_event(HOOK_ON_SET_MARIO_ACTION, mario_set_action)

local function mario_before_set_action(m, act)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local mario_powerup_throw_type = (s.powerupFlags >= 1 and s.powerupFlags <= 4)

    if mario_powerup_throw_type and s.capTimer2 > 5 and (act == ACT_JUMP_KICK or act == ACT_MOVE_PUNCHING or (act == ACT_PUNCHING and m.input & INPUT_Z_DOWN == 0) or (act == ACT_DIVE and m.input & INPUT_NONZERO_ANALOG == 0)) then
        if act == ACT_JUMP_KICK or act == ACT_DIVE or m.input & INPUT_A_DOWN ~= 0 then
            m.pos.y = m.pos.y + 10
            m.vel.y = 25
            return set_mario_action(m, ACT_POWERUP_PROJ_THROW, 1)
        else
            return set_mario_action(m, ACT_POWERUP_PROJ_THROW, 0)
        end
    end
end
hook_event(HOOK_BEFORE_SET_MARIO_ACTION, mario_before_set_action)

---@param m MarioState
---@param o Object
---@param type InteractionType
local function mario_interact(m, o, type)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local np = gNetworkPlayers[m.playerIndex]

    -- if obj_has_behavior_id(o, id_bhvExclamationBox) ~= 0 and o.oExclamationBoxUnkF4 < 0.5 then
    --     spawn_sync_object(id_bhvGeneralPowerup, E_MODEL_NONE, o.oPosX, o.oPosY + 100, o.oPosZ, function(pu)
    --         pu.oMoveAngleYaw = o.oFaceAngleYaw
    --         pu.oVelY = 30
    --         pu.oBehParams = math.random(1, 2)
    --     end)
    -- end
    -- if obj_has_behavior_id(o, id_bhvMetalCap) ~= 0
    -- or obj_has_behavior_id(o, id_bhvWingCap) ~= 0
    -- or obj_has_behavior_id(o, id_bhvVanishCap) ~= 0 then
    --     s.powerupFlags = 0
    -- end

    for bhv in pairs(vanillaPowerups) do
        if obj_has_behavior_id(o, bhv) ~= 0 then
            network_player_reset_override_palette(np)
            e.powerupStartTimer = 20
            s.powerupFlags = vanillaPowerups[bhv].pu
            if e.powerupStored == s.powerupFlags and e.overrideCapTimer then
                s.capTimer2 = e.capTimerSaved
                e.powerupStartTimer = 0
                e.overrideCapTimer = false
            else
                s.capTimer2 = m.capTimer
            end
        end
    end

    if (o.oInteractStatus & INT_STATUS_WAS_ATTACKED ~= 0 and m.action ~= ACT_TWIRLING) then
        if obj_has_behavior_id(o, id_bhvMoneybag) == 0 or o.oAction ~= MONEYBAG_ACT_DEATH then -- Moneybags sometimes spawns 2 flowers, this fixes it
            spawn_powerup_from_bhv(m, o, 0, 15, o.oFaceAngleYaw, nil, SOUND_GENERAL_GRAND_STAR_JUMP)
        end
    end

    if obj_has_behavior_id(o, id_bhvMasterCapBox) ~= 0 and o.oInteractStatus & INT_STATUS_WAS_ATTACKED ~= 0 then
        s.capTimer2 = 1
    end

    if s.capTimer2 > 0 and type == INTERACT_COIN then
        s.capTimer2 = s.capTimer2 + 25*o.oDamageOrCoinValue
    end
end
hook_event(HOOK_ON_INTERACT, mario_interact)

local function before_mario_interact(m, o, type)
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local capFlag = get_mario_cap_flag(o)

    if o.oInteractType == INTERACT_CAP and m.action ~= ACT_GETTING_BLOWN and capFlag ~= MARIO_NORMAL_CAP then -- this method is from Sharen's Game Enhancer
        replaceStarSound = 1
        s.capTimer2 = m.capTimer
        spawn_mist_particles()
    end

    for bhv in pairs(vanillaPowerups) do
        if obj_has_behavior_id(o, bhv) ~= 0 and m.flags & vanillaPowerups[bhv].checkFlag ~= 0 and e.powerupStored ~= vanillaPowerups[bhv].pu then
            store_powerup(m, vanillaPowerups[bhv].pu)
            e.overrideCapTimer = true
            e.capTimerSaved = s.capTimer2
            replaceStarSound = 2
        end
    end
end
hook_event(HOOK_ALLOW_INTERACT, before_mario_interact)

local function on_sound(id)
    local m = gMarioStates[0]
    local e = gPowerupStates[m.playerIndex]

    if id == SOUND_MENU_STAR_SOUND and replaceStarSound ~= 0 and gNetworkPlayers[0].currActNum ~= 99 and m.action ~= ACT_JUMBO_STAR_CUTSCENE then
        if replaceStarSound == 2 then
            replaceStarSound = 0
            return NO_SOUND
        elseif replaceStarSound == 1 then
            replaceStarSound = 0
            return SOUND_MENU_EXIT_PIPE
        end
    end
end
hook_event(HOOK_ON_PLAY_SOUND, on_sound)

function hazard_surface(m)
    if m.flags & MARIO_VANISH_CAP ~= 0 then
        return false
    end
end
hook_event(HOOK_ALLOW_HAZARD_SURFACE, hazard_surface)

if charSelectExists then
    charSelect.hook_on_character_change(function()
        local m = gMarioStates[0]
        local e = gPowerupStates[m.playerIndex]
        e.prevCharType = -1

        -- local char = characterColorPresets[obj_get_model_id_extended(m)]
        -- local fireCheck = ("Fire" | "Fire Flower")

        -- for i = 0, #char.palette do
        --     if char.palette.name & fireCheck ~= 0 then
        --         e.csOverridePalette.fire = char.presetPalette
        --         return
        --     end
        -- end
    end)
end