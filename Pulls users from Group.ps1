$ADGroup = Read-Host "Enter Group Name" ##Prompts user to enter group name
#Pulls users in the group and exports to CSV File
Get-AdGroupMember -identity "$ADGroup" | select name | Export-csv -path "H:\Docs\Group Membership\groupmembers.csv" -NoTypeInformation


