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

### Working with Env Vars

All environment variables can be list out using `env` command.

To filter out env vars - use  `grep` such as --- `env | grep`

#### Setting and Unsetting Env Vars

In terminal, env vars can be set using `export Hello='Hello world'`

To unset, use --- `unset Hello`

Env Vars can be temporarily set while running command, for example, 

```sh

Hello='World' ./bin/print_message
```

Within a bash script, env vars can be set without using `export` --- such as:

```sh

#!/usr/bin/env bash

HELLO='World'

echo $HELLO
```

#### Printing Env Vars

Env Vars can be print using `echo $HELLO`

#### Scoping of Env Vars

While opening a new bash terminals in VS code, it will not be aware of env vars that being set in another environment/window. To persist env vars accross all the future terminals, env vars needs to be set in bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

Env vars can be persisted in Gitpod using its Gitpod secrets storage.

```
gp env HELLO='World'
```
Env vars can also be stored in `.gitpod.yml` file to store non-sensitive information.
