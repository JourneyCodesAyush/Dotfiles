# packages.ps1
# Install all packages via Chocolatey
# Run as Administrator

choco install "$PSScriptRoot\..\packages.config" -y
