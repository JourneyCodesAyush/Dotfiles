# Dotfiles

My personal configuration files and setup scripts.
Currently contains Windows setup only - more platforms may be added later (when I use them).

---

## What's inside

- `windows/` - PowerShell scripts for setting up a new Windows machine
- `nvim/` - Neovim config (LazyVim)
- `vscode/` - VS Code settings and extensions list

---

## Setup on a new Windows machine

> [!NOTE]
> Must be run as Administrator

**1. Install Chocolatey**

```powershell
.\windows\install-chocolatey.ps1
```

**2. Install packages**

```powershell
.\windows\choco-packages.ps1
```

**3. Install WinGet packages**

```powershell
winget import -i .\windows\winget.json
```

**4. Install global packages**

```powershell
.\windows\global-package.ps1
```

**4. Create symlinks**

```powershell
.\windows\symlinks.ps1
```

---

## VS Code extensions

To restore extensions:

```powershell
Get-Content vscode\extensions.txt | ForEach-Object { code --install-extension $_ }
```

To export current extensions:

```powershell
code --list-extensions > vscode\extensions.txt
```

---

## License

> Files have their respective licenses

[MIT](LICENSE)
