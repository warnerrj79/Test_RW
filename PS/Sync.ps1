#Input parameters - required!!!
Param(
    [Parameter(Mandatory=$true)]
    [RedGate.Versioning.Automation.Compare.SchemaSources.DatabaseConnection]$SourceConnection
    ,[Parameter(Mandatory=$true)]
    [RedGate.Versioning.Automation.Compare.SchemaSources.DatabaseConnection]$TargetConnection
    )



#Update the target database - there is no going back from here.....
$errorActionPreference = "stop"
Sync-DatabaseSchema -Source $SourceConnection -Target $TargetConnection