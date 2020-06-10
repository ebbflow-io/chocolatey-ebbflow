# chocolatey-ebbflow
Chocolatey package configuration for Ebbflow

Official documentation about installation is at https://ebbflow.io/documentation#client 

https://github.com/ebbflow-io/ebbflow

## Instructions to release
- When there is a new release of the client, update the following:
  - `url64` in `chocolateyinstall.ps1`
  - `checksum64` in `chocolateyinstall.ps1`
  - `version` in `chocolatey-ebbflow.nuspec`
- Test Locally
  - `choco pack`
  - `choco install ebbflow -s .`
  - Test..