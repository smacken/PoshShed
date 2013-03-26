$siteList = "http://google.com", "http://msn.com"

Register-ScheduledJob -Name Ping -Trigger (New-JobTrigger -once -RepetitionInterval (New-TimeSpan -Hour 1) -RepetitionDuration ([TimeSpan]::MaxValue)) -ScriptBlock {
    foreach ($site in $siteList)
    {
        Invoke-WebRequest -Uri $site
    }
}