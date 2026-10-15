-- name: \\#080\\Evilswag Powerups
-- description: My awesome powerups mod that doesn't work!!!

--local E_MODEL_POWERUP_STAR = smlua_model_util_get_id("jers_powerups_starman_geo")
E_MODEL_POWERUP_FIREFLOWER  = smlua_model_util_get_id('jers_powerups_fireflower_geo')
E_MODEL_POWERUP_FIREBALL    = smlua_model_util_get_id('jers_powerups_fireball_geo')
E_MODEL_POWERUP_ICEFLOWER  = smlua_model_util_get_id('jers_powerups_iceflower_geo')
E_MODEL_POWERUP_ICEBALL     = smlua_model_util_get_id('jers_powerups_iceball_geo')
E_MODEL_POWERUP_ICECUBE     = smlua_model_util_get_id('jers_powerups_icecube_geo')
E_MODEL_POWERUP_SNOWFLAKE   = smlua_model_util_get_id('jers_powerups_snowflake_geo')
E_MODEL_POWERUP_BUBBLEFLOWER  = smlua_model_util_get_id('jers_powerups_bubbleflower_geo')
--E_MODEL_POWERUP_CLOUDFLOWER  = smlua_model_util_get_id('jers_powerups_cloudflower_geo')

SOUND_POWERUP_SAVE = audio_sample_load("jers_powerups_save.ogg")
SOUND_POWERUP_USE = audio_sample_load("jers_powerups_use.ogg")


TEX_POWERUP_POCKET  = get_texture_info("jers_powerups_pocket")
TEX_POWERUP_METAL   = get_texture_info("jers_powerups_cap_metal")
TEX_POWERUP_VANISH  = get_texture_info("jers_powerups_cap_vanish")
TEX_POWERUP_WING    = get_texture_info("jers_powerups_cap_wing")
TEX_POWERUP_FIRE    = get_texture_info("jers_powerups_fire_flower")
TEX_POWERUP_ICE     = get_texture_info("jers_powerups_ice_flower")
TEX_POWERUP_BUBBLE  = get_texture_info("jers_powerups_bubble_flower")
--TEX_POWERUP_GOLD    = get_texture_info("jers_powerups_gold_flower")
TEX_POWERUP_CLOUD   = get_texture_info("jers_powerups_cloud_flower")

POWERUP_METAL     = -3
POWERUP_VANISH    = -2
POWERUP_WING      = -1
POWERUP_NONE      = 0
POWERUP_FIRE      = 1
POWERUP_ICE       = 2
POWERUP_BUBBLE    = 3
POWERUP_GOLD      = 4
POWERUP_CLOUD     = 5
POWERUP_PROPELLER = 6
POWERUP_SHELL     = 7
POWERUP_STAR      = 8

PROJECTILE_TYPE_FIRE = 0
PROJECTILE_TYPE_ICE = 1

powerupDespawnTime = 15*30
fireballLifetime = 100
iceballLifetime = 60
bubbleLifetime = 150
powerupTime = 45
replaceStarSound = 0
capCol = -1
--gLevelValues.hudCapTimer = 1

-- paletteColOverrides = {
--     [POWERUP_FIRE]      = {r = 255, g = 255, b = 255},
--     [POWERUP_ICE]       = {r = 000, g = 170, b = 255},
--     [POWERUP_BUBBLE]    = {r = 255, g = 128, b = 255},
-- }

-- flowerModels = {
--     [POWERUP_FIRE]      = E_MODEL_POWERUP_FIREFLOWER,
--     [POWERUP_ICE]       = E_MODEL_POWERUP_ICEFLOWER,
--     --[POWERUP_BUBBLE]    = E_MODEL_POWERUP_BUBBLEFLOWER,
-- }

enemyDrops = {
    [id_bhvSpindrift]   = POWERUP_FIRE,
    [id_bhvMrBlizzard]  = POWERUP_ICE,
    [id_bhvSkeeter]     = POWERUP_BUBBLE,
    -- [id_bhvMoneybag]    = POWERUP_GOLD,
    -- [id_bhvEnemyLakitu] = POWERUP_CLOUD,
    -- [id_bhvFlyGuy]      = POWERUP_PROPELLER,
    -- [id_bhvKoopa]       = POWERUP_SHELL,
}

vanillaPowerups = {
    [id_bhvMetalCap]    = {checkFlag = MARIO_METAL_CAP,     pu = POWERUP_METAL},
    [id_bhvVanishCap]   = {checkFlag = MARIO_VANISH_CAP,    pu = POWERUP_VANISH},
    [id_bhvWingCap]     = {checkFlag = MARIO_WING_CAP,      pu = POWERUP_WING},
}

powerupHudTextures = {
    [POWERUP_METAL]     = TEX_POWERUP_METAL,
    [POWERUP_VANISH]    = TEX_POWERUP_VANISH,
    [POWERUP_WING]      = TEX_POWERUP_WING,
    [POWERUP_NONE]      = nil,
    [POWERUP_FIRE]      = TEX_POWERUP_FIRE,
    [POWERUP_ICE]       = TEX_POWERUP_ICE,
    [POWERUP_BUBBLE]    = TEX_POWERUP_BUBBLE,
    --[POWERUP_GOLD]      = TEX_POWERUP_GOLD,
    [POWERUP_CLOUD]     = TEX_POWERUP_CLOUD,
    --[POWERUP_PROPELLER] = TEX_POWERUP_PROPELLER,
    --[POWERUP_SHELL]     = TEX_POWERUP_SHELL,
    --[POWERUP_STAR]      = TEX_POWERUP_STAR,
}

-- vanillaPowerupSpawns = {
--     [POWERUP_METAL]     = {bhv = id_bhvMetalCap,    model = E_MODEL_MARIOS_METAL_CAP},
--     [POWERUP_VANISH]    = {bhv = id_bhvVanishCap,   model = E_MODEL_MARIOS_CAP},
--     [POWERUP_WING]      = {bhv = id_bhvWingCap,     model = E_MODEL_MARIOS_WING_CAP},
-- }

powerupData = {}

function add_power_up(item, data)
    powerupData[item] = data
end

add_power_up(POWERUP_NONE, nil)
add_power_up(POWERUP_METAL, {model = E_MODEL_MARIOS_METAL_CAP, tex = TEX_POWERUP_METAL, bhv = id_bhvMetalCap,
    col = {r = 128, g = 128, b = 128}
})
add_power_up(POWERUP_VANISH, {model = E_MODEL_MARIOS_CAP, tex = TEX_POWERUP_VANISH, bhv = id_bhvVanishCap})
add_power_up(POWERUP_WING,   {model = E_MODEL_MARIOS_WING_CAP, tex = TEX_POWERUP_WING, bhv = id_bhvWingCap})
add_power_up(POWERUP_FIRE,   {model = E_MODEL_POWERUP_FIREFLOWER, tex = TEX_POWERUP_FIRE,
    col = {
    [PANTS]     = capCol,
    [SHIRT]     = {r = 255, g = 255, b = 255},
    [GLOVES]    = nil,
    [SHOES]     = nil,
    [HAIR]      = nil,
    [SKIN]      = nil,
    [CAP]       = {r = 255, g = 255, b = 255},
    [EMBLEM]    = nil,
}})
add_power_up(POWERUP_ICE,    {model = E_MODEL_POWERUP_ICEFLOWER, tex = TEX_POWERUP_ICE,
    col = {
    [PANTS]     = capCol,
    [SHIRT]     = {r = 000, g = 170, b = 255},
    [GLOVES]    = nil,
    [SHOES]     = nil,
    [HAIR]      = nil,
    [SKIN]      = nil,
    [CAP]       = {r = 000, g = 170, b = 255},
    [EMBLEM]    = nil,
}})
add_power_up(POWERUP_BUBBLE, {model = E_MODEL_POWERUP_BUBBLEFLOWER, tex = TEX_POWERUP_BUBBLE,
    col = {
    [PANTS]     = capCol,
    [SHIRT]     = {r = 255, g = 128, b = 255},
    [GLOVES]    = nil,
    [SHOES]     = nil,
    [HAIR]      = nil,
    [SKIN]      = nil,
    [CAP]       = {r = 255, g = 128, b = 255},
    [EMBLEM]    = nil,
}})
--add_power_up(POWERUP_GOLD, {col = {r = 255, g = 200, b = 000}, model = E_MODEL_POWERUP_GOLDFLOWER, tex = TEX_POWERUP_GOLD})
--add_power_up(POWERUP_CLOUD, {col = {r = 255, g = 255, b = 255}, model = E_MODEL_POWERUP_CLOUDFLOWER, tex = TEX_POWERUP_CLOUD})
--add_power_up(POWERUP_PROPELLER, {col = nil, model = E_MODEL_POWERUP_PROPELLERBOX, tex = TEX_POWERUP_PROPELLER})
--add_power_up(POWERUP_SHELL, {col = nil, model = E_MODEL_POWERUP_BLUESHELL, tex = TEX_POWERUP_SHELL})
--add_power_up(POWERUP_STAR, {col = {r = 000, g = 000, b = 000}, model = E_MODEL_POWERUP_STARMAN, tex = TEX_POWERUP_STAR})

--local MUSIC_POWERUP_STAR = audio_stream_load("jers_powerups_music_star.ogg")
--local MUSIC_POWERUP_FIRE = audio_stream_load("jers_powerups_music_fire.ogg")
--local MUSIC_POWERUP_ICE = audio_stream_load("jers_powerups_music_ice.ogg")
--local MUSIC_POWERUP_BUBBLE = audio_stream_load("jers_powerups_music_bubble.ogg")

gPowerupStates = {}
for i = 0, (MAX_PLAYERS - 1) do
    gPowerupStates[i] = {
        hasStarman = false,
        starmanTimer = 0,
        playerR = 255,
        playerG = 0,
        playerB = 0,
        playerCapCol = {r = 0, g = 0, b = 0},
        powerupStored = mod_storage_load_integer("pocket_item", 0),
        powerupStartTimer = 0,
        powerupFlags = 0,
        displayPowerup = false,
        hudScaleX = 1,
        hudScaleY = 1,
        hudPosY = 35,
        hudDance = 0,
        capTimerSaved = 20*30,
        overrideCapTimer = false,
        prevCharType = 0,
        CSoverridePalette = {
            fire = nil,
            ice = nil,
            bubble = nil,
        },
        CSmenuCheck = true,
    }
    --gPlayerSyncTable[i].
end

function set_cap_vol()
    local m = gMarioStates[0]
    local tempVol = 1

    if _G.charSelectExists and _G.charSelect.is_menu_open() then
        return 0
    end

    tempVol = (is_game_paused() or m.action == ACT_START_SLEEPING or m.action == ACT_SLEEPING or m.actionTimer < 80 and (m.action == ACT_STAR_DANCE_EXIT or m.action == ACT_STAR_DANCE_NO_EXIT or m.action == ACT_STAR_DANCE_WATER)) and 0.2 or 1

    if m.capTimer < (3 * 30) then
        return (m.capTimer / 90) * tempVol
    end

    return tempVol
end

function store_powerup(m, pu)
    local e = gPowerupStates[m.playerIndex]

    --obj_mark_for_deletion(o)
    audio_sample_play(SOUND_POWERUP_SAVE, m.pos, 1)
    e.hudScaleX = 0
    e.hudScaleY = 0
    e.hudDance = 0
    e.powerupStored = pu
    mod_storage_save_integer("pocket_item", pu)
end

---@param m MarioState
---@param o Object Enemy to check the behavious id of
---@param velX number Powerup oForwardVel
---@param velY number Powerup oVelY
---@param angle number Powerup oMoveAngleYaw
---@param parent Object Object that the Powerup will be inside of
---@param sound integer Powerup spawn sound
function spawn_powerup_from_bhv(m, o, velX, velY, angle, parent, sound)
    if o == nil then return end
    for bhv, powerType in pairs(enemyDrops) do
        if obj_has_behavior_id(o, bhv) ~= 0 then
            if m.playerIndex == 0 then
                spawn_sync_object(id_bhvGeneralPowerup, E_MODEL_NONE, o.oPosX, o.oPosY + 200, o.oPosZ, function(pu)
                    pu.oForwardVel      = velX
                    pu.oVelY            = velY
                    pu.oMoveAngleYaw    = angle
                    pu.oBehParams       = powerType
                    if sound ~= nil then
                        spawn_mist_particles_with_sound(sound)
                    end
                    if parent ~= nil then
                        pu.parentObj = parent
                        pu.oPosY = parent.oPosY + 40
                        pu.oCapUnkF4 = 2
                        parent.oNumLootCoins = 0
                    end
                end)
            end
        end
    end
end

---@param x number Spawn position x
---@param y number Spawn position y
---@param z number Spawn position z
---@param velX number Powerup oForwardVel
---@param velY number Powerup oVelY
---@param angle number Powerup oMoveAngleYaw
---@param type integer Powerup oBehParams
---@param sound integer Powerup spawn sound
function spawn_powerup_manual(x, y, z, velX, velY, angle, type, sound)
    spawn_sync_object(id_bhvGeneralPowerup, E_MODEL_NONE, x, y, z, function(pu)
        pu.oForwardVel      = velX
        pu.oVelY            = velY
        pu.oMoveAngleYaw    = angle
        pu.oBehParams       = type
        if sound ~= nil then
            spawn_mist_particles_with_sound(sound)
        end
    end)
end

---@param parent Object
---@param bluecoin boolean whether to spawn a bluecoin or 3 yellow coins
function spawn_visual_coins(parent, bluecoin)
    if bluecoin then
        spawn_sync_object(id_bhvVisualCoins, E_MODEL_BLUE_COIN_NO_SHADOW, parent.oPosX, parent.oPosY, parent.oPosZ, function(coins)
            coins.parentObj = parent
            coins.oBehParams = 1
        end)
    else
        for i=1, 3 do
            spawn_sync_object(id_bhvVisualCoins, E_MODEL_YELLOW_COIN_NO_SHADOW, parent.oPosX, parent.oPosY, parent.oPosZ, function(coins)
                coins.parentObj = parent
                coins.oBehParams = i
            end)
        end
    end
end

local function reset_on_warp()
    local e = gPowerupStates[0]
    local np = gNetworkPlayers[0]

    -- if e.hasStarman then
    --     network_player_reset_override_palette(np)

    --     e.hasStarman = false
    --     e.starmanTimer = 0
    -- end

    e.powerupFlags = 0
    e.displayPowerup = false
    network_player_reset_override_palette(np)
end
hook_event(HOOK_ON_WARP, reset_on_warp)

-- this is old starman code, figure out what to do with it or smth

-- local function mario_update(m)
--     local e = gPowerupStates[m.playerIndex]
--     local np = gNetworkPlayers[m.playerIndex]
--     --local rate = 20
--     local offset1 = 128
--     local E_MODEL_CLONE_PARTICLE = obj_get_model_id_extended(m.marioObj)

--     if m.controller.buttonPressed & Y_BUTTON ~= 0 then
--         spawn_sync_object(id_bhvRainbowStar, E_MODEL_RAINBOW_STAR, m.pos.x, (m.pos.y + 250), m.pos.z, 
--             function(o)
--                 obj_scale(o, 1)
--             end)
--     end

--     if m.capTimer < 2 and m.capTimer > 0 then
--         e.hasStarman = false

--         if m.action == ACT_WALKING then
--             m.marioObj.header.gfx.animInfo.animID = -1
--         end

--         network_player_reset_override_palette(np)

--         m.marioBodyState.shadeR = 128
--         m.marioBodyState.shadeG = 128
--         m.marioBodyState.shadeB = 128
--         m.marioBodyState.lightR = 255
--         m.marioBodyState.lightG = 255
--         m.marioBodyState.lightB = 255
--     else
--         if e.hasStarman then
--             m.marioBodyState.shadeR = 255
--             m.marioBodyState.shadeG = 255
--             m.marioBodyState.shadeB = 255
--             m.marioBodyState.lightR = 0
--             m.marioBodyState.lightG = 0
--             m.marioBodyState.lightB = 0
--             local rate = 85
--             local max = 255 - rate
--             local min = 0 + rate
--             if e.playerR == 255 and e.playerG ~= 255 then
--                 if e.playerB >= min then
--                     e.playerB = e.playerB - rate
--                 elseif e.playerG <= max then
--                     e.playerG = e.playerG + rate
--                 end
--             elseif e.playerG == 255 and e.playerB ~= 255 then
--                 if e.playerR >= min then
--                     e.playerR = e.playerR - rate
--                 elseif e.playerB <= max then
--                     e.playerB = e.playerB + rate
--                 end
--             elseif e.playerB == 255 and e.playerR ~= 255 then
--                 if e.playerG >= min then
--                     e.playerG = e.playerG - rate
--                 elseif e.playerR <= max then
--                     e.playerR = e.playerR + rate
--                 end
--             end
--             network_player_set_override_palette_color(np, EMBLEM,   {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, CAP,      {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, HAIR,     {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, SKIN,     {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, SHIRT,    {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, GLOVES,   {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, PANTS,    {r = e.playerR, g = e.playerG, b = e.playerB})
--             network_player_set_override_palette_color(np, SHOES,    {r = e.playerR, g = e.playerG, b = e.playerB})

--             --m.particleFlags = m.particleFlags | PARTICLE_SPARKLES

--             if m.action == ACT_WALKING then
--                 m.marioBodyState.torsoAngle.x = 0
--                 smlua_anim_util_set_animation(m.marioObj, "woke_run")
--                 m.marioBodyState.handState = MARIO_HAND_OPEN
--             end

--             m.peakHeight = m.pos.y

--             if (m.action == ACT_WALKING or m.action == ACT_SPECIAL_TRIPLE_JUMP) and m.forwardVel < 60 and m.forwardVel > 0 then
--                 m.forwardVel = m.forwardVel * 1.15
--             end
--         end
--     end

-- end
-- hook_event(HOOK_MARIO_UPDATE, mario_update)

-- local function mario_set_action(m)
--     local e = gPowerupStates[m.playerIndex]

--     if e.hasStarman then
--         if m.action == ACT_LONG_JUMP then
--             set_mario_action(m, ACT_SPECIAL_TRIPLE_JUMP, 0)
--             m.vel.y = 40
--         end
--     end
-- end
-- hook_event(HOOK_ON_SET_MARIO_ACTION, mario_set_action)

-- function themes(m)
--     local m = gMarioStates[0]
--     local e = gPowerupStates[0]
   
--     if e.starmanTimer > 0 then
--         stop_cap_music()
--         play_cap_music(0)
--     elseif e.starmanTimer == 0 and (m.flags & MARIO_WING_CAP) == 0 and (m.flags & MARIO_VANISH_CAP) == 0 and (m.flags & MARIO_METAL_CAP) == 0 then
--         stop_cap_music()
--     end

--     if e.hasStarman then
--         e.starmanTimer = e.starmanTimer + 1
--         audio_stream_play(MUSIC_STARMAN, false, get_cap_volume())
--     else
--         audio_stream_stop(MUSIC_STARMAN)
--         e.starmanTimer = 0
--     end
-- end
-- hook_event(HOOK_UPDATE, themes)


--local function hud_render()
--    local m = gMarioStates[0]
--    local e = gPowerupStates[0]
--
--    djui_hud_set_color(255, 255, 0, 255)
--    djui_hud_set_resolution(RESOLUTION_DJUI)
--    djui_hud_set_font(FONT_NORMAL)
--
--    djui_hud_print_text(string.format("m.capTimer:   "..m.capTimer..""), 25, 125, 1)
--    djui_hud_print_text(string.format("m.actionTimer:   "..m.actionTimer..""), 25, 150, 1)
--
--    -- djui_hud_set_color(0, 0, 255, 255)
--    -- djui_hud_print_text(string.format("e.snowmanTimer:   "..e.snowmanTimer..""), 25, 300, 1)
--    -- djui_hud_print_text(string.format("e.snowmanCoins:   "..e.snowmanCoins..""), 25, 325, 1)
--end
--
--hook_event(HOOK_ON_HUD_RENDER_BEHIND, hud_render)