//Script//
node {
  stage('Build') {
    def VersionNumber = "1.9"
	//echo VersionNumber
    dir('chkRobTest') {
      checkout scm
  
    }
       //def VersionNumber = "1.9"
	   powershell """
       Write-Host "hello pwd"
       pwd
       
       
	   C:\\PS\\Build.ps1 -SourceControlDBFolder C:\\Users\\Administrator\\Documents\\Git\\Test_RW\\Test_RW  -TempDBName (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -NugetPackageID pckTestRWx -NugetPackageVersion "${VersionNumber}" -NugetPackageOutputDir C:\\nuget\\Test_RWp"""
  }

  stage('Test') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }
  
  stage('Create Release') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }
  
    stage('Export Release') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }

  stage('Deploy to Dev') {
    //echo 'Will be used soon'
    timeout(time: 10, unit: 'MINUTES') {
		input message:'Approve?',
		ok: 'Deploy'
	}
	
	powershell '''C:\\PS\\Sync.ps1 -SourceConnection (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -TargetConnection (New-DatabaseConnection -ServerInstance ROB\\DEV -Database RW_TEST -Username Jenkins -Password xxx)'''
	
	
  }
}