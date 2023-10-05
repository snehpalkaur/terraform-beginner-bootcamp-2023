- [Semantic Versioning](#semantic-versioning)
- [Isntall the Terraform CLI](#isntall-the-terraform-cli)
  * [Cosniderations with the Terraform CLI changes](#cosniderations-with-the-terraform-cli-changes)
  * [Considerations for Linux distributions](#considerations-for-linux-distributions)
  * [Refactor the insatallation process into Bash script](#refactor-the-insatallation-process-into-bash-script)
    + [Linux permissions for Bash scripts](#linux-permissions-for-bash-scripts)
    + [Working with Env Vars](#working-with-env-vars)
    + [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
    + [Printing Env Vars](#printing-env-vars)
    + [Scoping of Env Vars](#scoping-of-env-vars)
    + [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
- [AWS CLI Installation](#aws-cli-installation)
- [Terraform Basics](#terraform-basics)
  * [Terraform Registry](#terraform-registry)
  * [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
  * [Terraform Lock files](#terraform-lock-files)
  * [Terraform state files](#terraform-state-files)
  * [Terraform Directory](#terraform-directory)
- [Deploying an S3 Bucket with Terraform AWS Provider](#deploying-an-s3-bucket-with-terraform-aws-provider)
- [Issues with Terraform Cloud Login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)



## Semantic Versioning 

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


#### Linux permissions for Bash scripts

By default, system will not allow to execute the script. To modify the permissions of the file, change the user permissions to execute using following command.

```bash
chmod u+x ./bin/install_terraform_cli
```

#### Working with Env Vars

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

## AWS CLI Installation

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

## Terraform Basics 


### Terraform Registry 

Terraform gets its building blocks from the [Terraform Registry](https://registry.terraform.io/?product_intent=terraform):

- **Providers** ⚙️: Providers are like keys that let Terraform work with different computer services.

- **Modules** 🧩: Modules are like Lego blocks. They help organize and reuse your Terraform code.

### Terraform Console 

To start using Terraform, type `terraform` in your computer's command line. It's like a menu showing available commands.

#### Terraform Init 

Before you start using Terraform for a project, run `terraform init` to set up your tools.

#### Terraform Plan 

Use `terraform plan` to see what changes Terraform will make to your infrastructure before making them.

#### Terraform Apply 

When you're ready to make changes, use `terraform apply` to apply the changes to your infrastructure.
While running the `terraform apply` cmd, it will ask for approval - to automate it, use auto approve flag eg. `terraform apply --auto-approve`

#### Terraform Destroy 

To destroy your Terraform-managed resources, use the `terraform destroy` command. If you want to automate the approval process, include the `--auto-approve` flag like this:

```bash
terraform destroy --auto-approve
```

### Terraform Lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used within the project.

The Terrform Lock file **should be commited** to the Version Control System(VSC) eg. Github

### Terraform state files

`.terraform.tfstate` contains information about the current state of the infrastrucutre.

This file **should not be committed** to VCS. It can contain sensitive information and losing it could potentially lose knowning the state of the infrastructure.

`.terraform.tfstate.backup` is the previous state file.

### Terraform Directory

`.terraform` directory contains binaries of the terraform providers.


## Deploying an S3 Bucket with Terraform AWS Provider 

Basic example of Terraform code for creating an S3 bucket:
```hcl
resource "aws_s3_bucket" "example" {
  #Bucket naming rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result

}

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length  = 32
  special = false
}
```
When deploying an S3 bucket using Terraform and the AWS provider, it's crucial to follow AWS documentation guidelines. Failure to adhere to these guidelines may result in errors, such as bucket validation issues :

```shell

Enter a value: yes

random_string.bucket_name: Creating...
random_string.bucket_name: Creation complete after 0s [id=r0)V?!$D-0MJX5fmGGWgbgkF?R)v!gK_]
aws_s3_bucket.example: Creating...
╷
│ Error: validating S3 Bucket (r0)V?!$D-0MJX5fmGGWgbgkF?R)v!gK_) name: only lowercase alphanumeric characters and hyphens allowed in "r0)V?!$D-0MJX5fmGGWgbgkF?R)v!gK_"
│ 
│   with aws_s3_bucket.example,
│   on main.tf line 24, in resource "aws_s3_bucket" "example":
│   24: resource "aws_s3_bucket" "example" {
│ 
╵

```

 For AWS bucket naming conventions, please refer to the [official AWS documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html).


## Issues with Terraform Cloud Login and Gitpod Workspace 

When attempting to execute `Terraform login`, it launches a graphical interface to generate an authentication token. However, this process doesn't function as expected when using GitPod VSCode in a web browser.

To resolve this issue, a manual token generation step is required in Terraform Cloud. Follow these steps:

1. Manually generate a token by visiting the following URL in your web browser: 🌐


 ```
 https://app.terraform.io/app/settings/tokens?source=terraform-login
 ```

 After generating the token, create and open a file manually by running the following commands in your GitPod workspace: 💼


 ```bash
 
 touch /home/gitpod/.terraform.d/credentials.tfrc.json
 open /home/gitpod/.terraform.d/credentials.tfrc.json
 ```

In the opened file (credentials.tfrc.json), provide the following JSON structure: 📝

```json

{
    "credentials":{
     "app.terraform.io":{
        "token":"YOUR-TOKEN_CODE"
        }
    }
}
```

To streamline the terraform login process,  - a bash script was utilized which is located at [./bin/generate_tfrc_credentials](./bin/generate_tfrc_credentials)

following is the bash script used--

```bash
#!/usr/bin/env bash

# Define target directory and file
TARGET_DIR="/home/gitpod/.terraform.d"
TARGET_FILE="${TARGET_DIR}/credentials.tfrc.json"

# Check if TERRAFORM_CLOUD_TOKEN is set
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
    echo "Error: TERRAFORM_CLOUD_TOKEN environment variable is not set."
    exit 1
fi

# Check if directory exists, if not, create it
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi

# Generate credentials.tfrc.json with the token
cat > "$TARGET_FILE" << EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_CLOUD_TOKEN"
    }
  }
}
EOF

echo "${TARGET_FILE} has been generated."
```









