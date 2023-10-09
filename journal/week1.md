# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows :-

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```


[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables
### Terrform Cloud Variables

In Terraform, variables can set using two types:-

- Environment Variables - would set in bash terminal eg. AWS credentials
- Terraform Variables - would normally set in `tfvars` files

Terraform Cloud Variables can be set sensitive so that they are not visible in the UI

### Loading Terraform Input Variables

`-var` flag can be used to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my_user_uuid"`

### var flag

The var flag is a key component in Terraform that allows you to set and manipulate input variables when running Terraform commands. It's a versatile tool for customizing your infrastructure deployments.


### var-file flag

The var-file flag is used to specify an external variable file that contains values for input variables. It's a handy way to keep your variable values separate from your Terraform configurations, especially when dealing with sensitive information.

### terraform.tfvars

terraform.tfvars is a default file where you can define variable values for your Terraform configurations. These values can be automatically loaded when you run Terraform commands.


### auto.tfvars
auto.tfvars is another file that Terraform automatically loads to set variable values. It can be useful when you want to provide default values for your variables without explicitly specifying them on the command line.

### order of terraform variables

The order in which Terraform variables are defined can affect how they are processed. Variables are typically loaded in the following order, with later values overriding earlier ones:

- Environment variables

- `terraform.tfvars`

- `terraform.tfvars.json`

- `terraform.tfvars.hcl`

- `auto.tfvars`
- `auto.tfvars.json`
- `auto.tfvars.hcl`
- `-var command line flags`

## Changing state - remote/local

Terraform state is essential for tracking and managing the resources you create. Depending on your project's requirements, you can store your state remotely in a service like Terraform Cloud or locally on your machine. Managing state effectively is crucial to maintain the integrity of your infrastructure.



## Dealing with Configuration Drift


### What happens if you loose your state file?

If you loose your state file, you moost likely to tear down your all cloud infrastructure manually.

You can use terraform import, but it won't work for all cloud resources. You need to check the terrraform provider's documentation for which rsources support import. 
### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import]()

### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through ClickOps. 

If we run Terraform plan, it will atttempt to put our infrastructure back into the expected state fixinig our Confriguration drift. 

## Fix using Terraform Refresh


## Terraform Modules

### Terraform Module structure

It is recommended to palce modules in `modules` directory when lcoally developing modules but it can be named whatever you like.
### Passing Input variabels

We can pass input variables to our module

The module has to declare the terraform variables in its own `variabels.tf`
```hcl

  module "terrhouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  
}```



### Module Sources

Using the  `source` we can import the module form various places eg;

- locally
- github
- terraform Registry





