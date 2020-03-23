param (
    [Parameter(Mandatory=$false)] 
    [String]  $Machine = 'LAPTOP-Priyanka'
      )

Clear-Host

Stop-Computer -computerName $Machine -Force

Write-Output "Turnning Off the machine $Machine"

Start-Sleep -s 20

Exit
