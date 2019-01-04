#Input parameters - required!!!
Param(
    [Parameter(Mandatory=$true)]
    [string]$SourceNugetPackage
    ,[Parameter(Mandatory=$true)]
    [RedGate.Versioning.Automation.Compare.SchemaSources.DatabaseConnection]$DBName
    ,[Parameter(Mandatory=$true)]
    [string]$NugetPackageOutputDir
)

#Required Variables!!!
#$SourceNugetPackage = "C:\nuget\Test_RWp\pckTestRWx.1.9.nupkg"
#$DBName = New-DatabaseConnection -ServerInstance "ROB\DEV" -Database "RW_TEST" -Username Jenkins -Password xxx
#$NugetPackageOutputDirC:\nuget\Test_RWp\Test_RWv2

#Create release nuget and export to directory!!!!
$errorActionPreference = "stop"
$Release = New-DatabaseReleaseArtifact -Source (Import-DatabasebuildArtifact $SourceNugetPackage) -Target ($DBName)

$Release | Export-DatabaseReleaseArtifact -Path $NugetPackageOutputDir