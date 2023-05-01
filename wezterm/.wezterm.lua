local wezterm = require 'wezterm';
local act = wezterm.action;

local default_directory = "~";
local default_program = "bash";

if os.getenv("OS") == "Windows_NT" then
    default_directory = "C:\\code";
    default_program = "C:\\Program Files\\Git\\bin\\bash.exe";
end

return {
    color_scheme = "Paper Color",
    font = wezterm.font("Gabriele Light Ribbon FG"),
    font_size = 14,
    default_prog = {default_program, "-il"},
    default_cwd = default_directory,
    enable_tab_bar = false,
    window_background_opacity = 0.9,
    window_padding = {
        left = 48,
        right = 48,
        top = 48,
        bottom = 48,
    },
    keys = {
        {key="t", mods="ALT", action=act.ActivateLastTab},
        {key="t", mods="SHIFT|ALT", action=act.SpawnCommandInNewTab { cwd=default_directory } },
        {key="t", mods="SHIFT|CTRL", action=act.SpawnCommandInNewTab { cwd=default_directory } },
        {key="h", mods="ALT", action=act.ActivatePaneDirection "Left"},
        {key="l", mods="ALT", action=act.ActivatePaneDirection "Right"},
        {key="k", mods="ALT", action=act.ActivatePaneDirection "Up"},
        {key="j", mods="ALT", action=act.ActivatePaneDirection "Down"},
        {key="l", mods="ALT|SHIFT", action=act.SplitHorizontal {domain="CurrentPaneDomain"}},
        {key="j", mods="ALT|SHIFT", action=act.SplitVertical {domain="CurrentPaneDomain"}},
        {key="v", mods="ALT", action=act.PasteFrom "Clipboard"},
        {key="c", mods="ALT", action=act.CopyTo "Clipboard"},
        {key="w", mods="ALT", action=act.CloseCurrentPane {confirm=false}},
        {key="w", mods="ALT|SHIFT", action=act.CloseCurrentTab {confirm=false}},
        {key="r", mods="ALT", action=act.ActivateKeyTable {name="resize_pane",one_shot=false,until_unknown=true,replace_current=false}},
    },
    key_tables = {
        resize_pane = {
            {key="LeftArrow", action=act.AdjustPaneSize {"Left", 1}},
            {key="h", action=act.AdjustPaneSize {"Left", 1}},

            {key="RightArrow", action=act.AdjustPaneSize {"Right", 1}},
            {key="l", action=act.AdjustPaneSize {"Right", 1}},

            {key="UpArrow", action=act.AdjustPaneSize {"Up", 1}},
            {key="k", action=act.AdjustPaneSize {"Up", 1}},

            {key="DownArrow", action=act.AdjustPaneSize {"Down", 1}},
            {key="j", action=act.AdjustPaneSize {"Down", 1}},

            -- Cancel the mode by pressing escape
            {key="Escape", action=act.PopKeyTable},

        },
    },
    color_schemes = {
        ["Paper Color"] = {
            -- The default text color
            foreground = "silver",
            -- The default background color
            background = "black",

            -- Overrides the cell background color when the current cell is occupied by the
            -- cursor and the cursor style is set to Block
            cursor_bg = "#5faf5f",
            -- Overrides the text color when the current cell is occupied by the cursor
            cursor_fg = "black",
            -- Specifies the border color of the cursor when the cursor style is set to Block,
            -- or the color of the vertical or horizontal bar when the cursor style is set to
            -- Bar or Underline.
            cursor_border = "#5faf5f",

            -- the foreground color of selected text
            selection_fg = "black",
            -- the background color of selected text
            selection_bg = "#d0d0d0",

            -- The color of the split lines between panes
            split = "#444444",

            ansi = {"#1c1c1c", "#af005f", "#5faf00", "#d7af5f", "#5fafd7", "#808080", "#d7875f", "#d0d0d0"},
            brights = {"#585858", "#5faf5f", "#afd700", "#af87d7", "#ffaf00", "#ff5faf", "#00afaf", "#5f8787"},
        }
    }
}
