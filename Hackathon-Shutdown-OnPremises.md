## Hackathon-Shutdown-OnPremises

This code will run on the On-Premises Server. Code will actually execute on the Hybrid Runbook Workers and will shutdown the machines. 



```
param (
    [Parameter(Mandatory=$false)] 
    [String]  $Machine = 'LAPTOP-Priyanka'
        
	  )

Clear-Host
Stop-Computer -computerName $Machine -Force
```

