#Capture AD Profile Settings Script#
##start-process powershell –verb runAs
Import-Module ActiveDirectory
$AccountName = Read-Host "Enter Username" ##Prompts user to enter account name
$AccountDetails = (Get-Aduser -identity $AccountName -Properties samaccountname | Select-Object -ExpandProperty samaccountname ) -join ','  ##Grabs Account Name
$Given = (Get-Aduser -identity $AccountName -Properties givenname| Select-Object -ExpandProperty givenname ) -join ',' ## Grabs First Name
$Sur = (Get-Aduser -identity $AccountName -Properties surname| Select-Object -ExpandProperty surname ) -join ','  ##Grabs Last Name
$Desc = (Get-Aduser -identity $AccountName -Properties Description| Select -ExpandProperty Description ) -join ',' ##Grabs Description AKA Job Title
Get-ADPrincipalGroupMembership $AccountName | Select name | ##Grabs Domain Groups  ##Grabs Domain Groups
Select @{Name = "Groups"; Expression = {$_.name}}, @{Name = "Account Name"; Expression = {$AccountDetails}}, @{Name = "First Name"; Expression = {$Given}}, @{Name = "Last Name"; Expression = {$Sur}},
@{Name = "Title"; Expression = {$Desc}} |  ##Grabs Data For Output
Export-Csv "F:\IS DEPT\Documentation\ADGroupMembership\$AccountName.csv" ##Outputs to Folder
explorer.exe "F:\IS DEPT\Documentation\ADGroupMembership\$AccountName.csv"   ##Opens File
