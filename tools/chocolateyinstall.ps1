$ErrorActionPreference = 'Stop';

$packageName= 'ebbflow'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = 'https://github.com/ebbflow-io/ebbflow/releases/download/0.5.20/ebbflow_0.5.20.msi'

  softwareName  = 'ebbflow*'

  checksum64    = '0FB77CFB0428524C3DDC624CB6EE9B5E22F73FEC81A73CA562277E5C80492A4F'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
