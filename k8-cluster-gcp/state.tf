terraform {
  backend "gcs" {
    bucket  = "backend-bucket-sdl"
    prefix  = "metis/metis-ocr-cluster.tfstate"
  }
}