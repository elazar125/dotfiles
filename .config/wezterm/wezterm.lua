local wezterm = require 'wezterm';
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
local atelier_forest = wezterm.color.get_builtin_schemes()['Atelier Forest (base16)']
atelier_forest.background = 'black'

return {
    -- Use the right bash & directory per OS
    default_prog = {default_program, '-il'},
    default_cwd = default_directory,
    -- Basic colours and font stuff
    color_scheme = 'Atelier Forest Black',
    font = wezterm.font('Gabriele Light Ribbon FG'),
    font_size = 12,
    -- Hide the UI, I just want the terminal itself
    enable_tab_bar = false,
    -- A bit of transparency to see my neat desktop backgrounds
    window_background_opacity = 0.9,
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
        -- I mostly stole this colour scheme from https://github.com/NLKNguyen/papercolor-theme
        ['Paper Color'] = {
            -- The default text color
            foreground = 'silver',
            -- The default background color
            background = 'black',

            -- Overrides the cell background color when the current cell is occupied by the
            -- cursor and the cursor style is set to Block
            cursor_bg = '#5faf5f',
            -- Overrides the text color when the current cell is occupied by the cursor
            cursor_fg = 'black',
            -- Specifies the border color of the cursor when the cursor style is set to Block,
            -- or the color of the vertical or horizontal bar when the cursor style is set to
            -- Bar or Underline.
            cursor_border = '#5faf5f',

            -- the foreground color of selected text
            selection_fg = 'black',
            -- the background color of selected text
            selection_bg = '#d0d0d0',

            -- The color of the split lines between panes
            split = '#444444',

            ansi = {'#1c1c1c', '#af005f', '#5faf00', '#d7af5f', '#5fafd7', '#808080', '#d7875f', '#d0d0d0'},
            brights = {'#585858', '#5faf5f', '#afd700', '#af87d7', '#ffaf00', '#ff5faf', '#00afaf', '#5f8787'},
        }
    }
}
