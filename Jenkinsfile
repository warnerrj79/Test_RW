//Script//
node {
  stage('Build') {
    echo VersionNumber
       powershell '''
       pwd
       Get-ChildItem
       C:\\PS\\Build.ps1 -SourceControlDBFolder C:\\Users\\Administrator\\Documents\\Git\\Test_RW\\Test_RW  -TempDBName (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -NugetPackageID pckTestRWx -NugetPackageVersion "${env:VersionNumber}" -NugetPackageOutputDir C:\\nuget\\Test_RWp'''
  }

  stage('Test') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }

  stage('Deploy to Dev') {
    //echo 'Will be used soon'
    powershell '''C:\\PS\\Sync.ps1 -SourceConnection (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -TargetConnection (New-DatabaseConnection -ServerInstance ROB\\DEV -Database RW_TEST -Username Jenkins -Password xxx)
  }
}
