# ------------------------------------------------------
# PW - work-specific stuff
# ------------------------------------------------------

alias todo='code "/u/todo.md"'

# I don't remember why I called this glr, but I think it's used for SRED logging. Gets everything I've done for a given time frame.
glr() {
    git log --date=short --pretty=format:"%h %ad %an %s" --graph --author=ezra.lazar --before=$2 --after=$1
}

# Mine is probably different to yours, please set appropriately
path_to_code='/c/Code'

alias rs='cd ${path_to_code}/root-site'
alias pwn='cd ${path_to_code}/payworks-next/payworks-next'
alias nv2='cd ${path_to_code}/payworks-next-v2'
alias aei='cd ${path_to_code}/ascentis-imports'
alias dni='cd ${path_to_code}/payworks-dotnet-internal'
alias fin='cd ${path_to_code}/web-interface'
alias jgcomp='cd ${path_to_code}/payworks-benefits-setup'

alias crm_log='curl -k https://crm.payworks.ca/implementation_log > /c/implementation_log'
alias crm_test='curl -k https://crm.testweb.payworks.ca/implementation_log > /c/test_implementation_log'

# DotNet Build Internal
dnbi() {
    initial_folder=$(pwd)
    cd ${path_to_code}/payworks-dotnet-internal
    build_csprojs
    build_microservices
    # build_to_iis src/Payworks.WebServices.Internal Payworks.Intranet.Core core
    cd $initial_folder
}
alias bapi='build_to_iis ${path_to_code}/payworks-dotnet-internal/src/Payworks.WebServices.Internal Payworks.Intranet.Core core'

# DotNet Build next v2
dnb2() {
    initial_folder=$(pwd)
    cd ${path_to_code}/payworks-next-v2
    build_csprojs
    build_microservices
    # Setting this up "normally" has issues I can't figure out yet,
    # don't set these up in IIS unless you want to do a bunch of work
    build_to_iis src/Payworks.Web.Core Payworks.Web.Core NextV2Web
    build_to_iis src/Payworks.WebServices.Core Payworks.WebServices.Core NextV2API
    cd $initial_folder
}

build_csprojs() {
    # Find everything but the SyncPB MicroService, it has weird issues
    projects=$(find . -type f -iname *.csproj -not -iname *SyncPB*)
    for proj in $projects
    do
        cd $(dirname "$proj")
        dotnet build
        cd -
    done
}

build_microservices() {
    # Find everything but the SyncPB MicroService, it has weird issues
    projects=$(find . -type f -iname *.sfproj -not -iname *SyncPB*)
    for proj in $projects
    do
        # Replace sysnative with system32 to run on a 64-bit terminal rather than in a 32-bit environment
        sed -i -b 's/sysnative/system32/g' $proj
        cd $(dirname "$proj")
        dotnet build
        cd -
        # Switch it back to not leave a diff in git
        sed -i -b 's/system32/sysnative/g' $proj
    done
}

build_to_iis() {
    folder=$1
    site_name=$2
    app_pool_name=$3

    cd $folder

    /c/Windows/System32/inetsrv/appcmd.exe stop site $site_name
    /c/Windows/System32/inetsrv/appcmd.exe stop apppool $app_pool_name
    dotnet build
    dotnet publish
    /c/Windows/System32/inetsrv/appcmd.exe start apppool $app_pool_name
    /c/Windows/System32/inetsrv/appcmd.exe start site $site_name

    cd -
}
