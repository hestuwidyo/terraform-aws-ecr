# aws-ecr

## Create Container Registry
```hpl
module "create_ecr" {
    source = "hestuwidyo/ecr/aws"
    version = "1.0.1"

    ecr = {
        # ecr_1
        ecr_name_1 = {
            image_tag_mutability    = "IMMUTABLE"    
            scan_on_push           = false          
            encryption_type        = {
                 encryption_type    = "KMS"
                 kms_key            = "kmsKeys"
             }
        }
        # ecr_2
        ecr_name_2 = {

        }
        # etc . . .
    }
```
if you want to use AES256 just `remove` *encryption_type* block
```sh
encryption_type = {
    encryption_type    = "KMS"
    kms_key            = "kmsKeys"
    }
```

|Optional Parameter|Type|Description|
|------------------|----|-----------|
|image_tag_mutability|`string`|"MUTABLE" or "IMMUTABLE" - default `MUTABLE`|
|scan_on_push|`boolean`|`true` or `false` - default `true`|
|encryption_type|`array`|default `AES256`|



## Define Container Registry Policy
```hpl
image_policy    = {
    # image_policy_1
    ecr_name_1 = {
        policy = [
                {
                  "rulePriority": 1,
                  "description": "Expire images older than 14 days",
                  "selection": {
                      "tagStatus": "any",
                      "countType": "sinceImagePushed",
                      "countUnit": "days",
                      "countNumber": 14
                  },
                  "action": {
                      "type": "expire"
                  }
                }
        ]
    }
    # image_policy_2
    ecr_name_2 = {
        policy = [
                {
                  "rulePriority": 1,
                  "description": "Keep last 40 images",
                  "selection": {
                      "tagStatus": "tagged",
                      "tagPrefixList": ["v-","release-","v."],
                      "countType": "imageCountMoreThan",
                      "countNumber": 40
                  },
                  "action": {
                      "type": "expire"
                  }
                }
        ]
    }
    # etc . . .
```
> 

## Outputs 
```hpl
#ecr
output "arn" {
  value       = module.create_ecr.arn 
}
output "id" {
  value       = module.create_ecr.id 
}
output "registry_id" {
  value       = module.create_ecr.registry_id 
}
output "repository_url" {
  value       = module.create_ecr.repository_url 
}
#policy
output "policy_registry_id" {
  value       = module.create_ecr.policy_registry_id 
}
output "policy_id" {
  value       = module.create_ecr.policy_id 
}
```
> adjust the naming of the module called above. example `create_ecr`



### Reference 
- [ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html) - AWS ECR policy
- [TERRAFORM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) - Terraform ecr_repository
- [TERRAFORM_MODULE](https://www.terraform.io/docs/language/modules/sources.html) - Terraform call module