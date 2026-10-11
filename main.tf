resource "google_compute_snapshot_iam_binding" "compute_snapshot_iam_bindings" {
  for_each = var.compute_snapshot_iam_bindings

  members = each.value.members
  name    = each.value.name
  role    = each.value.role
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

