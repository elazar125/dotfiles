# ------------------------------------------------------
# PW - work-specific stuff
# ------------------------------------------------------

alias todo='code "/u/todo.md"'

# I don't remember why I called this glr, but I think it's used for SRED logging. Gets everything I've done for a given time frame.
glr() {
    git log --date=short --pretty=format:"%h %ad %an %s" --graph --author=ezra.lazar --before=$2 --after=$1
}

alias rs='cd /c/Code/root-site'
alias pwn='cd /c/Code/payworks-next/payworks-next'
alias nv2='cd /c/Code/payworks-next-v2'
alias aei='cd /c/Code/ascentis-imports'
alias dni='cd /c/Code/payworks-dotnet-internal'
alias fin='cd /c/Code/web-interface'
alias jgcomp='cd /c/Code/payworks-benefits-setup'

# For running various projects
alias netr='dotnet watch -v run'
alias grnt='grunt dev-watch'
alias grntr='grunt dev'
alias nrd='npm run dev'

# DotNet Build - first make sure file paths are valid (there are issues with MicroServices) then build. Reset paths afterwards.
dnb() {
    find . -type f -iname *.sfproj | xargs sed -i -b 's/sysnative/system32/g'
    dotnet build
    find . -type f -iname *.sfproj | xargs sed -i -b 's/system32/sysnative/g'
}

alias appcmd='/c/Windows/System32/inetsrv/appcmd.exe'

alias msbuild1='/c/Windows/Microsoft.NET/Framework/v1.0.3705/msbuild.exe'
alias msbuild1_1='/c/Windows/Microsoft.NET/Framework/v1.1.4322/msbuild.exe'
alias msbuild2='/c/Windows/Microsoft.NET/Framework/v2.0.50727/msbuild.exe'
alias msbuild3='/c/Windows/Microsoft.NET/Framework/v3.0/msbuild.exe'
alias msbuild3_5='/c/Windows/Microsoft.NET/Framework/v3.5/msbuild.exe'
alias msbuild4='/c/Windows/Microsoft.NET/Framework/v4.0.30319/msbuild.exe'

# DotNet Build Internal - first make sure file paths are valid (there are issues with MicroServices) then build. Reset paths afterwards.
dnbi() {
    cd /c/Code/payworks-dotnet-internal
    find . -type f -iname *.sfproj | xargs sed -i -b 's/sysnative/system32/g'
    dotnet build
    find . -type f -iname *.sfproj | xargs sed -i -b 's/system32/sysnative/g'
    cd -
    cd /c/Code/payworks-dotnet-internal/src/Payworks.WebServices.Internal
    appcmd stop site Payworks.Intranet.Core
    appcmd stop apppool core
    dotnet build
    dotnet publish
    appcmd start apppool core
    appcmd start site Payworks.Intranet.Core
    cd -
}
