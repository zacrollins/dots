function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# set execution policy remote signed to allows scripts to be ran
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# make sure latest powershell get is installed
Install-PackageProvider -Name NuGet -Force
Install-Module PowerShellGet -AllowClobber -Force

# set PS repository as trusted
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# install chocolatey
# Install-Chocolatey

# make sure winget is installed
$hasPackageManager = Get-AppPackage -Name 'Microsoft.DesktopAppInstaller'
if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]'1.10.0.0') {
    Start-Process ms-appinstaller:?source=https://aka.ms/getwinget
    Read-Host -Prompt 'Press enter to continue...'
}

$packages = @(
    '7zip.7zip'
    'AltSnap.AltSnap'
    'Helm.Helm'
    'Git.Git'
    'Google.Chrome'
    'JanDeDobbeleer.OhMyPosh'
    'Microsoft.Azure.AZCopy.10'
    'Microsoft.AzureCLI'
    'Microsoft.AzureDataStudio'
    'Microsoft.AzureDataStudio.Insiders'
    'Microsoft.Azure.StorageExplorer'
    'Microsoft.Bicep'
    'Microsoft.DotNet.SDK.7'
    'Microsoft.Edge'
    'Microsoft.Teams'
    'Microsoft.Nuget'
    'Microsoft.PowerShell'
    'Microsoft.PowerToys'
    'Microsoft.SqlServerManagementStudio'
    'Microsoft.VisualStudio.2022.BuildTools'
    # 'Microsoft.VisualStudio.2022.Enterprise'
    'Microsoft.VisualStudioCode'
    'Microsoft.VisualStudioCode.Insiders'
    'Microsoft.WindowsTerminal'
    'Docker.DockerDesktop'
    'ShiningLight.OpenSSLLight'
    'SourceFoundry.HackFonts'
    'Twilio.Authy'
)

$packages | ForEach-Object {
    if (winget install --exact --silent --id $_) {
        Write-Output "Success on $_"
    }
    else {
        Write-Output "Error on $_"
    }
}

# install ahk with ui access
winget install -e -id Lexigos.Autohotkey --override '/S /uiAccess=1'

# Install all RSAT tools
# Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

# wsl
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
# wsl 2
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# restart to enable wsl features
Restart-Computer

# download Linux Kernel update package
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile (Join-Path -Path $env:Temp -ChildPath 'wsl_update_x64.msi')

# set wsl version 2
wsl.exe --set-default-version 2

# install ubuntu from windows store
wsl --install -d Ubuntu

# powershell modules
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
$modules = @(
    'Az'
    'AzureADPreview'
    'Bicep'
    'CompletionPredictor'
    'InvokeBuild'
    'Microsoft.PowerShell.SecretManagement'
    'Microsoft.PowerShell.SecretStore'
    'Pester'
    'posh-git'
    'PSKubeContext'
    'PSScriptAnalyzer'
    'PSWindowsUpdate'
    'SqlServer'
    'Terminal-Icons'
    'VSSetup'
    'VSTeam'
)
foreach ($module in $modules) {
    Write-Verbose -Message "Installing [$module]..." -Verbose
    Install-Module -Name $module
}

# Install IIS
# $iisFeatureNames = @(
#     'IIS-WebServerRole'
#     'IIS-WebServer'
#     'IIS-CommonHttpFeatures'
#     'IIS-ManagementConsole'
#     'IIS-HttpErrors'
#     'IIS-HttpRedirect'
#     'IIS-WindowsAuthentication'
#     'IIS-StaticContent'
#     'IIS-DefaultDocument'
#     'IIS-HttpCompressionStatic'
#     'IIS-DirectoryBrowsing'
# )
# Enable-WindowsOptionalFeature -Online -FeatureName @iisFeatureNames