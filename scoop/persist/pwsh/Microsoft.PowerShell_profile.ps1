Import-Module PSReadLine

$ENV:EDITOR = "C:\Users\volt\scoop\shims\nvim.exe"
$ENV:_ZO_DATA_DIR = 'C:\Users\volt\.local\share\zoxide'

Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySavePath C:\Users\volt\.pwsh_history
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History

Invoke-Expression (&scoop-search --hook)

Set-Alias cd z -Option AllScope
Set-Alias cz chezmoi

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

