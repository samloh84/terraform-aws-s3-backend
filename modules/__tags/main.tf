locals {
  name = coalesce(var.resource_full_name,join(var.delimiter, [
    var.project,
    var.resource_type,
    var.resource_name]))
  tags = merge({for   k, v in {
    Name = local.name
    Owner = var.owner
    Project = var.project
  }  : k=>v if v != null && v  !=  ""},
  var.custom_tags
  )
}