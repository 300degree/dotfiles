# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name p -Value pnpm
Set-Alias -Name touch -Value New-Item
Set-Alias grep findstr
Set-Alias ll ls
