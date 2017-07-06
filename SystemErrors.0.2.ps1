 <#
.SYNOPSIS
    Quick and dirty script to get errors from System Event Log for past 24 hours
.DESCRIPTION
    This is designed to query an Event Log, defaulting to System, Types of output,
    defaulting to Error from the previous X number hours, defaulting to 24	
    and output them to a file with the default located at c:\temp\ErrorReview.txt
 
.NOTES
    File Name      : SystemErrors.0.2.ps1
    Author         : J Siegel (wolfflight93@gmail.com)
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2017 - James L Siegel Jr.
.LINK
    Script posted over:
   
.EXAMPLE
    Example 1
.EXAMPLE
    Example 2
#>

# Things still to do: Parameterize types of Entries, adjust it for multiple days or hours, allow for destination file specification by user
#Define variables

Param(
   [string]$log="system",
   [string]$type="Error",
   $hours=24,
   [string]$path="c:\temp\ErrorReview.txt"
)

<#
$log="System"
$type="Error"
$hours=24
$path="c:\temp\ErrorReview.txt"
#>

#Execute actual command
Get-EventLog $log -EntryType $type -After (Get-Date).AddHours(-$hours) | Format-Table -wrap | Out-File $path -width 256

 
