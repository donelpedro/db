provider "google" {
  credentials = file("<CREDENTIALS_FILE>.json")
  project     = "<PROJECT_ID>"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  tags = ["web", "dev"]
}

