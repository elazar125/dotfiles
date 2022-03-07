local wezterm = require 'wezterm';

return {
    font = wezterm.font_with_fallback({"Gabriele Light Ribbon FG", "Fira Code"}),
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
        {key="w", mods="ALT", action=wezterm.action{CloseCurrentTab={confirm=false}}},
    }
}
