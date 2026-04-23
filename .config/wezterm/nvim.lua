local wezterm = require 'wezterm';

local M = {}

local open_panes = {}

M.open_nvim = wezterm.action_callback(function(window,pane)

    local filename = window:get_selection_text_for_pane(pane)
    local tab_id = window:active_tab():tab_id()
    local pane_id = open_panes[tab_id]
    local nvim_pane = nil
    local status = false

    if pane_id then
        status = pcall(function ()
            nvim_pane = wezterm.mux.get_pane(pane_id)
        end)
    end

    if status then
        nvim_pane:send_text(":e " .. filename .. "\r")
        nvim_pane:activate()
    else
        nvim_pane = pane:split({
            direction = "Right",
            size = 0.5,
            args = { "nvim", filename },
            domain = "CurrentPaneDomain",
        })
        open_panes[tab_id] = nvim_pane:pane_id()
    end

end)

return M
