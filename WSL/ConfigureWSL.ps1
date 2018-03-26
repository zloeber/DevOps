# Configures the WSL feature if required then attempts to install the ubuntu wsl distribution to C:\WSLDistros\Ubuntu

$DistroPath = 'C:\WSLDistros'
if (-not (Test-Path $DistroPath)) {
    try {
        $null = New-Item -ItemType:Directory -Path $DistroPath
    }
    catch {
        throw 'Unable to create the distro path specified!'
    }
}


$FinalPath = Join-Path $DistroPath 'Ubuntu'
Write-Host 'This script will attempt to install the WSL feature and the Ubuntu distro. This requires a very recent release of Windows 10 (or 2016) and may require a reboot to complete.'
Read-Host -Prompt 'Press any key to continue, to cancel press ctrl+c'

.\Install-WSL.ps1 -InstallPath $FinalPath

Write-Host 'Importing WSL functions'
. .\WSLFunctions.ps1

Write-Host 'Next, we will create a Scripts directory in the home directory of the WSL user you created. We then copy over a hashicorp.sh and wsl-post-install.sh scripts and run the later of the two to perform an installation of the most recent version of a handful of the hashicorp apps.'

Read-Host -Prompt 'Press any key to continue, to cancel press ctrl+c'

Invoke-WSLCommand -Command 'mkdir ~/testscripts'
Copy-WSLFile -Path '.\Scripts\hashicorp.sh' -Destination '~/Scripts/'
Invoke-WSLCommand -Command 'chmod +x ~/Scripts/hashicorp.sh'
Invoke-CopyStartWSLScript - '.\Scripts\wsl-post-install.sh' -Destination '~/Scripts/'


