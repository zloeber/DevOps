# Windows Subsystem For Linux (WSL) AutoDeployment

This is a set of PowerShell functions that can be used to fully install WSL on your workstation. After that install has been completed you can then use some of the functions to copy over and execute bash scripts to complete configuration of your WSL environment. 

This is basically a proof of concept that may also be useful for those delving into Linux for learning or simply want to get WSL setup on their new workstation in a consistent manner. In order to get the most of these sets of scripts you will need to know a bit of PowerShell and bash scripting.

While the WSL install scripts can setup and install a few different distributions I've only tested Ubuntu. But this can be easily modified for the other available distros.

## Running This Stuff

Copy this entire folder to your workstation and run .\ConfigureWSL.ps1 from PowerShell.