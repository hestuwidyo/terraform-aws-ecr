module "create_ecr" {
    source = ""

    ecr = {
        ecr_name_1 ={
            image_tag_mutability            = "IMMUTABLE"               
            scan_on_push                    = false                     
            encryption_type                 = {
                encryption_type             = "KMS"
                kms_key                     = "KmsKeys"
            }
        }
        ecr_name_2 = {
            
        }
    }

    image_policy    = {
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
    }
}