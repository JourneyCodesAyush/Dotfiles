# symlinks.ps1

# Must be run as Administrator

$repo = Split-Path $PSScriptRoot -Parent


# VS Code

$vscodeSource = "$repo\vscode\settings.json"
$vscodeTarget = "$env:APPDATA\Code\User\settings.json"

New-Item -ItemType Directory `
    -Path "$env:APPDATA\Code\User" `
    -Force | Out-Null

New-Item -ItemType SymbolicLink `
    -Path $vscodeTarget `
    -Target $vscodeSource `
    -Force


# Neovim

$nvimSource = "$repo\nvim"
$nvimTarget = "$env:LOCALAPPDATA\nvim"

New-Item -ItemType SymbolicLink `
    -Path $nvimTarget `
    -Target $nvimSource `
    -Force

# Alacritty

$alacrittySource = "$repo\alacritty\alacritty.toml"
$alacrittyTarget = "$env:APPDATA\alacritty\alacritty.toml"

New-Item -ItemType Directory `
    -Path "$env:APPDATA\alacritty" `
    -Force | Out-Null

New-Item -ItemType SymbolicLink `
    -Path $alacrittyTarget `
    -Target $alacrittySource `
    -Force

