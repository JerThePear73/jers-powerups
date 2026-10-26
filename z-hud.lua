local hudDodge = require("libs/hudDodge")

local function hud_render()
    local m = gMarioStates[0]
    local e = gPowerupStates[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    djui_hud_set_resolution(RESOLUTION_N64)
    local width = djui_hud_get_screen_width()
    local height = 240
    local puTex = powerupData[e.powerupStored]
    local puTexTimer = powerupData[s.powerupFlags]

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_set_font(FONT_HUD)

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) or (_G.charSelectExists and charSelect.is_menu_open()) then return end

    -- pocket item
    --local pocketX, pocketY = hudDodge.find_open_hud_space(e.hudPocketPos.x, e.hudPocketPos.y, 32, 32, 0, 1, 3) -- I am so incredibly fucking stupid its not even funny anymore
    local pocketX = pocketItemLayouts[e.hudPocketPos].x
    local pocketY = pocketItemLayouts[e.hudPocketPos].y + ((m.capTimer > 0 and e.hudPocketPos == 0) and 20 or 0)

    --if not is_game_paused() then
    e.hudScaleX = math.lerp(e.hudScaleX, 1, 0.2)
    e.hudScaleY = e.hudDance == 0 and math.lerp(e.hudScaleY, 1, 0.2) or (math.abs(math.sin(e.hudDance * 0.2))/4 + 0.75)
    e.hudItemPos.x = math.lerp(e.hudItemPos.x, e.hudPos.x + 16, 0.3)
    e.hudItemPos.y = math.lerp(e.hudItemPos.y, e.hudPos.y + 24, 0.3)
    e.hudPos.x = math.lerp(e.hudPos.x, pocketX, 0.2)
    e.hudPos.y = math.lerp(e.hudPos.y, pocketY, 0.2)
    --end

    if not is_game_paused() then
        if e.hudDance > 0 then
            e.hudDance = e.hudDance - 1
        elseif e.hudScaleY > 0.9999 and (get_global_timer() % 200) == 0 then
            e.hudDance = 35
        end
    end

    djui_hud_set_color(255, 0, 0, 0)
    djui_hud_render_rect(pocketX, pocketY, 32, 32)
    djui_hud_set_color(255, 255, 255, 255)

    local scaleThreshold = 0.99
    local itemPosX = e.hudScaleX < scaleThreshold and e.hudItemPos.x or e.hudPos.x + 16
    local itemPosY = e.hudScaleX < scaleThreshold and e.hudItemPos.y or e.hudPos.y + 24
    --if not djui_hud_is_pause_menu_created() then
        djui_hud_render_texture_tile(TEX_POWERUP_POCKET, e.hudPos.x, e.hudPos.y, 1, 1, pocketItemInput[e.hudPocketInput].offset, 0, 32, 32)
        if e.powerupStored ~= 0 and e.powerupStored ~= nil and puTex ~= nil then
            djui_hud_render_texture(puTex.tex, itemPosX - (8 * e.hudScaleX), itemPosY - (16 * e.hudScaleY), e.hudScaleX, e.hudScaleY)
        end
    --end

    -- recreated custom cap timer
    if puTexTimer == nil then
        if m.flags & MARIO_METAL_CAP ~= 0 then
            s.powerupFlags = POWERUP_METAL
        elseif m.flags & MARIO_VANISH_CAP ~= 0 then
            s.powerupFlags = POWERUP_VANISH
        elseif m.flags & MARIO_WING_CAP ~= 0 then
            s.powerupFlags = POWERUP_WING
        end
    end
    local capTimerToCheck = s.capTimer2 --s.powerupFlags < 0 and m.capTimer or s.capTimer2
    if capTimerToCheck > 1 and s.powerupFlags ~= nil and not hud_is_hidden() and puTexTimer ~= nil and (s.powerupFlags > 0 or gLevelValues.hudCapTimer ~= 1) then -- checks if coop cap timer is enabled
        djui_hud_render_texture(puTexTimer.tex, 21, 35, 1, 1)
        djui_hud_print_text("@", 38, 35, 1, 1)
        djui_hud_print_text(tostring(math.floor(capTimerToCheck/30)+1), 52, 35, 1, 1)
    end
end
hook_event(HOOK_ON_HUD_RENDER_BEHIND, hud_render)

hook_mod_menu_text("Backup item button:")
hook_mod_menu_button("(Y) Button", function()
    local m = gMarioStates[0]
    local e = gPowerupStates[m.playerIndex]
    e.hudPocketInput = Y_BUTTON
    mod_storage_save_integer("item_input", e.hudPocketInput)
end)
hook_mod_menu_button("(X) Button", function()
    local m = gMarioStates[0]
    local e = gPowerupStates[m.playerIndex]
    e.hudPocketInput = X_BUTTON
    mod_storage_save_integer("item_input", e.hudPocketInput)
end)

hook_mod_menu_text("Backup item hud position:")
for i=0, #pocketItemLayouts do
    hook_mod_menu_button(pocketItemLayouts[i].string, function()
        local m = gMarioStates[0]
        local e = gPowerupStates[m.playerIndex]
        e.hudPocketPos = i
        mod_storage_save_integer("item_pos", e.hudPocketPos)
    end)
end