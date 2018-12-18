#Input parameters - required!!!
Param(
    [Parameter(Mandatory=$true)]
    [string]$SourceControlDBFolder
    ,[Parameter(Mandatory=$true)]
    [RedGate.Versioning.Automation.Compare.SchemaSources.DatabaseConnection]$TempDBName
    ,[Parameter(Mandatory=$true)]
    [string]$NugetPackageID
    ,[Parameter(Mandatory=$true)]
    [string]$NugetPackageVersion
    ,[Parameter(Mandatory=$true)]
    [string]$NugetPackageOutputDir
)

#Required Variables!!!
#$SourceControlDBFolder = "C:\Users\Administrator\Documents\Git\Test_RW\Test_RW"
#$TempDBName = New-DatabaseConnection -ServerInstance "ROB\BUILD" -Database "RW_TEST"
#$NugetPackageID = "pckTestRWx"
#$NugetPackageVersion = 1.0
#$NugetPackageOutputDir = "C:\nuget\Test_RWx"

#Build baby build!!!!
$errorActionPreference = "stop"
$ValidatedSourceControlDBFolder = $SourceControlDBFolder | Invoke-DatabaseBuild -TemporaryDatabase $TempDBName

#Export Nuget Package to folder
$NugetPackage = New-DatabaseBuildArtifact $ValidatedSourceControlDBFolder -PackageId $NugetPackageID -PackageVersion $NugetPackageVersion
Export-DatabaseBuildArtifact $NugetPackage -Path $NugetPackageOutputDir