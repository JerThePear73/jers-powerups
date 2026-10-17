local hudDodge = require("libs/hudDodge")

local function hud_render()
    local m = gMarioStates[0]
    local e = gPowerupStates[0]
    djui_hud_set_resolution(RESOLUTION_N64)
    local width = djui_hud_get_screen_width()
    local height = 240
    local puTex = powerupData[e.powerupStored]
    local puTexTimer = powerupData[e.powerupFlags]

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_set_font(FONT_HUD)

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) or (_G.charSelectExists and charSelect.is_menu_open()) then return end

    -- pocket item
    local pocketX, pocketY = hudDodge.find_open_hud_space(0, 0, 32, 32, 0, 1, 3) -- conflicts with redcoin detector
    --local pocketX = 20
    --local pocketY = (m.capTimer < 1) and 34 or 54
    local hardX = 20
    local lerpRate = 0.2

    if not is_game_paused() then
        e.hudScaleX = math.lerp(e.hudScaleX, 1, lerpRate)
        e.hudScaleY = e.hudDance == 0 and math.lerp(e.hudScaleY, 1, lerpRate) or (math.abs(math.sin(e.hudDance * 0.2))/4 + 0.75)
        e.hudPosY = math.lerp(e.hudPosY, pocketY, 0.2)
    end

    if e.hudDance > 0 then
        e.hudDance = e.hudDance - 1
    elseif e.hudScaleY > 0.9999 and (get_global_timer() % 200) == 0 then
        e.hudDance = 35
    end

    djui_hud_set_color(0, 0, 0, 0)
    djui_hud_render_rect(pocketX, pocketY, 32, 32)
    djui_hud_set_color(255, 255, 255, 255)

    if not djui_hud_is_pause_menu_created() then
        djui_hud_render_texture(TEX_POWERUP_POCKET, hardX, e.hudPosY, 1, 1)
        if e.powerupStored ~= 0 and e.powerupStored ~= nil and puTex ~= nil then
            djui_hud_render_texture(puTex.tex, hardX + 16 - (8 * e.hudScaleX), e.hudPosY + 24 - (16 * e.hudScaleY), e.hudScaleX, e.hudScaleY)
        end
    end

    -- recreated custom cap timer
    if puTexTimer == nil then
        if m.flags & MARIO_METAL_CAP ~= 0 then
            e.powerupFlags = POWERUP_METAL
        elseif m.flags & MARIO_VANISH_CAP ~= 0 then
            e.powerupFlags = POWERUP_VANISH
        elseif m.flags & MARIO_WING_CAP ~= 0 then
            e.powerupFlags = POWERUP_WING
        end
    end
    if m.capTimer > 1 and e.powerupFlags ~= nil and not hud_is_hidden() and puTexTimer ~= nil and (e.powerupFlags > 0 or gLevelValues.hudCapTimer ~= 1) then -- checks if coop cap timer is enabled
        djui_hud_render_texture(puTexTimer.tex, 21, 35, 1, 1)
        djui_hud_print_text("@", 38, 35, 1, 1)
        djui_hud_print_text(tostring(math.floor(m.capTimer/30)+1), 52, 35, 1, 1)
    end

    -- debug
    -- djui_hud_print_text(tostring(m.capTimer), 20, 120, 0.5, 0.5)
    -- djui_hud_print_text(tostring(e.capTimerSaved), 20, 130, 0.5, 0.5)
end
hook_event(HOOK_ON_HUD_RENDER_BEHIND, hud_render)