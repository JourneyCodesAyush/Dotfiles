# Oh My Posh
# oh-my-posh init pwsh --config "$env:USERPROFILE\.poshthemes\bubbles.omp.json" | Invoke-Expression

# Zoxide
Invoke-Expression (& { zoxide init powershell | Out-String })

# PSReadLine history configuration (optional)
<#
Set-PSReadLineOption -AddToHistoryHandler {
    param($line)

    $last = Get-History -Count 1

    if ($last -and $last.ExecutionStatus -ne 'Completed') {
        return $false
    }

    # Skip trivial commands
    if ($line -match '^\s*(cd|ls|dir|clear|cls)\s*$') {
        return $false
    }

    return $true
}
#>

# Eza
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
Set-Alias ls eza

# Bat
Remove-Item Alias:cat -Force -ErrorAction SilentlyContinue
Set-Alias cat bat

# UTF-8 console encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

# Set Windows console code page to UTF-8 (optional)
# chcp 65001
