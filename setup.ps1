# Prior to running, use `Set-ExecutionPolicy Bypass -Scope Process`

if((Get-Command choco -ErrorAction SilentlyContinue) -eq $null){
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function Install-IfNeeded {
    param (
        $Command,
        $Package
    )

    if((Get-Command $command -ErrorAction SilentlyContinue) -eq $null){
        choco install $package
    }
}

Install-IfNeeded -Command wezterm -Package wezterm
Install-IfNeeded -Command git -Package git
Install-IfNeeded -Command nvim -Package neovim
Install-IfNeeded -Command bat -Package bat
Install-IfNeeded -Command fzf -Package fzf
Install-IfNeeded -Command rg -Package ripgrep
Install-IfNeeded -Command jq -Package jq
Install-IfNeeded -Command fd -Package fd

refreshenv

if (-not (Test-Path -Path "$env:LOCALAPPDATA/nvim/autoload/plug.vim" -PathType Leaf)) {
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$env:LOCALAPPDATA/nvim/autoload/plug.vim" -Force
}

$folderPath = "C:\code"

"source $folderPath\dotfiles\vim\.vimrc" | Set-Content -Path $env:LOCALAPPDATA/nvim/init.vim
"source $($folderPath -replace "\\", "/")/dotfiles/bash/.bashrc" | Set-Content -Path $home/.bashrc
[Environment]::SetEnvironmentVariable('WEZTERM_CONFIG_FILE', "$folderPath\dotfiles\wezterm\.wezterm.lua", 'User')
[Environment]::SetEnvironmentVariable('BAT_CONFIG_PATH', "$folderPath\dotfiles\bat\config", 'User')

nvim -c ":PlugInstall"

Expand-Archive -Path './font/gabriele.zip' -DestinationPath './font/gabriele'
foreach ($font in Get-ChildItem -Path './font/gabriele/gabriele_ribbon_fg' -Exclude '*.txt' -File) {
    $dest = "C:\Windows\Fonts\$font"
    if (Test-Path -Path $dest) {
        "Font $font already installed."
    }
    else {
        $font | Copy-Item -Destination $dest
    }
}
