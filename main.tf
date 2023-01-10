resource "google_firebase_project_service_account_key" "new_key" {
  service_account_id = var.firebase_service_account_id
  key_algorithm      = "KEY_ALG_RSA_2048"
}

resource "google_firebase_project_service_account_key" "rotate_key" {
  service_account_id = var.firebase_service_account_id
  key_algorithm      = "KEY_ALG_RSA_2048"
  name               = "projects/${var.project_id}/serviceAccounts/${var.firebase_service_account_id}/keys/${var.old_key_name}"
  depends_on         = [google_firebase_project_service_account_key.new_key]

  lifecycle {
    create_before_destroy = true
  }
}