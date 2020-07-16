$ErrorActionPreference = 'Stop';

$packageName= 'ebbflow'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = 'https://github.com/ebbflow-io/ebbflow/releases/download/1.0.1/ebbflow_1.0.1.msi'

  softwareName  = 'ebbflow*'
  checksum64	= '6735B2E54C2E52B153F75BAC4C5145EC44BB3B00CDF22DDF7665F269E9BFEA7B'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\ebbflow\bin" -PathType 'Machine'


