resource "aws_ecr_lifecycle_policy" "ecr_policy_this" {
    for_each        = var.state_policy ? var.image_policy : tomap({})
    repository      = each.key
    policy = jsonencode({ "rules" : try(tolist(lookup(each.value, "policy", [])), [lookup(each.value, "policy", {})]) })
}