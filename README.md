# Terraform Beginner Bootcamp 2023


## Semantic Versioning :mage:

This project is going to utilize semantic versoning for its tagging --
[semver.org](https://semver.org/)

The general format:-

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

🌟 **MAJOR** version when you make incompatible API changes

🌟 **MINOR** version when you add functionality in a backward compatible manner

🌟 **PATCH** version when you make backward compatible bug fixes

## Isntall the Terraform CLI

### Cosniderations with the Terraform CLI changes

The Terraform CLI instructions have been changed due to gpg keyring changes. Refer to the latest version of 
[Terraform CLI installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and change the scripting accordingly.


### Considerations for Linux distributions

This is project is built against Ubuntu.
Please consider checking Linux distribution and change accordingly to distribution needs.

[How to check OS version in Linux](https://www.geeksforgeeks.org/how-to-check-the-os-version-in-linux/) -->

Use the following command -

```bash
cat /etc/os-release
```
### Refactor the insatallation process into Bash script

Created a bash script-- [./bin/install_terraform_cli](./bin/install_terraform_cli)

- to keep the Gipod Task [(.gitpod.yml)](.gitpod.yml) file tidy
- to allow portability for other projects to install Terraform CLI

To make the bash script portable use shabang pronounced as `Sha-bang`

`#!/usr/bin/env bash` in the top of the file.

While executing use `./` shorthand notation to execute the script.

To point the script to a program to interprete it- 
use the following in the `.gitpod.yml` file -
```yml
source ./bin/install_terraform_cli
```


### Linux permissions for Bash scripts

By default, system will not allow to execute the script. To modify the permissions of the file, change the user permissions to execute using following command.

```bash
chmod u+x ./bin/install_terraform_cli
```
