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

### var-file flag

### terraform.tfvars

### auto.tfvars

### order of terraform variables

## Changing state - remote/local