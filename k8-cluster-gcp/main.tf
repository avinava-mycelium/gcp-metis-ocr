resource "google_container_cluster" "primary" {
  name               = var.name
  location           = var.location
  project            = var.project
  description        = var.description
  network            = var.network
  subnetwork         = var.subnetwork
  
  ip_allocation_policy {
    
  }
  enable_autopilot = true
  node_config {
    service_account = local.service_account
    oauth_scopes = [
      var.oauth_scopes
    ]
    labels = {
      type = var.type
    }
    
    tags = ["chainlink", "ocr"]
  }
  timeouts {
    create = var.create
    update = var.update
  }
}