function Prompt {
  # Can't use NerdFonts, PowerShell 5.1 is ASCII-only
  Write-Host ""
  Write-Host -NoNewline -ForegroundColor Red "$(Get-Date -UFormat "%H:%M") "
  Write-Host -NoNewline -ForegroundColor Cyan "$PWD "
  Write-Host -ForegroundColor Yellow "$(git rev-parse --abbrev-ref HEAD)"
  return "$ "
}

Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
