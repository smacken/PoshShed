$runtime = 08.00AM
$weekdays = "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
$daily = New-JobTrigger -Daily -At $runtime
$weekly = New-JobTrigger -Weekly -WeeksInterval 1 -At $runtime -DaysOfWeek $weekdays
$monthly = New-JobTrigger -Weekly -WeeksInterval 4 -At $runtime -DaysOfWeek $weekdays

$options = New-ScheduledJobOption -RunElevated -WakeToRun

Register-ScheduledJob -file .\daily.ps1 -Name Daily -Trigger $daily
Register-ScheduledJob -FilePath .\weekly.ps1 -Name Weekly -Trigger $weekly
Register-ScheduledJob -FilePath .\monthly.ps1 -Name Monthly -Trigger (New-JobTrigger -At 08:00AM -Weekly -WeeksInterval 4 -DaysOfWeek $weekdays)

