$groupName = Read-Host "Enter group name" ##Prompts user to enter group name 
$results = @()
$users = Get-ADUser  -Properties memberof -Filter * 
foreach ($user in $users) {
    $groups = $user.memberof -join ';'
    $results += New-Object psObject -Property @{'User'=$user.name;'Groups'= $groups}    }
$results | Where-Object { $_.groups -notmatch $groupName } | Select-Object user
