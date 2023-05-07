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
Install-IfNeeded -Command fd -Package shellcheck

refreshenv

git clone --bare --config status.showUntrackedFiles=no https://github.com/elazar125/dotfiles.git $env:Home/dotfiles

mkdir $env:AppData\bat
New-Item -Path $env:AppData\bat\config -ItemType SymbolicLink -Value $env:Home\.config\bat\config
mkdir $env:AppData\fd
New-Item -Path $env:AppData\fd\ignore -ItemType SymbolicLink -Value $env:Home\.config\fd\ignore
mkdir $env:LocalAppData\nvim
New-Item -Path $env:LocalAppData\nvim\init.vim -ItemType SymbolicLink -Value $env:Home\.config\nvim\init.vim
mkdir $env:AppData\helix
New-Item -Path $env:AppData\helix\config.toml -ItemType SymbolicLink -Value $env:Home\.config\helix\config.toml

if (-not (Test-Path -Path "$env:LOCALAPPDATA/nvim/autoload/plug.vim" -PathType Leaf)) {
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$env:LOCALAPPDATA/nvim/autoload/plug.vim" -Force
}

nvim -c ":PlugInstall"

Expand-Archive -Path '$env:Home/extras/font/gabriele.zip' -DestinationPath '$env:Home/extras/font/gabriele'
foreach ($font in Get-ChildItem -Path '$env:Home/extras/font/gabriele/gabriele_ribbon_fg' -Exclude '*.txt' -File) {
    $dest = "C:\Windows\Fonts\$font"
    if (Test-Path -Path $dest) {
        "Font $font already installed."
    }
    else {
        $font | Copy-Item -Destination $dest
    }
}
