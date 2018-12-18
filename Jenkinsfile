//Script//
node {
  stage('Build') {
    echo VersionNumber
       powershell '''$errorActionPreference = "stop"
       C:\\PS\\Build.ps1 -SourceControlDBFolder C:\\Users\\Administrator\\Documents\\Git\\Test_RW\\Test_RW -TempDBName (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -NugetPackageID pckTestRWx -NugetPackageVersion "${env:VersionNumber}" -NugetPackageOutputDir C:\\nuget\\Test_RWx'''
  }

  stage('Test') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }

  stage('Deploy to Dev') {
    echo 'Will be used soon'
  }
}
