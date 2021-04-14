######
# ecr modular 
# Hestu Widyo Hutomo 
######
module "ecr" {
    source          = "./modules/ecr"
    state_ecr       = var.state_ecr && length(var.ecr) > 0 ? true : false
    ecr             = var.ecr
    tags            = var.tags
}
module "policy" {
    source          = "./modules/policy"
    state_policy    = length(var.image_policy) > 0 ? true : false
    image_policy    = var.image_policy
    tags            = var.tags
}