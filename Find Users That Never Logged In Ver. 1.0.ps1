Import-Module ActiveDirectory  ##Import AD
get-aduser -f {-not (lastlogontimestamp -like "*") -and (enabled -eq $true)} -Properties * | select displayname | ##Grabs User Info
Export-Csv "H:\Powershell Testing\User Tests\AccountInfo.csv" 
explorer.exe "H:\Powershell Testing\User Tests\AccountInfo.csv" 







## "F:\IS DEPT\Documentation\ADGroupMembership\$AccountName.csv" ##Outputs to Folder
##explorer.exe "F:\IS DEPT\Documentation\ADGroupMembership\$AccountName.csv"  ##Opens File
