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


# PowerShell 7 Profile

$profileSource = "$repo\windows\Microsoft.PowerShell_profile.ps1"
$profileTarget = $PROFILE.CurrentUserCurrentHost

New-Item -ItemType Directory `
    -Path (Split-Path $profileTarget -Parent) `
    -Force | Out-Null

# Back up existing profile before replacing it
if (Test-Path $profileTarget) {
    $existingItem = Get-Item $profileTarget

    if ($existingItem.LinkType -ne "SymbolicLink") {
        Copy-Item $profileTarget "$profileTarget.bak" -Force
        Remove-Item $profileTarget -Force
    }
    else {
        Remove-Item $profileTarget -Force
    }
}

# Create symbolic link
New-Item -ItemType SymbolicLink `
    -Path $profileTarget `
    -Target $profileSource `
    -Force | Out-Null
