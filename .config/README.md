# The .config/ Directory

I store all my dotfiles in .config/ (even on Windows where it's non-standard) to keep things nicely organized. On Linux this is the default for most of the programs I'm using, under the [XDG Base Directory spec](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html). There are a couple programs I use that don't use this standard (notably the ones that predate it, like bash and readline). You may notice I have to use other tricks to keep as much of that config in `~/.config/` as possible, such as setting other environment variables or manually sourcing files, but it works!

Make sure $XDG_CONFIG_HOME is unset or `~/.config` on Linux or set to `~/.config` on Windows.
