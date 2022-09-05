#   ====================================================================================
#                                                       
#   NAME:			Unlocker.ps1 
#   AUTHOR:			Spiceworks - JJH
#   LAST REVISED:	August 23, 2022
#   VERSION:		1.0
#
#   Gets the current WSUS server and stores as currentWU variable
#   Then switches WSUS so that RSAT can be downloaded
#   Downloads all the RSAT Tools
#   Sets WSUS back to original setting
#   =======================================================================================


$currentWU = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" | select -ExpandProperty UseWUServer
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" -Value 0
Restart-Service wuauserv
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" -Value $currentWU
Restart-Service wuauserv