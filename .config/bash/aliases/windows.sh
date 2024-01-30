#!/bin/bash

# --------------------------------------------------
# Web Hosting
# --------------------------------------------------

alias hosts='"$EDITOR" /c/Windows/System32/drivers/etc/hosts'
alias iis='/c/Windows/System32/inetsrv/appcmd.exe'

# --------------------------------------------------
# MS Build
# --------------------------------------------------

alias msb='MSBuild.exe'
alias msbr='pwsh -c "MSBuild.exe /p:Configuration=Release"'

# --------------------------------------------------
# VS Code
# --------------------------------------------------

alias save-ext='code --list-extensions | xargs -L 1 echo code --install-extension > "$HOME/extras/vscode/.extensions"'
alias see-ext='bat "$HOME/extras/vscode/.extensions"'
alias install-ext='source "$HOME/extras/vscode/.extensions"'

# --------------------------------------------------
# C# Interactive
# --------------------------------------------------

alias csi='/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Professional/MSBuild/Current/Bin/Roslyn/csi.exe'
