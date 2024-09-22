# TODO: Install LSPs
# - omnisharp
# - netcoredbg - currently only compile from source
# - powershell-es - currently only compile from source
#
# - rust (for krabby) (manually download & run rustup)
# - krabby (cargo install krabby)


Write-Host "Chocolatey"
winget install chocolatey.chocolatey
Write-Host "Wezterm"
winget install wez.wezterm
Write-Host "Helix"
winget install Helix.Helix
Write-Host "fzf"
winget install fzf
Write-Host "RipGrep"
winget install BurntSushi.ripgrep.MSVC
Write-Host "Neovim"
winget install Neovim.Neovim
Write-Host "bat"
winget install sharkdp.bat
Write-Host "jq"
winget install jqlang.jq
Write-Host "fd"
winget install sharkdp.fd
write-Host "Git"
winget install Git.Git
Write-Host "Shellcheck"
winget install koalaman.shellcheck
Write-Host "eza"
winget install eza-community.eza

Write-Host "Powershell"
winget install Microsoft.Powershell
Write-Host "OhMyPosh"
winget install JanDeDobbeleer.OhMyPosh


choco upgrade -y mingw

Write-Host "NodeJS"
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

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal $identity
$isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($isAdmin) {
    New-Item -Path $PROFILE -ItemType SymbolicLink -Value "$env:HOME\.config\powershell\Microsoft.PowerShell_profile.ps1" -Force
}
