# TODO: Install LSPs
# - omnisharp
# - netcoredbg - currently only compile from source
# - powershell-es - currently only compile from source
#
# - rust (for krabby) (manually download & run rustup)
# - krabby (cargo install krabby)


winget install chocolatey.chocolatey
winget install wez.wezterm
winget install Helix.Helix
winget install fzf
winget install BurntSushi.ripgrep.MSVC
winget install Neovim.Neovim
winget install sharkdp.bat
winget install jqlang.jq
winget install sharkdp.fd
winget install Git.Git
winget install koalaman.shellcheck
winget install eza-community.eza
winget install dandavison.delta

winget install Microsoft.Powershell

choco upgrade -y mingw

winget install hurl
winget install Bruno.Bruno

winget install OpenJS.NodeJS.LTS
npm install --global bash-language-server
npm install --global typescript-language-server typescript
npm install --global vscode-langservers-extracted
npm install --global vls

nvim --headless "+Lazy! sync" +qa

Expand-Archive -Force -Path "$env:Home/extras/font/gabriele.zip" -DestinationPath "$env:Home/extras/font/gabriele"
foreach ($font in Get-ChildItem -Path "$env:Home/extras/font/gabriele/gabriele_ribbon_fg" -Exclude '*.txt' -File) {
    $dest = "C:\Windows\Fonts\$font"
    if (Test-Path -Path $dest) {
        "Font $font already installed."
    }
    else {
        $font | Copy-Item -Destination $dest
    }
}
