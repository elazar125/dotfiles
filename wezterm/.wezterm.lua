local wezterm = require 'wezterm';

return {
    color_scheme = "Paper Color",
    font = wezterm.font("Gabriele Light Ribbon FG"),
    font_size = 14,
    default_prog = {"C:\\Program Files\\Git\\bin\\bash.exe", "-il"},
    default_cwd = "C:\\Code",
    enable_tab_bar = false,
    window_background_opacity = 0.7,
    window_padding = {
        left = 64,
        right = 64,
        top = 64,
        bottom = 64,
    },
    keys = {
        {key="t", mods="ALT", action="ActivateLastTab"},
        {key="t", mods="SHIFT|ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="h", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="l", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="k", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="j", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="l", mods="ALT|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="j", mods="ALT|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},
        {key="c", mods="ALT", action=wezterm.action{CopyTo="Clipboard"}},
        {key="w", mods="ALT", action=wezterm.action{CloseCurrentPane={confirm=false}}},
        {key="w", mods="ALT|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=false}}},
        {key="r", mods="ALT", action=wezterm.action{ActivateKeyTable={name="resize_pane",one_shot=false}}},
    },
    key_tables = {
        resize_pane = {
            {key="LeftArrow", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
            {key="h", action=wezterm.action{AdjustPaneSize={"Left", 1}}},

            {key="RightArrow", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
            {key="l", action=wezterm.action{AdjustPaneSize={"Right", 1}}},

            {key="UpArrow", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
            {key="k", action=wezterm.action{AdjustPaneSize={"Up", 1}}},

            {key="DownArrow", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
            {key="j", action=wezterm.action{AdjustPaneSize={"Down", 1}}},

            -- Cancel the mode by pressing escape
            {key="Escape", action="PopKeyTable"},

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
