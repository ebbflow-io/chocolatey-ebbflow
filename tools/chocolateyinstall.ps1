$ErrorActionPreference = 'Stop';

$packageName= 'ebbflow'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = 'https://github.com/ebbflow-io/ebbflow/releases/download/1.1.0/ebbflow_1.1.0.msi'

  softwareName  = 'ebbflow*'
  checksum64	= 'CCF25192CBFCEE1676E6A9D2A3311829FBB592B83A755EE14B525E4710E24E43'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\ebbflow\bin" -PathType 'Machine'
