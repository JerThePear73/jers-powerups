---@param m MarioState
local function spawn_fire_or_ice_ball(m, beh)
    local model = beh == PROJECTILE_TYPE_FIRE and E_MODEL_POWERUP_FIREBALL or E_MODEL_POWERUP_ICEBALL
    local sound = beh == PROJECTILE_TYPE_FIRE and SOUND_OBJ_FLAME_BLOWN or SOUND_OBJ_BABY_PENGUIN_WALK
    if m.playerIndex ~= 0 then return end
    play_sound(sound, m.marioObj.header.gfx.cameraToObject)
    spawn_sync_object(id_bhvFireOrIceball, model, m.pos.x, m.pos.y + 100, m.pos.z, function(o)
        o.oMoveAngleYaw = m.faceAngle.y
        o.oVelY = 15
        o.oBehParams = beh
    end)
end

---@param m MarioState
local function spawn_bubble_projectile(m)
    if m.playerIndex ~= 0 then return end
    spawn_sync_object(id_bhvPowerupBubble, E_MODEL_NONE, m.pos.x, m.pos.y + 50, m.pos.z, function(o)
        o.oMoveAngleYaw = m.faceAngle.y
    end)
end

local function mario_update(m)
    local e = gPowerupStates[m.playerIndex]
    local np = gNetworkPlayers[m.playerIndex]
    local pu = powerupData[e.powerupFlags]
    local isToad = m.character.type == CT_TOAD
    local mario_powerup_throw_type = (e.powerupFlags >= 1 and e.powerupFlags <= 4)

    if not e.displayPowerup then
        if e.playerCapCol ~= network_player_get_override_palette_color(np, CAP) then
            e.playerCapCol = network_player_get_override_palette_color(np, CAP)
        end
        if e.powerupFlags == POWERUP_METAL then
            m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_METAL
        end
        if e.powerupFlags == POWERUP_VANISH then
            m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_NOISE_ALPHA
        end
    elseif e.powerupFlags then
        if m.flags & MARIO_METAL_CAP ~= 0 and m.marioBodyState.modelState & MODEL_STATE_METAL ~= 0 then
            network_player_set_override_palette_color(np, CAP, powerupData[POWERUP_METAL].col)
        elseif (e.powerupFlags > 0 and e.powerupFlags < 4) then
            if pu and pu.col then
                if isToad then -- i hate this little bitch for his palette slots
                    local toadCol = pu.col[CAP]
                    if e.powerupFlags == POWERUP_FIRE then
                        toadCol = {r = 255, g = 0, b = 0}
                        if (e.playerCapCol.r == 255 and e.playerCapCol.g == 0 and e.playerCapCol.b == 0) then
                            toadCol = {r = 255, g = 255, b = 255}
                        end
                    end
                    network_player_set_override_palette_color(np, CAP, toadCol)
                    network_player_set_override_palette_color(np, SHIRT, toadCol)
                    network_player_set_override_palette_color(np, GLOVES, e.playerCapCol)
                    network_player_set_override_palette_color(np, PANTS, e.playerCapCol)
                else
                    for i = 0, PLAYER_PART_MAX - 1 do
                        local colToUse = (pu.col[i] == -1 and e.playerCapCol) or pu.col[i]
                        if pu.col[i] then
                            network_player_set_override_palette_color(np, i, colToUse)
                        end
                    end
                end
            end
        end
    end

    if e.powerupFlags ~= 0 then
        local frameSkip = m.capTimer > 90 and 4 or (math.ceil(m.capTimer/30) + 1)*2
        -- if e.powerupFlags < 0 then
        --     if e.powerupStartTimer > 0 and (m.capTimer % frameSkip) == 0 then
        --         m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_METAL
        --         m.marioBodyState.modelState = m.marioBodyState.modelState & ~MODEL_STATE_NOISE_ALPHA
        --     end
        -- else
        
        if charSelectExists and charSelect.is_menu_open() then
            e.displayPowerup = false
            if e.CSmenuCheck then
                network_player_reset_override_palette(np)
                e.CSmenuCheck = false
            end
        elseif m.capTimer < 1 and gNetworkPlayers[0].currActNum ~= 99 then
            network_player_reset_override_palette(np)
            spawn_mist_particles_with_sound(SOUND_MENU_ENTER_PIPE)
            if e.displayPowerup then
                e.displayPowerup = false
            end
            e.powerupFlags = 0
        elseif (e.powerupStartTimer > 0 or (m.capTimer < 90 and (m.flags & MARIO_WING_CAP == 0 or m.flags & MARIO_METAL_CAP ~= 0))) and (m.capTimer % frameSkip) == 0 then
            network_player_reset_override_palette(np)
            e.displayPowerup = false
        elseif e.prevCharType ~= m.character.type then
            network_player_reset_override_palette(np)
            e.displayPowerup = false
            e.prevCharType = m.character.type
        else
            e.displayPowerup = true
        end
        if e.powerupStartTimer > 0 then
            e.powerupStartTimer = e.powerupStartTimer - 1
        end
        if charSelectExists and not charSelect.is_menu_open() then
            e.CSmenuCheck = true
        end
    end

    if mario_powerup_throw_type and m.actionArg == 70 and m.capTimer > 5 then
        if m.action == ACT_AIR_THROW then
            if m.actionTimer == 2 then
                if e.powerupFlags == POWERUP_FIRE or e.powerupFlags == POWERUP_ICE then
                    spawn_fire_or_ice_ball(m, e.powerupFlags - 1)
                elseif e.powerupFlags == POWERUP_BUBBLE then
                    spawn_bubble_projectile(m)
                end
            end
            if (m.pos.y - m.floorHeight) < (m.vel.y * -1) + 1 and m.vel.y < 0 then
                set_mario_action(m, ACT_FREEFALL_LAND, 0)
            end
        elseif m.action == ACT_THROWING then
            if m.actionTimer == 6 then
                if e.powerupFlags == POWERUP_FIRE or e.powerupFlags == POWERUP_ICE then
                    spawn_fire_or_ice_ball(m, e.powerupFlags - 1)
                elseif e.powerupFlags == POWERUP_BUBBLE then
                    spawn_bubble_projectile(m)
                end
            end
        end

        local soundFrame = m.action == ACT_THROWING and 6 or -1
        if m.marioObj.header.gfx.animInfo.animFrame == soundFrame then
            play_character_sound(m, CHAR_SOUND_PUNCH_HOO)
        end
        if m.action ~= ACT_THROWING or m.actionTimer < 15 then
            m.marioBodyState.handState = MARIO_HAND_RIGHT_OPEN
        end
    end

    -- if m.marioBodyState.modelState & MODEL_STATE_NOISE_ALPHA ~= 0 and m.flags & MARIO_VANISH_CAP ~= 0 then
    --     local torsoPos = gVec3fZero{}
    --     get_mario_anim_part_pos(m, MARIO_ANIM_PART_TORSO, torsoPos)
    --     spawn_non_sync_object(id_bhvMistParticleSpawner, E_MODEL_NONE, torsoPos.x, torsoPos.y - 20, torsoPos.z, nil)
    -- end

    if m.controller.buttonPressed & Y_BUTTON ~= 0 and m.playerIndex == 0 and e.powerupStored ~= 0 and e.powerupStored ~= nil and m.action & ACT_GROUP_CUTSCENE == 0 then
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
            spawn_powerup_manual(m.pos.x, m.pos.y + 200, m.pos.z, 10, 10, m.faceAngle.y, e.powerupStored, NO_SOUND)
        end
        audio_sample_play(SOUND_POWERUP_USE, m.pos, 1)
        mod_storage_save_integer("pocket_item", 0)
        e.powerupStored = 0
    end
end
hook_event(HOOK_MARIO_UPDATE, mario_update)

local function mario_set_action(m)
    local e = gPowerupStates[m.playerIndex]
    local mario_powerup_throw_type = (e.powerupFlags >= 1 and e.powerupFlags <= 4)

    if m.actionArg == 70 and mario_powerup_throw_type then
        if m.action == ACT_AIR_THROW then
            m.vel.y = 30
            set_anim_to_frame(m, 0)
        end
    end

end
hook_event(HOOK_ON_SET_MARIO_ACTION, mario_set_action)

local function mario_before_set_action(m, act)
    local e = gPowerupStates[m.playerIndex]
    local mario_powerup_throw_type = (e.powerupFlags >= 1 and e.powerupFlags <= 4)

    if mario_powerup_throw_type and (act == ACT_JUMP_KICK or (act == ACT_MOVE_PUNCHING and m.input & INPUT_NONZERO_ANALOG ~= 0)) then
        m.faceAngle.y = m.intendedYaw
        m.forwardVel = m.forwardVel * 0.8
        if act == ACT_JUMP_KICK then
            return set_mario_action(m, ACT_AIR_THROW, 70)
        else
            return set_mario_action(m, ACT_THROWING, 70)
        end
    end
end
hook_event(HOOK_BEFORE_SET_MARIO_ACTION, mario_before_set_action)

---@param m MarioState
---@param o Object
---@param type InteractionType
local function mario_interact(m, o, type)
    local e = gPowerupStates[m.playerIndex]
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
    --     e.powerupFlags = 0
    -- end

    for bhv in pairs(vanillaPowerups) do
        if obj_has_behavior_id(o, bhv) ~= 0 then
            network_player_reset_override_palette(np)
            e.powerupStartTimer = 20
            e.powerupFlags = vanillaPowerups[bhv].pu
            if e.powerupStored == e.powerupFlags and e.overrideCapTimer then
                m.capTimer = e.capTimerSaved
                e.powerupStartTimer = 0
                e.overrideCapTimer = false
            end
        end
    end

    if (o.oInteractStatus & INT_STATUS_WAS_ATTACKED ~= 0 and m.action ~= ACT_TWIRLING) then
        spawn_powerup_from_bhv(m, o, 0, 15, o.oFaceAngleYaw, nil, SOUND_GENERAL_GRAND_STAR_JUMP)
    end
end
hook_event(HOOK_ON_INTERACT, mario_interact)

local function before_mario_interact(m, o, type)
    local e = gPowerupStates[m.playerIndex]
    local capFlag = get_mario_cap_flag(o)

    if o.oInteractType == INTERACT_CAP and m.action ~= ACT_GETTING_BLOWN and capFlag ~= MARIO_NORMAL_CAP then -- this method is from Sharen's Game Enhancer
        replaceStarSound = 1
        spawn_mist_particles()
    end

    for bhv in pairs(vanillaPowerups) do
        if obj_has_behavior_id(o, bhv) ~= 0 and m.flags & vanillaPowerups[bhv].checkFlag ~= 0 and e.powerupStored ~= vanillaPowerups[bhv].pu then
            store_powerup(m, vanillaPowerups[bhv].pu)
            e.overrideCapTimer = true
            e.capTimerSaved = m.capTimer
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