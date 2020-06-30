$ErrorActionPreference = 'Stop';

$packageName= 'ebbflow'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = 'https://github.com/ebbflow-io/ebbflow/releases/download/0.9.0/ebbflow_0.9.0.msi' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

  softwareName  = 'ebbflow*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'A26AED4FC721B07E17560589DDD983CA3685FCDA8BEF3336A56DB02AF169F58E'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
