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

### AWS CLI Installation

AWS CLI is installed via bash script for this script -- [`./bin/install_aws_cli`](./bin/install_aws_cli)

:bulb: [Getting Started Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

:bulb: [AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

To check AWS credentials configuration ---

```bash
aws sts get-caller-identity
```

Once it is successful, it will return the json payload ----

```json
{
    "UserId": "xxxxxxxxxxxxx",
    "Account": "1234567890",
    "Arn": "arn:aws:iam::11111111111:user/sneh-terraform"
}
```
Aws credentials can be set using Env vars or by running AWS configure.

## Terraform Basics 🌍


### Terraform Registry 🏢

Terraform gets its building blocks from the [Terraform Registry](https://registry.terraform.io/?product_intent=terraform):

- **Providers** ⚙️: Providers are like keys that let Terraform work with different computer services.

- **Modules** 🧩: Modules are like Lego blocks. They help organize and reuse your Terraform code.

### Terraform Console 🖥️

To start using Terraform, type `terraform` in your computer's command line. It's like a menu showing available commands.

### Terraform Init 🚀

Before you start using Terraform for a project, run `terraform init` to set up your tools.

### Terraform Plan 📝

Use `terraform plan` to see what changes Terraform will make to your infrastructure before making them.

### Terraform Apply 🚧

When you're ready to make changes, use `terraform apply` to apply the changes to your infrastructure.
While running the `terraform apply` cmd, it will ask for approval - to automate it, use auto approve flag eg. `terraform apply --auto-approve`

### Terraform Lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used within the project.

The Terrform Lock file **should be commited** to the Version Control System(VSC) eg. Github

### Terraform state files

`.terraform.tfstate` contains information about the current state of the infrastrucutre.

This file **should not be committed** to VCS. It can contain sensitive information and losing it could potentially lose knowning the state of the infrastructure.

`.terraform.tfstate.backup` is the previous state file.

### Terraform Directory

`.terraform` directory contains binaries of the terraform providers.







