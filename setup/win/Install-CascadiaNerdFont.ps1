function Install-CascadiaNerdFont {
    [CmdletBinding()]
    param (
        [bool] $WindowsCompatibleOnly = $true
    )

    # Define Cascadia Code Nerd Font dowload url and location for download
    $DLUrl = 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip'
    $DLPath = "$env:USERPROFILE\.terminal\cascadia.zip"
    $UnzipPath = "$env:USERPROFILE\.terminal\cascadia"

    # Create '.terminal' folder if it doesn't exist
    if (-not (Test-Path $DLPath)) {
        Write-Host "Creating '.terminal' folder in user profile"
        New-Item -Path $env:USERPROFILE -Name '.terminal' -ItemType Directory
    }

    # Download Cascadia Code NF and extract
    Invoke-WebRequest -Uri $DLUrl -OutFile $DLPath
    Expand-Archive -Path $DLPath -DestinationPath $UnzipPath
    start-sleep -Seconds 2

    # Install all valid fonts in downloaded package.
    $fonts2Install = Get-ChildItem -Path $UnzipPath -Recurse | Where-Object {
        $IsValidFileExtension = $_.Extension -match 'ttf|otf'

        if ($WindowsCompatibleOnly) {
            $IsValidFileExtension -and ($_.BaseName -match 'Windows Compatible')
        }
        else {
            $IsValidFileExtension
        }
    }
    foreach ($font in $fonts2Install) {

        $FullPath = $font.FullName
        $Name = $font.Name
        $UserInstalledFonts = "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\Fonts"
        If (!(Test-Path "$UserInstalledFonts\$Name")) {
            (New-Object -ComObject Shell.Application).Namespace(0x14).CopyHere($FullPath,0x10)
            Write-Host "Installed Font $Name...moving on!"
        }
        else {
            Write-Host "Font $Name is already installed..." -ForegroundColor Green
        }
    }
}

# Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -OutFile Fonts.zip & Expand-Archive .\Fonts.zip & start-sleep -s 2 && Get-ChildItem -Path ./Fonts -Include '*.ttf','*.ttc','*.otf' -Recurse | ForEach {(New-Object -ComObject Shell.Application).Namespace(0x14).CopyHere($_.FullName,0x10)}

