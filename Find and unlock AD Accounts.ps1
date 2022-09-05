#   ====================================================================================
#                                                       
#   NAME:			Unlocker.ps1 
#   AUTHOR:			JJH
#   LAST REVISED:	August 03, 2022
#   VERSION:		1.1
#
#   Displays accounts that are locked out in current domain and asks if you would like
#   and asks if you would like to unlock all of them.  Pressing Y will unlock and 
#   rerun cheecking for the current account locks.  If empty press n and 
#   script will terminate

#   Requires the ActiveDirectory module to be available.
#
#   =======================================================================================

Import-Module ActiveDirectory
$accToUnlock = Search-ADAccount -LockedOut
# main loop, stops when $accToUnlock = stop
while ($accToUnlock -ne 'n') {

#display the currently locked accounts and ask to enter SamAccountName of the one you'd like to unlock
Write-Host "The following accounts are currently locked out:"
Search-ADAccount -LockedOut | Format-Table Name, SamAccountName

$accToUnlock = Read-Host -Prompt 'Do you want to unlock all of these accounts: ("n" to cancel, "y" to unlock the list)'
if ($accToUnlock -eq 'n') {Write-Host "Terminating...."} #Breaks the loop and ends program

else {if ($accToUnlock -eq 'y') {Search-ADAccount -LockedOut |Unlock-ADAccount}}}



