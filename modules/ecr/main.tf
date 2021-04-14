
resource "aws_ecr_repository" "ecr_this" {
    for_each = var.state_ecr ? var.ecr : tomap({})

    name                 = each.key
    image_tag_mutability = lookup(each.value, "image_tag_mutability", "MUTABLE") == "IMMUTABLE" ? "IMMUTABLE" : "MUTABLE"

    image_scanning_configuration {
        scan_on_push = lookup(each.value, "scan_on_push", true)
    }

    dynamic "encryption_configuration" {
        for_each = try(tolist(lookup(each.value, "encryption_type", [])), [lookup(each.value, "encryption_type", {})])
        content {
            encryption_type = encryption_configuration.value.encryption_type
            kms_key         = encryption_configuration.value.kms_key
        }
    }

    tags = merge(
        lookup(each.value, "tags", {}),
        var.tags
    )
}