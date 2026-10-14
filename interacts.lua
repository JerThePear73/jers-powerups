local fireballHitSound = SOUND_ACTION_HIT

---@param fireball Object -- fireball obj
---@param target Object -- the obj fireball hit
local function fire_hit_generic(fireball, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED | INT_STATUS_TOUCHED_BOB_OMB-- | ATTACK_FROM_ABOVE
    spawn_powerup_from_bhv(m, target, 0, 15, fireball.oMoveAngleYaw - 0x8000, nil, SOUND_GENERAL_GRAND_STAR_JUMP)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_snowman(fireball, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    for i=0, 2 do
        spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    end
    spawn_powerup_from_bhv(m, target, 0, 15, target.oFaceAngleYaw, nil, SOUND_GENERAL_GRAND_STAR_JUMP)
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
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_heaveho(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_GENERAL_BREAK_BOX, target.header.gfx.cameraToObject)
    spawn_triangle_break_particles(30, 138, 3.0, 4)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_eyeball(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_OBJ_MRI_DEATH, target.header.gfx.cameraToObject)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_bully(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.oMoveAngleYaw = fireball.oMoveAngleYaw
    target.oForwardVel = 30
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_bowser(fireball, target)
    local oBowser = target.parentObj
    if oBowser.oAction ~= 19 and oBowser.oAction ~= 4 and oBowser.oAction ~= 12 then
        oBowser.oMoveFlags = 0
        oBowser.oSubAction = 0
        oBowser.oMoveAngleYaw = fireball.oMoveAngleYaw + 0x8000
        oBowser.oFaceAngleYaw = oBowser.oMoveAngleYaw + 0x8000
        oBowser.oAction = 1
        oBowser.oForwardVel = -15
        oBowser.oVelY = 30
        spawn_mist_particles_with_sound(fireballHitSound)
    else
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
    end
    obj_mark_for_deletion(fireball)
end

local function fire_hit_stop(fireball, target)
    spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
    obj_mark_for_deletion(fireball)
end

---@param iceball Object -- iceball obj
---@param target Object -- the obj iceball hit
local function ice_hit_genertic_freeze(iceball, target)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(target, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oNumLootCoins = 3
        spawn_powerup_from_bhv(m, target, 0, 0, cube.oFaceAngleYaw, cube, nil)
        cube.oFaceAngleYaw = target.oFaceAngleYaw
    end)
end
local function ice_hit_goomba_freeze(iceball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oNumLootCoins = 3
        cube.oMoveAngleYaw = target.oMoveAngleYaw
        obj_scale(cube, target.header.gfx.scale.y*0.7)
    end)

    spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    obj_mark_for_deletion(target)
end
local function ice_hit_bobomb_freeze(iceball, target)
    obj_mark_for_deletion(iceball)
    if target.oBehParams ~= 0x100 then -- bobomb has coin
        obj_spawn_yellow_coins(target, 1)
    end
    spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oNumLootCoins = 3
        cube.oMoveAngleYaw = target.oMoveAngleYaw
    end)
    obj_mark_for_deletion(target)
end
local function ice_hit_bluecoin_freeze(iceball, target)
    target.oInteractStatus = target.oInteractStatus | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_NONE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oNumLootCoins = 3
        cube.oMoveAngleYaw = target.oMoveAngleYaw
    end)

    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    obj_mark_for_deletion(target)
end

projectileHitInteracts = {
    [id_bhvGoomba]              = {fire = fire_hit_generic,     ice = ice_hit_goomba_freeze},
    [id_bhvBobomb]              = {fire = fire_hit_generic,     ice = ice_hit_bobomb_freeze},
    [id_bhvKoopa]               = {fire = fire_hit_generic,     ice = ice_hit_bluecoin_freeze},
    [id_bhvMontyMole]           = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvBoo]                 = {fire = fire_hit_generic,     ice = nil},
    [id_bhvGhostHuntBoo]        = {fire = fire_hit_generic,     ice = nil},
    [id_bhvMerryGoRoundBoo]     = {fire = fire_hit_generic,     ice = nil},
    [id_bhvGhostHuntBigBoo]     = {fire = fire_hit_generic,     ice = nil},
    [id_bhvBalconyBigBoo]       = {fire = fire_hit_generic,     ice = nil},
    [id_bhvMerryGoRoundBigBoo]  = {fire = fire_hit_generic,     ice = nil},
    [id_bhvFlyingBookend]       = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSkeeter]             = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvMoneybag]            = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSnufit]              = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSwoop]               = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvFirePiranhaPlant]    = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvEnemyLakitu]         = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvPokey]               = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvPokeyBodyPart]       = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvSkeeter]             = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvEyerokHand]          = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvScuttlebug]          = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSmallBully]          = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigBully]            = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigBullyWithMinions] = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvSmallChillBully]     = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigChillBully]       = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvSpindrift]           = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvFlyGuy]              = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvMrBlizzard]          = {fire = fire_hit_snowman,     ice = fire_hit_stop},
    [id_bhvHeaveHo]             = {fire = fire_hit_heaveho,     ice = ice_hit_bluecoin_freeze},
    [id_bhvMrI]                 = {fire = fire_hit_eyeball,     ice = fire_hit_stop},
    [id_bhvBreakableBox]        = {fire = fire_hit_generic,     ice = nil},
    [id_bhvBreakableBoxSmall]   = {fire = fire_hit_generic,         ice = nil},
    [id_bhvHauntedChair]        = {fire = fire_hit_generic,     ice = ice_hit_bluecoin_freeze},
    [id_bhvBowserBodyAnchor]    = {fire = fire_hit_bowser,      ice = fire_hit_stop},
    [id_bhvChuckya]             = {fire = fire_hit_stop,        ice = fire_hit_stop},
    [id_bhvIceCube]             = {fire = fire_hit_generic,         ice = nil},
}