# Set variables to indicate value and key to set
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name 'WUServer' -Value 'http://brt1-wsus2.retreathealthcare.org:8530' -force

Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name 'WUStatusServer' -Value 'http://brt1-wsus2.retreathealthcare.org:8530' -force

#Holds the Console Window Open Until Enter is Pressed Used for Troubleshooting - Just remove the #
#Read-Host -Prompt "Press Enter to exit"

