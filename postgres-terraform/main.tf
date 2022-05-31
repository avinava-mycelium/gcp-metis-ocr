
resource "google_sql_database_instance" "master" {
  name             = var.name
  database_version = var.database_version
  region           = var.region
  deletion_protection = var.deletion_protection
  project = var.project

  
  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = var.tier
    availability_type = var.availability_type
    backup_configuration {
      enabled = var.backup_configuration_enabled
      point_in_time_recovery_enabled = var.backup_configuration_recovery
    }
     ip_configuration {
                ipv4_enabled = var.ipv4_enabled
                require_ssl  = var.require_ssl

                authorized_networks {
                    name  = var.auth_nw_name
                    value = var.auth_nw_value
                }
            }
  }
}
resource "google_sql_database" "database" {
  name    = local.db-name
  project = var.project
  instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "users" {
  name      = local.sql_user_name
  project   = var.project
  instance  = google_sql_database_instance.master.name
  host      = local.sql_user_host
  password  = local.sql_user_password
}