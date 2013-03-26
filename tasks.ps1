# get daily job results
import-module PSScheduledJob


<#
 # Gets the results from a given task being run under schedule. 
#>
function Get-TaskResults($taskName){
    Get-job -Name $taskName | 
    select -First 1 | 
    Receive-Job -Keep
}

function Get-TaskStatus($TaskName){
    get-job -name $TaskName | 
    select -First 1 |
    Format-Table -Property ID, Name, PSBeginTime, PSEndTime, @{Label="Elapsed Time"; Expression={$_.PSEndTime - $_.PSBeginTime}} 
}