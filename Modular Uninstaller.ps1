#Removes Program Set by User
#Date 05-24-22
 
#Sets variable $app to get the name of the software you are uninstalling
$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "Enter Program Name Here" }

#Tries to uninstall if software not present nothing occurs
 if ($app) {
    try {
       $app.UnInstall() | Out-Null
    }
    catch {
       Write-Error "Error occurred: $_"
    }
 }