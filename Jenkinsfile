//Script//
def SourceControlDBFolder = "C:\\Users\\Administrator\\Documents\\Git\\Test_RW\\Test_RW"
def TempDBName = "New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx"
def NuGetName = NG_RW_Test
def VersionNumber = "1.${env.BUILD_NUMBER}"

node {
  stage('Build') {
    
    dir('chkRobTest') {
      checkout scm
  
    }
       powershell """
       Write-Host "hello pwd"
       pwd
       
       
	   C:\\PS\\Build.ps1 -SourceControlDBFolder ${SourceControlDBFolder}  -TempDBName (${TempDBName}) -NugetPackageID pckTestRWx -NugetPackageVersion "${VersionNumber}" -NugetPackageOutputDir C:\\nuget\\Test_RWp"""
  }

  stage('Test') {
    echo 'This is a test stage that is not used yet. Might be used later...... :)'
  }
  
  stage('Create Release') {
    //def VersionNumber = "1.9"
	powershell """C:\\PS\\CreateRelease.ps1 -SourceNugetPackage C:\\nuget\\Test_RWp\\pckTestRWx."${VersionNumber2}".nupkg -DevDBName (New-DatabaseConnection -ServerInstance ROB\\DEV -Database RW_TEST -Username Jenkins -Password xxx) -NugetPackageOutputDir C:\\nuget\\Test_RWp\\Test_RWv${VersionNumber2}"""
  }
    
  stage('Deploy to Dev') {
    //echo 'Will be used soon'
    timeout(time: 10, unit: 'MINUTES') {
		input message:'Approve?',
		ok: 'Deploy'
		
	}
	
	//powershell '''C:\\PS\\Sync.ps1 -SourceConnection (New-DatabaseConnection -ServerInstance ROB\\BUILD -Database RW_TEST -Username Jenkins -Password xxx) -TargetConnection (New-DatabaseConnection -ServerInstance ROB\\DEV -Database RW_TEST -Username Jenkins -Password xxx)'''
	
	
  }
}