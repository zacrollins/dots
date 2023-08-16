#If the file does not exist, create it.
if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts -PathType Leaf)) {
    try {
        # Detect Version of Powershell & Create Profile directories if they do not exist.
        if ($PSVersionTable.PSEdition -eq "Core" ) {
            if (!(Test-Path -Path ($env:userprofile + "\Documents\Powershell"))) {
                New-Item -Path ($env:userprofile + "\Documents\Powershell") -ItemType "directory"
            }
        }
        elseif ($PSVersionTable.PSEdition -eq "Desktop") {
            if (!(Test-Path -Path ($env:userprofile + "\Documents\WindowsPowerShell"))) {
                New-Item -Path ($env:userprofile + "\Documents\WindowsPowerShell") -ItemType "directory"
            }
        }
    }
    catch {
        throw $_.Exception.Message
    }
}
# If the file already exists, rename to 'oldprofile.ps1'.
else {
    Get-Item -Path $PROFILE.CurrentUserAllHosts | Move-Item -Destination oldprofile.ps1
}

# Symlink PS profile to profile in dotfiles repo
New-Item -Path ~\Documents\PowerShell\profile.ps1 -ItemType SymbolicLink -Value (Get-Item ".\Profile.ps1").FullName

# OMP Install
#
winget install -e --accept-source-agreements --accept-package-agreements JanDeDobbeleer.OhMyPosh

# Install Cascadia Code Nerd Fonts
. .\Install-CascadiaNerdFont.ps1

Install-CascadiaNerdFont

# Choco install
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
