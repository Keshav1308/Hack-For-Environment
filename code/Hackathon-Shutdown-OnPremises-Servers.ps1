param (
    [Parameter(Mandatory=$false)] 
    [String]  $Machine = 'LAPTOP-Priyanka'
      )


Stop-Computer -computerName $Machine -Force

Write-Output "Turnning Off the machine $Machine"


Exit
