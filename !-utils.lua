E_MODEL_POWERUP_FIREFLOWER      = smlua_model_util_get_id('jers_powerups_fireflower_geo')
E_MODEL_POWERUP_FIREBALL        = smlua_model_util_get_id('jers_powerups_fireball_geo')
E_MODEL_POWERUP_ICEFLOWER       = smlua_model_util_get_id('jers_powerups_iceflower_geo')
E_MODEL_POWERUP_ICEBALL         = smlua_model_util_get_id('jers_powerups_iceball_geo')
E_MODEL_POWERUP_ICECUBE         = smlua_model_util_get_id('jers_powerups_icecube_geo')
E_MODEL_POWERUP_SNOWFLAKE       = smlua_model_util_get_id('jers_powerups_snowflake_geo')
E_MODEL_POWERUP_BUBBLEFLOWER    = smlua_model_util_get_id('jers_powerups_bubbleflower_geo')
E_MODEL_POWERUP_BUBBLE          = smlua_model_util_get_id('jers_powerups_bubble_geo')
E_MODEL_POWERUP_GOLDFLOWER      = smlua_model_util_get_id('jers_powerups_goldflower_geo')
E_MODEL_POWERUP_GOLDBALL        = smlua_model_util_get_id('jers_powerups_goldball_geo')
E_MODEL_POWERUP_SHROOM          = smlua_model_util_get_id('jers_powerups_redshroom_geo')
--E_MODEL_POWERUP_CLOUDFLOWER  = smlua_model_util_get_id('jers_powerups_cloudflower_geo')
--local E_MODEL_POWERUP_STARMAN = smlua_model_util_get_id("jers_powerups_starman_geo")

SOUND_POWERUP_SAVE  = audio_sample_load("jers_powerups_save.ogg")
SOUND_POWERUP_USE   = audio_sample_load("jers_powerups_use.ogg")


TEX_POWERUP_POCKET  = get_texture_info("jers_powerups_pocket")
TEX_POWERUP_METAL   = get_texture_info("jers_powerups_cap_metal")
TEX_POWERUP_VANISH  = get_texture_info("jers_powerups_cap_vanish")
TEX_POWERUP_WING    = get_texture_info("jers_powerups_cap_wing")
TEX_POWERUP_FIRE    = get_texture_info("jers_powerups_fire_flower")
TEX_POWERUP_ICE     = get_texture_info("jers_powerups_ice_flower")
TEX_POWERUP_BUBBLE  = get_texture_info("jers_powerups_bubble_flower")
TEX_POWERUP_GOLD    = get_texture_info("jers_powerups_gold_flower")
TEX_POWERUP_SHROOM  = get_texture_info("jers_powerups_super_mushroom")
TEX_POWERUP_CLOUD   = get_texture_info("jers_powerups_cloud_flower")

POWERUP_MASTER    = -4
POWERUP_METAL     = -3
POWERUP_VANISH    = -2
POWERUP_WING      = -1
POWERUP_NONE      = 0
POWERUP_FIRE      = 1
POWERUP_ICE       = 2
POWERUP_BUBBLE    = 3
POWERUP_GOLD      = 4
POWERUP_SHROOM    = 5
POWERUP_CLOUD     = 6
POWERUP_PROPELLER = 7
POWERUP_SHELL     = 8
POWERUP_STAR      = 9

powerupDespawnTime = 15*30
fireballLifetime = 100
iceballLifetime = 60
bubbleLifetime = 150
goldballLifetime = 40
powerupTime = 45
replaceStarSound = 0
capCol = -1
id_bhvMasterCapBox = get_id_from_behavior_name("bhvMasterCapBox")
id_bhvShopkeeper = get_id_from_behavior_name("bhvShopkeeper")

--gLevelValues.hudCapTimer = 1

-- allocate actions to m.actionArg to save action slots
ARG_THROW = 1336

enemyDrops = {
    [id_bhvSpindrift]   = POWERUP_FIRE,
    [id_bhvMrBlizzard]  = POWERUP_ICE,
    [id_bhvSkeeter]     = POWERUP_BUBBLE,
    [id_bhvMoneybag]    = POWERUP_GOLD,
    -- [id_bhvEnemyLakitu] = POWERUP_CLOUD,
    -- [id_bhvFlyGuy]      = POWERUP_PROPELLER,
    -- [id_bhvKoopa]       = POWERUP_SHELL,
}

vanillaPowerups = {
    [id_bhvMetalCap]    = {checkFlag = MARIO_METAL_CAP,     pu = POWERUP_METAL},
    [id_bhvVanishCap]   = {checkFlag = MARIO_VANISH_CAP,    pu = POWERUP_VANISH},
    [id_bhvWingCap]     = {checkFlag = MARIO_WING_CAP,      pu = POWERUP_WING},
}

pocketItemInput = {
    [Y_BUTTON] = {offset =  0, string = "(Y) Button"},
    [X_BUTTON] = {offset = 32, string = "(X) Button"},
}

pocketItemLayouts = {
    [0] = {x = 23,                               y =  34, string = "Top Left"},
    [1] = {x = djui_hud_get_screen_width() - 54, y =  34, string = "Top Right"},
    [2] = {x = 23,                               y = 190, string = "Bottom Left"},
    [3] = {x = djui_hud_get_screen_width() - 54, y = 164, string = "Bottom Right"},
}

powerupData = {}

function add_power_up(item, data)
    powerupData[item] = data
end

add_power_up(POWERUP_NONE, nil)
add_power_up(POWERUP_METAL, {model = E_MODEL_MARIOS_METAL_CAP, tex = TEX_POWERUP_METAL, bhv = id_bhvMetalCap, string = "Metal Cap", key = "evilswagPowerupsMetal", cost = 150,
    col = {
    [CAP]       = {r = 128, g = 128, b = 128},
}})
add_power_up(POWERUP_VANISH, {model = E_MODEL_MARIOS_CAP, tex = TEX_POWERUP_VANISH, bhv = id_bhvVanishCap, string = "Vanish Cap", key = "evilswagPowerupsVansih", cost = 150,})
add_power_up(POWERUP_WING,   {model = E_MODEL_MARIOS_WING_CAP, tex = TEX_POWERUP_WING, bhv = id_bhvWingCap, string = "Wing Cap", key = "evilswagPowerupsWing", cost = 300,})
add_power_up(POWERUP_FIRE,   {model = E_MODEL_POWERUP_FIREFLOWER, tex = TEX_POWERUP_FIRE, string = "Fire Flower", key = "evilswagPowerupsFire", cost = 50,
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
add_power_up(POWERUP_ICE,    {model = E_MODEL_POWERUP_ICEFLOWER, tex = TEX_POWERUP_ICE, string = "Ice Flower", key = "evilswagPowerupsIce", cost = 50,
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
add_power_up(POWERUP_BUBBLE, {model = E_MODEL_POWERUP_BUBBLEFLOWER, tex = TEX_POWERUP_BUBBLE, string = "Bubble Flower", key = "evilswagPowerupsBubble", cost = 75,
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
add_power_up(POWERUP_GOLD, {model = E_MODEL_POWERUP_GOLDFLOWER, tex = TEX_POWERUP_GOLD, string = "Gold Flower", key = "evilswagPowerupsGold", cost = 200,
    col = {
    [CAP]       = {r = 255, g = 200, b = 050},
}})
add_power_up(POWERUP_SHROOM, {model = E_MODEL_POWERUP_SHROOM, tex = TEX_POWERUP_SHROOM, string = "Super Mushroom", key = "evilswagPowerupsShroom", cost = 25})
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
        masterCapEffectTimer = 0,
        playerR = 255,
        playerG = 0,
        playerB = 0,
        playerCapCol = {r = 0, g = 0, b = 0},
        powerupStored = mod_storage_load_integer("pocket_item", 0),
        powerupStartTimer = 0,
        --powerupFlags = 0,
        displayPowerup = false,
        hudScaleX = 1,
        hudScaleY = 1,
        hudItemPos = {
            x = 23 + 16,
            y = 34 + 16,
            z = 0
        },
        hudPos = {
            x = 23,
            y = 34,
        },
        hudDance = 0,
        hudPocketInput = mod_storage_load_integer("item_input", Y_BUTTON),
        hudPocketPos = mod_storage_load_integer("item_pos", 0),
        capTimerSaved = 20*30,
        --capTimer2 = 0,
        overrideCapTimer = false,
        prevCharType = 0,
        shroomScale = 1,
        shroomScaleTimer = 0,
        CSoverridePalette = {
            fire = nil,
            ice = nil,
            bubble = nil,
        },
        CSmenuCheck = true,
        masterCapRunning = false,
    }
    gPlayerSyncTable[i].powerupFlags = 0
    gPlayerSyncTable[i].capTimer2 = 0
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

    audio_sample_play(SOUND_POWERUP_SAVE, m.pos, 1)
    e.hudScaleX = 0
    e.hudScaleY = 0
    e.hudDance = 0
    e.powerupStored = pu
    mod_storage_save_integer("pocket_item", pu)

    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_world_pos_to_screen_pos(m.pos, e.hudItemPos)
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
    local bhv = type == POWERUP_SHROOM and id_bhvShroom or id_bhvGeneralPowerup
    spawn_sync_object(bhv, E_MODEL_NONE, x, y, z, function(pu)
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
---@param numCoins integer how many visual coins to spawn
function spawn_visual_coins(parent, numCoins)
    if numCoins == 5 then
        spawn_non_sync_object(id_bhvVisualCoins, E_MODEL_BLUE_COIN_NO_SHADOW, parent.oPosX, parent.oPosY, parent.oPosZ, function(coins)
            coins.parentObj = parent
            coins.oBehParams = 1
        end)
    else
        for i=1, numCoins do
            spawn_non_sync_object(id_bhvVisualCoins, E_MODEL_YELLOW_COIN_NO_SHADOW, parent.oPosX, parent.oPosY, parent.oPosZ, function(coins)
                coins.parentObj = parent
                coins.oBehParams = i
            end)
        end
    end
end

function reset_on_warp(type, level, area)
    local m = gMarioStates[0]
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local np = gNetworkPlayers[m.playerIndex]

    -- if e.hasStarman then
    --     network_player_reset_override_palette(np)

    --     e.hasStarman = false
    --     e.starmanTimer = 0
    -- end

    if level == LEVEL_VCUTM then
        s.capTimer2 = gLevelValues.vanishCapDurationVcutm
        s.powerupFlags = POWERUP_VANISH
        e.powerupStartTimer = 20
        play_sound(SOUND_MENU_EXIT_PIPE, m.marioObj.header.gfx.cameraToObject)
    elseif level == LEVEL_COTMC then
        s.capTimer2 = gLevelValues.metalCapDurationCotmc
        s.powerupFlags = POWERUP_METAL
        e.powerupStartTimer = 20
        play_sound(SOUND_MENU_EXIT_PIPE, m.marioObj.header.gfx.cameraToObject)
    elseif level == LEVEL_TOTWC then
        s.capTimer2 = gLevelValues.wingCapDurationTotwc
        s.powerupFlags = POWERUP_WING
        e.powerupStartTimer = 20
        play_sound(SOUND_MENU_EXIT_PIPE, m.marioObj.header.gfx.cameraToObject)
    else
        s.capTimer2 = 0
        e.displayPowerup = false
        network_player_reset_override_palette(np)
    end
end
hook_event(HOOK_ON_WARP, reset_on_warp)

function do_master_cap_effect(m)
    local e = gPowerupStates[m.playerIndex]
    local threshold = 50
    local lerpRate = 0.1
    if e.masterCapEffectTimer == 0 then
        e.playerR = math.lerp(e.playerR, 0, lerpRate)
        if e.playerR < threshold then
            e.playerG = 255
            e.masterCapEffectTimer = 1
        end
    elseif e.masterCapEffectTimer == 1 then
        e.playerG = math.lerp(e.playerG, 0, lerpRate)
        if e.playerG < threshold then
            e.playerB = 255
            e.masterCapEffectTimer = 2
        end
    elseif e.masterCapEffectTimer == 2 then
        e.playerB = math.lerp(e.playerB, 0, lerpRate)
        if e.playerB < threshold then
            e.playerR = 255
            e.masterCapEffectTimer = 0
        end
    end
end

-- oins shop
if _G.betterCoins then
    for i=1, 3 do
        local pu = powerupData[0 - i]
        _G.betterCoins.add_shop_item({
            name = pu.string,
            key = pu.key,
            texture = pu.tex,
            description = "You want a "..pu.string.."? \n\nIt's yours my friend.",
            coins = pu.cost,
            interact = function(item)
                local m = gMarioStates[0]
                local o = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvShopkeeper)
                spawn_sync_object(pu.bhv, pu.model, o.oPosX, o.oPosY + 100, o.oPosZ, function(cap)
                    cap.oVelY = 25
                    cap.oForwardVel = 3
                    cap.oMoveAngleYaw = o.oFaceAngleYaw
                    cap.oFaceAngleYaw = o.oFaceAngleYaw
                end)
                return true
            end,
        })
    end
    for i=1, #powerupData do
        local pu = powerupData[i]
        _G.betterCoins.add_shop_item({
            name = pu.string,
            key = pu.key,
            texture = pu.tex,
            description = "You want a "..pu.string.."? \n\nIt's yours my friend.",
            coins = pu.cost,
            interact = function(item)
                local m = gMarioStates[0]
                local o = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvShopkeeper)
                spawn_powerup_manual(o.oPosX, o.oPosY + 100, o.oPosZ, 3, 25, o.oFaceAngleYaw, i, SOUND_GENERAL_COIN_SPURT)
                return true
            end,
        })
    end
end

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