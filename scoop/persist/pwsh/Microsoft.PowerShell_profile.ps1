Invoke-Expression (&scoop-search --hook)

Set-Alias cd z -Option AllScope

$ENV:EDITOR = "C:\Users\volt\scoop\shims\nvim.exe"
$ENV:_ZO_DATA_DIR = 'C:\Users\volt\.local\share\zoxide'

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

