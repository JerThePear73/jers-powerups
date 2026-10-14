---@param o Object
local function bhv_starman_init(o)
    local m = gMarioStates[0]

    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    cur_obj_play_sound_2(SOUND_GENERAL_COIN_SPURT)
    spawn_mist_particles()

    obj_scale(o, 0.7)
    o.hitboxRadius = 50
    o.hitboxHeight = 50
    o.oIntangibleTimer = 0
    o.oGravity = 2
    o.oFriction = 1

    o.oFaceAngleYaw = m.faceAngle.y
    o.oForwardVel = 15
    o.oVelY = 10

    o.oBuoyancy = 0.9
    o.hitboxDownOffset = 20
    o.oDrawingDistance = 4000
    o.oGraphYOffset = 0
end
local function bhv_starman_loop(o)
    object_step()
    load_object_collision_model()
    local m = gMarioStates[0]
    local e = gPowerupStates[0]
    local range = 25

    o.oFaceAngleYaw = o.oFaceAngleYaw + 0x500
    o.oFaceAnglePitch = 0
    o.oFaceAngleRoll = 0

    cur_obj_update_floor_and_walls()
    if o.oPosY < (o.oFloorHeight + 55) then
        o.oVelY = 30
    end

    spawn_non_sync_object(
        id_bhvSparkle,
        E_MODEL_SPARKLES_ANIMATION,
        (o.oPosX + math.random(-range, range)),
        (o.oPosY + math.random(-range, range)),
        (o.oPosZ + math.random(-range, range)),
        nil)

    if obj_check_hitbox_overlap(m.marioObj, o) then
        m.capTimer = 30*30
        obj_mark_for_deletion(o)
        cur_obj_play_sound_2(SOUND_MENU_STAR_SOUND)
        play_character_sound(m, CHAR_SOUND_HERE_WE_GO)
        e.hasStarman = true
        e.starmanTimer = 0
        m.flags = m.flags & ~MARIO_WING_CAP
        m.flags = m.flags & ~MARIO_VANISH_CAP
        m.flags = m.flags & ~MARIO_METAL_CAP
        --play_cap_music(0)
    end
end
id_bhvPowerupStar = hook_behavior(nil, OBJ_LIST_GENACTOR, true, bhv_starman_init, bhv_starman_loop, "bhvPowerupStar")

---@param o Object
local function bhv_general_powerup_init(o)
    local model = E_MODEL_1UP
    local hitboxSize = 50
    o.oInteractType = INTERACT_CAP
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.hitboxRadius      = hitboxSize
    o.hitboxHeight      = hitboxSize
    o.oGravity          = 1
    o.oFriction         = 0
    o.oBuoyancy         = 1.5
    o.hitboxDownOffset  = 0
    o.oDrawingDistance  = 4000
    o.oGraphYOffset     = 0
    o.oCapUnkF4         = 0
    o.oCapUnkF8         = 0x4000
    o.oTimer            = 0
    o.oFaceAngleYaw     = o.oMoveAngleYaw

    if powerupData[o.oBehParams] ~= nil then
        model = powerupData[o.oBehParams].model
    end
    obj_set_model_extended(o, model)
    obj_scale(o, 1)
    --spawn_mist_particles_with_sound(SOUND_GENERAL_GRAND_STAR_JUMP)
    cur_obj_become_tangible()
end
local function bhv_general_powerup_loop(o)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(o, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    local e = gPowerupStates[m.playerIndex]

    local step = object_step_without_floor_orient()
    if step & OBJ_COL_FLAG_GROUNDED ~= 0 then
        if o.oVelY ~= 0.0 then
            o.oCapUnkF4 = 1
            o.oVelY = 0
        end
    end
    if step & OBJ_COL_FLAG_UNDERWATER == 0 and o.oVelY ~= 0 then
        local range = 40
        local sparkleX = o.oPosX + math.random(-range, range)
        local sparkleY = o.oPosY + math.random(-range, range)
        local sparkleZ = o.oPosZ + math.random(-range, range)
        local sparkleScale = math.random(1, 8)/10
        spawn_non_sync_object(id_bhvCoinSparkles, E_MODEL_SPARKLES_ANIMATION, sparkleX, sparkleY, sparkleZ, function(sparkle)
            obj_scale(sparkle, sparkleScale)
        end)
    end
    if o.oVelY ~= 0 then
        o.oTimer = 0
    end

    if obj_has_behavior_id(o.parentObj, id_bhvIceCube) ~= 0 then
        o.oPosX = o.parentObj.oPosX
        o.oPosY = o.parentObj.oPosY + 40
        o.oPosZ = o.parentObj.oPosZ
        o.oMoveAngleYaw = o.parentObj.oFaceAngleYaw
        o.oFaceAngleYaw = o.parentObj.parentObj.oMoveAngleYaw
        o.oMoveAnglePitch = 0
        o.oMoveAngleRoll = 0
        o.oFaceAnglePitch = 0
        o.oFaceAngleRoll = 0
        o.oVelX = 0
        o.oVelY = 0
        o.oVelZ = 0
        o.oForwardVel = 0
        o.oTimer = 0
    end

    o.oFaceAnglePitch = 0
    o.oFaceAngleRoll = 0

    if o.oCapUnkF4 == 1 then
        o.oCapUnkF8 = o.oCapUnkF8 + 0x1000;
        o.header.gfx.scale.y = coss(o.oCapUnkF8) * 0.3 + 0.7;
        if (o.oCapUnkF8 == 0x10000) then
           o.oCapUnkF8 = 0;
           o.oCapUnkF4 = 2;
        end
    -- elseif o.oCapUnkF4 == 0 then
    --     local range = 40
    --     local sparkleX = o.oPosX + math.random(-range, range)
    --     local sparkleY = o.oPosY + math.random(-range, range)
    --     local sparkleZ = o.oPosZ + math.random(-range, range)
    --     local sparkleScale = math.random(1, 8)/10
    --     spawn_non_sync_object(id_bhvCoinSparkles, E_MODEL_SPARKLES_ANIMATION, sparkleX, sparkleY, sparkleZ, function(sparkle)
    --         obj_scale(sparkle, sparkleScale)
    --     end)
    end

    obj_flicker_and_disappear(o, powerupDespawnTime)

    if obj_check_hitbox_overlap(nearestMarioObject, o) then
        if o.oBehParams ~= nil then
            if e.powerupFlags == o.oBehParams then --and e.powerupStored ~= o.oBehParams then -- this doesn't sync properly for some reason so for now custom powerups will just always be stored.
                store_powerup(m, o.oBehParams)
                obj_mark_for_deletion(o)
                return
            else
                e.powerupStartTimer = 20
                spawn_mist_particles_with_sound(SOUND_MENU_EXIT_PIPE)
                play_character_sound(m, CHAR_SOUND_HERE_WE_GO)
                e.powerupFlags = o.oBehParams
                m.capTimer = powerupTime*30
                m.flags = m.flags & ~MARIO_WING_CAP
                m.flags = m.flags & ~MARIO_VANISH_CAP
                m.flags = m.flags & ~MARIO_METAL_CAP
                stop_cap_music()
            end
        end
        obj_mark_for_deletion(o)
        return
    end
end
id_bhvGeneralPowerup = hook_behavior(nil, OBJ_LIST_GENACTOR, true, bhv_general_powerup_init, bhv_general_powerup_loop, "bhvGeneralPowerup")

---@param o Object
local function bhv_projectile_init(o)
    local hitboxSize = 300
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.activeFlags = o.activeFlags | ACTIVE_FLAG_UNK9
    o.oGraphYOffset         = 40
    o.oGravity              = 4
    o.oBounciness           = 0
    o.oDragStrength         = 0
    o.oFriction             = 1
    o.oBuoyancy             = -2
    o.oWallHitboxRadius     = 0
    o.hitboxDownOffset      = hitboxSize/2
    o.hitboxRadius          = hitboxSize/15
    o.hitboxHeight          = hitboxSize
    o.hurtboxRadius         = hitboxSize/15
    o.hurtboxHeight         = hitboxSize
    o.oDamageOrCoinValue    = 0
    o.oForwardVel           = 65
    o.oTimer                = 0
    cur_obj_become_tangible()
end
local function bhv_projectile_loop(o)
    local isIceball = o.oBehParams == 1
    local projectileLifetime = isIceball and iceballLifetime or fireballLifetime
    local particleType = isIceball and E_MODEL_POWERUP_SNOWFLAKE or E_MODEL_RED_FLAME

    local step = object_step_without_floor_orient()
    if step & OBJ_COL_FLAGS_LANDED ~= 0 then
        o.oVelY = 30
    end
    if step & OBJ_COL_FLAG_HIT_WALL ~= 0 then
        o.oForwardVel = 30
    else
        o.oForwardVel = 65
    end
    local targetDist = 0x20000
    for key, hit_effect in pairs(projectileHitInteracts) do
        local hitObj = cur_obj_nearest_object_with_behavior(get_behavior_from_id(key))
        if hitObj ~= nil then
            if projectileHitInteracts[key] ~= nil then
                local dist = dist_between_objects(o, hitObj)
                if dist < targetDist then
                    targetDist = dist
                end
                if obj_check_hitbox_overlap(o, hitObj) then
                    if isIceball then
                        if projectileHitInteracts[key].ice ~= nil then
                            hit_effect.ice(o, hitObj)
                        end
                    else
                        if projectileHitInteracts[key].fire ~= nil then
                            hit_effect.fire(o, hitObj)
                        end
                    end
                end
            end
        end
    end
    local range = 20
    local offsetX = math.random(-range, range)
    local offsetY = math.random(-range, range) + o.oGraphYOffset/2
    local offsetZ = math.random(-range, range)
    spawn_non_sync_object(id_bhvCoinSparkles, particleType, o.oPosX + offsetX, o.oPosY + offsetY, o.oPosZ + offsetZ, function(trail)
        obj_scale(trail, 1)
    end)
    o.oFaceAnglePitch = o.oFaceAnglePitch + 0x1200
    o.oFaceAngleYaw = o.oMoveAngleYaw
    if step & OBJ_COL_FLAG_UNDERWATER ~= 0 then
        if not isIceball then
        spawn_mist_particles_with_sound(SOUND_GENERAL_FLAME_OUT)
        obj_mark_for_deletion(o)
        return
        else
            o.oVelY = 30
        end
    elseif o.oTimer >= projectileLifetime  then
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
        obj_mark_for_deletion(o)
        return
    end
end
id_bhvFireOrIceball = hook_behavior(nil, OBJ_LIST_GENACTOR, true, bhv_projectile_init, bhv_projectile_loop, "bhvFireOrIceball")

---@param o Object
local function bhv_icecube_init(o)
    local scaleOffset = o.header.gfx.scale.y * 0.9
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.activeFlags = ACTIVE_FLAG_ACTIVE
    o.oGraphYOffset         = 0
    o.oGravity              = 0
    o.oBounciness           = 0
    o.oDragStrength         = 0
    o.oFriction             = 0
    o.oBuoyancy             = 0
    o.oTimer                = 0
    o.collisionData         = gGlobalObjectCollisionData.breakable_box_seg8_collision_08012D70
    o.oCollisionDistance    = 600
    o.oMoveAngleRoll        = 0
    o.oMoveAnglePitch       = 0
    o.header.gfx.scale.x    = scaleOffset
    o.header.gfx.scale.y    = scaleOffset
    o.header.gfx.scale.z    = scaleOffset
    o.oInteractType         = INTERACT_BREAKABLE
    o.oHealth               = 1
    o.hitboxRadius          = 150 -- not scaling this with obj scale makes it so you can't punch or kick a big cube, must GP or fireball it
    o.hitboxHeight          = 200
    o.hurtboxRadius         = 150
    o.hurtboxHeight         = 200
    o.oAction               = 0
    cur_obj_become_tangible()
    obj_set_model_extended(o, E_MODEL_POWERUP_ICECUBE)
    spawn_mist_particles_with_sound(SOUND_OBJ_BIG_PENGUIN_WALK)
    spawn_mist_particles_with_sound(SOUND_OBJ_BIG_PENGUIN_WALK)

    spawn_visual_coins(o)
end
local function bhv_icecube_loop(o)
    local icecubeDurr = iceballLifetime * 4 -- 3
    load_object_collision_model()

    if cur_obj_was_attacked_or_ground_pounded() ~= 0 then
        o.oInteractStatus = o.oInteractStatus | INT_STATUS_WAS_ATTACKED
    elseif o.oTimer >= icecubeDurr then
        o.oAction = -1
    end
    if o.oInteractStatus == INT_STATUS_WAS_ATTACKED then
        o.oAction = -1
    end

    if o.oAction == -1 then
        play_sound_with_freq_scale(SOUND_GENERAL2_BOBOMB_EXPLOSION, o.header.gfx.cameraToObject, 10)
        spawn_triangle_break_particles(10, 139, 0.3, 2)
        if o.oTimer < icecubeDurr and o.oNumLootCoins == 3 then
            obj_spawn_loot_yellow_coins(o, 3, 0)
        end
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED
    end

    if o.oTimer > icecubeDurr - 30 then
        if o.oTimer % 3 == 0 then
            cur_obj_hide()
        else
            cur_obj_unhide()
        end
    end

    if o.activeFlags == ACTIVE_FLAG_DEACTIVATED then
        o.oNumLootCoins = 0
        obj_mark_for_deletion(o)
    end
end
id_bhvIceCube = hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_icecube_init, bhv_icecube_loop, "bhvIceCube")

local function bhv_visual_coins_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.oAnimState = 0
    cur_obj_become_intangible()
    obj_set_billboard(o)
end
local function bhv_visual_coins_loop(o)
    local coinLayout = {
        {x = o.parentObj.oPosX,         y = o.parentObj.oPosY + ((o.parentObj.hitboxHeight * o.parentObj.header.gfx.scale.y)/2 - 100),  z = o.parentObj.oPosZ},
        {x = o.parentObj.oPosX - 30,    y = o.parentObj.oPosY + ((o.parentObj.hitboxHeight * o.parentObj.header.gfx.scale.y)/2 - 10),   z = o.parentObj.oPosZ - 30},
        {x = o.parentObj.oPosX + 30,    y = o.parentObj.oPosY + ((o.parentObj.hitboxHeight * o.parentObj.header.gfx.scale.y)/2 - 10),   z = o.parentObj.oPosZ + 30},
    }
    o.oAnimState = o.oAnimState + 1
    if o.parentObj then
        o.oPosX = coinLayout[o.oBehParams].x
        o.oPosY = coinLayout[o.oBehParams].y
        o.oPosZ = coinLayout[o.oBehParams].z
        if o.parentObj.oNumLootCoins == 0 or o.parentObj.header.gfx.scale.y < 0.5 then
            obj_mark_for_deletion(o)
        end
    end
end
id_bhvVisualCoins = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, true, bhv_visual_coins_init, bhv_visual_coins_loop, "bhvVisualCoins")

------------------------
-- VANILLA BEHAVIOURS --
------------------------

local function bhv_powerup_snowman_loop(o)
    local nearestMarioObject = obj_get_nearest_object_with_behavior_id(o, id_bhvMario)
    local m = get_mario_state_from_object(nearestMarioObject)
    if o.oAction == MR_BLIZZARD_ACT_DEATH and o.oTimer == 63 and math.abs(o.oFaceAngleRoll) == 0x4000 then
        spawn_powerup_from_bhv(m, o, 0, 15, o.oFaceAngleYaw, nil, SOUND_GENERAL_GRAND_STAR_JUMP)
    end
end
hook_behavior(id_bhvMrBlizzard, get_object_list_from_behavior(get_behavior_from_id(id_bhvMrBlizzard)), false, nil, bhv_powerup_snowman_loop, "bhvMrBlizzardPowerup")

local function bhv_powerup_item_box_loop(o)
    -- oBehParams2ndByte determins what is in the box
    -- it's an index for a table in exclamation_box.inc.c

    --  0 = EXCLAMATION_BOX_BP_WING_CAP
    --  1 = EXCLAMATION_BOX_BP_METAL_CAP
    --  2 = EXCLAMATION_BOX_BP_VANISH_CAP
    --  3 = EXCLAMATION_BOX_BP_KOOPA_SHELL
    --  4 = EXCLAMATION_BOX_BP_ONE_COIN
    --  5 = EXCLAMATION_BOX_BP_THREE_COINS
    --  6 = EXCLAMATION_BOX_BP_TEN_COINS
    --  7 = EXCLAMATION_BOX_BP_1UP_WALKING
    --  8 = EXCLAMATION_BOX_BP_STAR_ACT_1 -- sm64 devs trying to make a table that makes sense:
    --  9 = EXCLAMATION_BOX_BP_1UP_RUNNING_AWAY
    -- 10 = EXCLAMATION_BOX_BP_STAR_ACT_2
    -- 11 = EXCLAMATION_BOX_BP_STAR_ACT_3
    -- 12 = EXCLAMATION_BOX_BP_STAR_ACT_4
    -- 13 = EXCLAMATION_BOX_BP_STAR_ACT_5
    -- 14 = EXCLAMATION_BOX_BP_STAR_ACT_6
    -- 15 = EXCLAMATION_BOX_BP_END

    if (o.oBehParams2ndByte >= 4 and o.oBehParams2ndByte <= 9) and o.oBehParams2ndByte ~= 8 then
        if o.oAction == 3 then
            if o.oTimer == 5 then
                o.oBehParams = math.random(1, #powerupData)
            elseif o.oTimer == 6 then
                spawn_powerup_manual(o.oPosX, o.oPosY, o.oPosZ, 5, 15, math.random(0, 0x10000), o.oBehParams, SOUND_GENERAL_GRAND_STAR_JUMP)
            end
        end
    end
end
hook_behavior(id_bhvExclamationBox, get_object_list_from_behavior(get_behavior_from_id(id_bhvExclamationBox)), false, nil, bhv_powerup_item_box_loop, "bhvExclamationBoxPowerup")