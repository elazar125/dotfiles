# ------------------------------------------------------------------------
# pull_request: Open a PR in Stash
# ------------------------------------------------------------------------
#
# Open your browser to the "create pull request" page in Stash
# Pre-sets the source branch to your currently-checked-out branch, 
# and the target to the project's default branch

branch=$(git rev-parse --abbrev-ref HEAD)
url=$(git config remote.origin.url)
email=$(git config user.email)
regex="https://${email%@*}@stash.payworks.ca/scm/(.*)/(.*).git"

if [[ $url =~ $regex ]]
then
    proj=${BASH_REMATCH[1]}
    cwd=${BASH_REMATCH[2]}
    start https://stash.payworks.ca/projects/$proj/repos/$cwd/pull-requests?create=true\&sourceBranch=refs/heads/$branch
else
    echo "Regex failed"
fi
