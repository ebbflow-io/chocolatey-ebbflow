# chocolatey-ebbflow
Chocolatey package configuration for [Ebbflow](https://ebbflow.io)

Official documentation about installation is at https://ebbflow.io/documentation#client 

Client Repo: https://github.com/ebbflow-io/ebbflow

View on chocolatey: https://chocolatey.org/packages/ebbflow

## Instructions to release
- When there is a new release of the client, update the following:
  - `url64` in `chocolateyinstall.ps1`
  - `checksum64` in `chocolateyinstall.ps1`
  - `version` in `chocolatey-ebbflow.nuspec`
- Test Locally
  - `choco pack`
  - `choco install ebbflow -s .`
  - Test..
- `choco push .\ebbflow.X.X.X.nupkg --source https://push.chocolatey.org`
