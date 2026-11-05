---@param proj Object -- projectile obj
---@param target Object -- the obj fireball hit
local function general_hit_disallow(proj, target)
    proj.oAction = -1
end
local function fire_hit_generic(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED | INT_STATUS_TOUCHED_BOB_OMB-- | ATTACK_FROM_ABOVE
    spawn_powerup_from_bhv(target, 0, 15, target.oFaceAngleYaw - 0x8000, nil)
    proj.oAction = 1
    if obj_has_behavior_id(target, id_bhvMoneybag) ~= 0 then
        target.parentObj.activeFlags = ACTIVE_FLAG_DEACTIVATED
        target.oAction = MONEYBAG_ACT_DEATH
        target.oTimer = 1
    elseif obj_has_behavior_id(target, id_bhvPiranhaPlant) ~= 0 then
        if target.oAction ~= PIRANHA_PLANT_ACT_ATTACKED then
            play_sound(SOUND_OBJ2_PIRANHA_PLANT_DYING, target.header.gfx.cameraToObject);
            -- Spawn 20 intangible purple particles that quickly dissipate.
            for i = 1, 20 do
                spawn_non_sync_object(id_bhvPurpleParticle, E_MODEL_PURPLE_MARBLE, target.oPosX, target.oPosY, target.oPosZ, nil);
            end
            stop_secondary_music(1000)
            target.oAction = PIRANHA_PLANT_ACT_ATTACKED
        else
            general_hit_disallow(proj, target)
        end
    end
end
local function fire_hit_snowman(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    for i=0, 2 do
        spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    end
    spawn_powerup_from_bhv(target, 0, 15, target.oFaceAngleYaw, nil)
    target.oFaceAngleRoll = 0x3000
    target.oMrBlizzardHeldObj = nil
    target.prevObj = target.oMrBlizzardHeldObj
    if target.oAnimState ~= 0 then
        save_file_clear_flags(SAVE_FLAG_CAP_ON_MR_BLIZZARD);

        spawn_non_sync_object(id_bhvNormalCap, E_MODEL_MARIOS_CAP, target.oPosX, target.oPosY, target.oPosZ, function(cap)
            cap.oFaceAngleYaw = target.oFaceAngleYaw
            cap.oForwardVel = 0
            cap.oVelY = 30
        end)

        -- Mr. Blizzard no longer spawns with Mario's cap on.
        target.oAnimState = 0
    end
    obj_mark_for_deletion(target)
    proj.oAction = 1
end
local function fire_hit_heaveho(proj, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_GENERAL_BREAK_BOX, target.header.gfx.cameraToObject)
    spawn_triangle_break_particles(30, 138, 3.0, 4)
    obj_mark_for_deletion(target)
    proj.oAction = 1
end
local function fire_hit_eyeball(proj, target)
    if target.header.gfx.scale.y > 1 then
        general_hit_disallow(proj, target)
        return
    end
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_OBJ_MRI_DEATH, target.header.gfx.cameraToObject)
    obj_mark_for_deletion(target)
    proj.oAction = 1
end
local function fire_hit_bully(proj, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.oMoveAngleYaw = proj.oMoveAngleYaw
    target.oForwardVel = proj.oBehParams == POWERUP_GOLD and 60 or 30
    proj.oAction = 1
end
local function fire_hit_small_box(proj, target)
    for i=0, 2 do
        spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, function(coin)
            coin.oVelY = 20
        end)
    end
    create_sound_spawner(SOUND_GENERAL_BREAK_BOX)
    obj_mark_for_deletion(target)
    proj.oAction = 1
end
local function fire_hit_boo_boss(proj, target)
    if target.oAction ~= 3 then
        target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
        proj.oAction = 1
    else
        general_hit_disallow(proj, target)
    end
end
local function fire_hit_bowser(proj, target)
    local oBowser = target.parentObj
    if oBowser.oAction ~= 19 and oBowser.oAction ~= 4 and oBowser.oAction ~= 12 then
        oBowser.oMoveFlags = 0
        oBowser.oSubAction = 0
        oBowser.oMoveAngleYaw = proj.oMoveAngleYaw + 0x8000
        oBowser.oFaceAngleYaw = oBowser.oMoveAngleYaw + 0x8000
        oBowser.oAction = 1
        oBowser.oForwardVel = proj.oBehParams == POWERUP_GOLD and -40 or -20
        oBowser.oVelY = proj.oBehParams == POWERUP_GOLD and 60 or 40
        proj.oAction = 1
    else
        general_hit_disallow(proj, target)
    end
    obj_mark_for_deletion(proj)
end

---@param proj Object
---@param target Object
local function fire_hit_mario(proj, target)
    local m = get_mario_state_from_object(target)
    if not m then return end
    if network_local_index_from_global(proj.globalPlayerIndex) == m.playerIndex then return end

    if m.action == ACT_BUBBLED then
        mario_pop_bubble(m)
        proj.oAction = 1
        return
    end

    if gServerSettings.playerInteractions == PLAYER_INTERACTIONS_NONE then return end
    if is_player_active(m) == 0 or m.invincTimer ~= 0 then return end

    if m.action & (ACT_FLAG_INTANGIBLE | ACT_FLAG_INVULNERABLE) == 0 then
        if gServerSettings.playerInteractions == PLAYER_INTERACTIONS_PVP then
            m.hurtCounter = 4
        end
        m.faceAngle.y = proj.oMoveAngleYaw + 0x8000
        set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
        proj.oAction = 1
        return
    end
end

local function ice_hit_genertic_freeze(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.activeFlags = target.activeFlags | ACTIVE_FLAG_DEACTIVATED
    target.header.gfx.shadowInvisible = true
    proj.oAction = 1
    if m.playerIndex == 0 then
        spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
            cube.oNumLootCoins = 3
            spawn_powerup_from_bhv(target, 0, 0, target.oFaceAngleYaw, cube)
            cube.oFaceAngleYaw = target.oFaceAngleYaw
            if obj_has_behavior_id(target, id_bhvGoomba) ~= 0 then
                obj_scale(cube, target.header.gfx.scale.y*0.75)
            end
        end)
    end
end
local function ice_hit_bobomb_freeze(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    proj.oAction = 1
    if target.oBehParams ~= 0x100 then -- bobomb has coin
        obj_spawn_yellow_coins(target, 1)
    end
    if m.playerIndex == 0 then
        spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
            cube.oNumLootCoins = 3
            cube.oMoveAngleYaw = target.oMoveAngleYaw
        end)
    end
    obj_mark_for_deletion(target)
end
local function ice_hit_bluecoin_freeze(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    proj.oAction = 1
    if m.playerIndex == 0 then
        spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
            cube.oNumLootCoins = 3
            cube.oMoveAngleYaw = target.oMoveAngleYaw
        end)
    end

    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    obj_mark_for_deletion(target)
end
local function ice_hit_goomba_or_koopa_freeze(proj, target)
    if target.header.gfx.scale.y <= 0.9 then return end
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    proj.oAction = 1
    if m.playerIndex == 0 then
        spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
            cube.oNumLootCoins = 3
            cube.oMoveAngleYaw = target.oMoveAngleYaw
            obj_scale(cube, target.header.gfx.scale.y*0.7)
        end)
    end
    if target.header.gfx.scale.y > 1.5 or obj_has_behavior_id(target, id_bhvKoopa) ~= 0 then
        spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    else
        obj_spawn_loot_yellow_coins(target, 1, 0)
    end
    obj_mark_for_deletion(target)
end

---@param proj Object
---@param target Object
local function ice_hit_mario_freeze(proj, target)
    local m = get_mario_state_from_object(target)
    if not m then return end
    if network_local_index_from_global(proj.globalPlayerIndex) == m.playerIndex then return end

    if m.action == ACT_BUBBLED then
        mario_pop_bubble(m)
        proj.oAction = 1
        return
    end

    if gServerSettings.playerInteractions == PLAYER_INTERACTIONS_NONE then return end
    if is_player_active(m) == 0 or m.invincTimer ~= 0 then return end

    if m.action & (ACT_FLAG_INTANGIBLE | ACT_FLAG_INVULNERABLE) == 0 then
        if m.playerIndex == 0 then
            local oCube = spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
                cube.usingObj = m.marioObj
                cube.globalPlayerIndex = network_global_index_from_local(0) + 1
                cube.oInteractStatus = INT_STATUS_GRABBED_MARIO
                cube.oMoveAngleYaw = m.faceAngle.y
                obj_scale(cube, target.header.gfx.scale.y)
            end)
            m.heldByObj = oCube
            set_mario_action(m, ACT_GRABBED, 0)
        end
        proj.oAction = 1
        return
    end
end

local function bubble_hit_generic_loot_coins(proj, target)
    if (obj_has_behavior_id(target, id_bhvGoomba) ~= 0) then
        if target.header.gfx.scale.y <= 0.5 then
            return
        elseif target.header.gfx.scale.y > 1.5 then
            general_hit_disallow(proj, target)
        else
            obj_mark_for_deletion(target)
        end
    elseif (obj_has_behavior_id(target, id_bhvPokeyBodyPart) ~= 0) then
        if target.oNumLootCoins > 0 then
            target.oNumLootCoins = 5
            target.parentObj.oPokeyHeadWasKilled = 1
            obj_mark_for_deletion(target)
        end
    end
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    proj.oNumLootCoins = target.oNumLootCoins
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.oNumLootCoins = 0
    target.activeFlags = target.activeFlags | ACTIVE_FLAG_DEACTIVATED
    target.header.gfx.shadowInvisible = true
    spawn_mist_particles_with_sound(SOUND_ACTION_SWIM_FAST)
    spawn_visual_coins(proj, proj.oNumLootCoins)
    spawn_powerup_from_bhv(target, 0, 15, target.oFaceAngleYaw, proj)
end
local function bubble_hit_generic_bluecoin(proj, target)
    --local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    --local m = get_mario_state_from_object(nearestMarioObject)
    proj.oNumLootCoins = 5
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.activeFlags = target.activeFlags | ACTIVE_FLAG_DEACTIVATED
    target.header.gfx.shadowInvisible = true
    spawn_mist_particles_with_sound(SOUND_ACTION_SWIM_FAST)
    spawn_visual_coins(proj, proj.oNumLootCoins)
    --spawn_powerup_from_bhv(target, 0, 15, target.oFaceAngleYaw, bubble)
    obj_mark_for_deletion(target)
end
local function bubble_hit_bobomb(proj, target)
    if target.oBehParams ~= 0x100 then -- bobomb has coin
        proj.oNumLootCoins = 1
    end
    spawn_mist_particles_with_sound(SOUND_ACTION_SWIM_FAST)
    spawn_visual_coins(proj, proj.oNumLootCoins)
    obj_mark_for_deletion(target)
end
local function bubble_hit_box(proj, target)
    proj.oNumLootCoins = 3
    spawn_mist_particles_with_sound(SOUND_ACTION_SWIM_FAST)
    spawn_visual_coins(proj, proj.oNumLootCoins)
    obj_mark_for_deletion(target)
end
local function bubble_hit_snowman(proj, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oFaceAngleRoll = 0x3000
    target.oMrBlizzardHeldObj = nil
    target.prevObj = target.oMrBlizzardHeldObj
    if target.oAnimState ~= 0 then
        save_file_clear_flags(SAVE_FLAG_CAP_ON_MR_BLIZZARD);

        spawn_non_sync_object(id_bhvNormalCap, E_MODEL_MARIOS_CAP, target.oPosX, target.oPosY, target.oPosZ, function(cap)
            cap.oFaceAngleYaw = target.oFaceAngleYaw
            cap.oForwardVel = 0
            cap.oVelY = 30
        end)

        -- Mr. Blizzard no longer spawns with Mario's cap on.
        target.oAnimState = 0
    end
    spawn_mist_particles_with_sound(SOUND_ACTION_SWIM_FAST)
    spawn_powerup_from_bhv(target, 0, 15, target.oFaceAngleYaw, proj)
    obj_mark_for_deletion(target)
end

projectileHitInteracts = {
    [id_bhvMario] = {
        [POWERUP_FIRE] = fire_hit_mario,
        [POWERUP_ICE] = ice_hit_mario_freeze,
    },
    [id_bhvGoomba] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_goomba_or_koopa_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvBobomb] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_bobomb_freeze,
        [POWERUP_BUBBLE] = bubble_hit_bobomb,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvKoopa] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_goomba_or_koopa_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_bluecoin,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvMontyMole] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvBoo] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvGhostHuntBoo] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvMerryGoRoundBoo] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvGhostHuntBigBoo] = {
        [POWERUP_FIRE] = fire_hit_boo_boss,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_boo_boss,
    },
    [id_bhvBalconyBigBoo] = {
        [POWERUP_FIRE] = fire_hit_boo_boss,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_boo_boss,
    },
    [id_bhvMerryGoRoundBigBoo] = {
        [POWERUP_FIRE] = fire_hit_boo_boss,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_boo_boss,
    },
    [id_bhvFlyingBookend] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_bluecoin,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvSkeeter] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvMoneybag] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvSnufit] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvSwoop] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvFirePiranhaPlant] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvEnemyLakitu] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvPokeyBodyPart] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvEyerokHand] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvScuttlebug] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvSmallBully] = {
        [POWERUP_FIRE] = fire_hit_bully,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bully,
    },
    [id_bhvBigBully] = {
        [POWERUP_FIRE] = fire_hit_bully,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bully,
    },
    [id_bhvBigBullyWithMinions] = {
        [POWERUP_FIRE] = fire_hit_bully,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bully,
    },
    [id_bhvSmallChillBully] = {
        [POWERUP_FIRE] = fire_hit_bully,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bully,
    },
    [id_bhvBigChillBully] = {
        [POWERUP_FIRE] = fire_hit_bully,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bully,
    },
    [id_bhvSpindrift] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvFlyGuy] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_genertic_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_loot_coins,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvMrBlizzard] = {
        [POWERUP_FIRE] = fire_hit_snowman,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = bubble_hit_snowman,
        [POWERUP_GOLD] = fire_hit_snowman,
    },
    [id_bhvHeaveHo] = {
        [POWERUP_FIRE] = fire_hit_heaveho,
        [POWERUP_ICE] = ice_hit_bluecoin_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_bluecoin,
        [POWERUP_GOLD] = fire_hit_heaveho,
    },
    [id_bhvMrI] = {
        [POWERUP_FIRE] = fire_hit_eyeball,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = bubble_hit_generic_bluecoin,
        [POWERUP_GOLD] = fire_hit_eyeball,
    },
    [id_bhvBreakableBox] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvBreakableBoxSmall] = {
        [POWERUP_FIRE] = fire_hit_small_box,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = bubble_hit_box,
        [POWERUP_GOLD] = fire_hit_small_box,
    },
    [id_bhvHauntedChair] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = ice_hit_bluecoin_freeze,
        [POWERUP_BUBBLE] = bubble_hit_generic_bluecoin,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvBowserBodyAnchor] = {
        [POWERUP_FIRE] = fire_hit_bowser,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_bowser,
    },
    [id_bhvChuckya] = {
        [POWERUP_FIRE] = general_hit_disallow,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = function(proj, target)
            obj_mark_for_deletion(target);
            obj_spawn_loot_yellow_coins(target, 5, 20);
            spawn_mist_particles_with_sound(SOUND_OBJ_CHUCKYA_DEATH);
            proj.oAction = 1
        end,
    },
    [id_bhvIceCube] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvFirePiranhaPlant] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvPiranhaPlant] = {
        [POWERUP_FIRE] = fire_hit_generic,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = fire_hit_generic,
    },
    [id_bhvSmallWhomp] = {
        [POWERUP_FIRE] = general_hit_disallow,
        [POWERUP_ICE] = general_hit_disallow,
        [POWERUP_BUBBLE] = general_hit_disallow,
        [POWERUP_GOLD] = function(proj, target)
            target.oNumLootCoins = 5;
            obj_spawn_loot_yellow_coins(target, 5, 20);
            target.oAction = 8;
            proj.oAction = 1
        end,
    },
    [id_bhvThwomp] = {
        [POWERUP_FIRE] = nil,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = function(proj, target)
            obj_spawn_loot_yellow_coins(target, 10, 20)
            spawn_triangle_break_particles(20, 138, 3.0, 4);
            play_sound_with_freq_scale(SOUND_OBJ_THWOMP, target.header.gfx.cameraToObject, 0.8)
            obj_mark_for_deletion(target)
            proj.oAction = 1
        end
    },
    [id_bhvThwomp2] = {
        [POWERUP_FIRE] = nil,
        [POWERUP_ICE] = nil,
        [POWERUP_BUBBLE] = nil,
        [POWERUP_GOLD] = function(proj, target)
            obj_spawn_loot_yellow_coins(target, 10, 20)
            spawn_triangle_break_particles(20, 138, 3.0, 4);
            play_sound_with_freq_scale(SOUND_OBJ_THWOMP, target.header.gfx.cameraToObject, 0.8)
            obj_mark_for_deletion(target)
            proj.oAction = 1
        end
    },
}