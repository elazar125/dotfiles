local wezterm = require 'wezterm';
local nvim = require 'nvim';
local act = wezterm.action;

-- Use a bit of logic here to change up how I do things
-- on Windows & Linux
local default_directory = '~';
local default_program = '/usr/bin/bash';

if os.getenv('OS') == 'Windows_NT' then
    default_directory = 'C:\\code';
    default_program = 'C:\\Program Files\\Git\\bin\\bash.exe';
end

-- I like this colour scheme but want a black background for contrast
local atelier_forest = wezterm.color.get_builtin_schemes()['Atelier Cave (base16)']
atelier_forest.background = 'black'

return {
    -- Use the right bash & directory per OS
    default_prog = {default_program, '-il'},
    default_cwd = default_directory,
    -- Basic colours and font stuff
    color_scheme = 'Atelier Forest Black',
    font = wezterm.font('SemiCoder Nerd Font Mono'),
    enable_wayland = false, -- copy/paste is broken on stable with wayland
    font_size = 13,
    -- Hide the UI, I just want the terminal itself
    enable_tab_bar = false,
    window_decorations = "RESIZE",
    -- A bit of transparency to see my neat desktop backgrounds
    window_background_opacity = 0.8,
    -- I like having my terminal full-screen but with the
    -- contents off of the edges by a bit
    window_padding = {
        left = 48,
        right = 48,
        top = 48,
        bottom = 48,
    },
    keys = {
        -- Add vim-ish directions for moving between splits
        {key='h', mods='ALT', action=act.ActivatePaneDirection 'Left'},
        {key='l', mods='ALT', action=act.ActivatePaneDirection 'Right'},
        {key='k', mods='ALT', action=act.ActivatePaneDirection 'Up'},
        {key='j', mods='ALT', action=act.ActivatePaneDirection 'Down'},
        -- Also vim-ish directions for creating new splits
        {key='l', mods='ALT|SHIFT', action=act.SplitHorizontal {domain='CurrentPaneDomain'}},
        {key='j', mods='ALT|SHIFT', action=act.SplitVertical {domain='CurrentPaneDomain'}},
        -- Add a resize 'mode', there is native resizing but I find this easier
        {key='r', mods='ALT', action=act.ActivateKeyTable {name='resize_pane',one_shot=false,until_unknown=true,replace_current=false}},
        {key="n", mods="CTRL|SHIFT", action=act.QuickSelectArgs {
            label="Open NeoVim pane",
            action=nvim.open_nvim},
        },
    },
    key_tables = {
        -- Resize 'mode', use h/j/k/l or arrows, no chords required
        resize_pane = {
            {key='LeftArrow', action=act.AdjustPaneSize {'Left', 1}},
            {key='h', action=act.AdjustPaneSize {'Left', 1}},

            {key='RightArrow', action=act.AdjustPaneSize {'Right', 1}},
            {key='l', action=act.AdjustPaneSize {'Right', 1}},

            {key='UpArrow', action=act.AdjustPaneSize {'Up', 1}},
            {key='k', action=act.AdjustPaneSize {'Up', 1}},

            {key='DownArrow', action=act.AdjustPaneSize {'Down', 1}},
            {key='j', action=act.AdjustPaneSize {'Down', 1}},

            -- Cancel the mode by pressing escape
            {key='Escape', action=act.PopKeyTable},
        },
    },
    color_schemes = {
        ['Atelier Forest Black'] = atelier_forest,
    }
}
