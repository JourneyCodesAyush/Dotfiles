# symlinks.ps1
# Must be run as Administrator

$repo = Split-Path $PSScriptRoot -Parent

# VS Code
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Code\User\settings.json" -Target "$repo\vscode\settings.json" -Force

# Neovim
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$repo\nvim" -Force