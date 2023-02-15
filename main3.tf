# Terraform project example that creates a Google Cloud Platform (GCP) project, a Virtual Private Cloud (VPC) network, and a firewall rule
provider "google" {
  version = "3.35.0"
  project = "my-gcp-project"
  region  = "us-central1"
}

resource "google_project" "example" {
  name = "my-gcp-project"
}

resource "google_compute_network" "example" {
  name = "my-vpc-network"
}

resource "google_compute_firewall" "example" {
  name = "allow-ssh"
  network = google_compute_network.example.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
# In this example, the Terraform code creates a GCP project, a VPC network, and a firewall rule that allows incoming SSH traffic on port 22 from any source IP. The google provider is used to interact with the Google Cloud Platform APIs, and the google_project, google_compute_network, and google_compute_firewall resources are used to create the project, network, and firewall rule, respectively.

# Once you've written your Terraform code, you can run the terraform init command to initialize Terraform, followed by the terraform plan command to see what changes Terraform will make to your infrastructure. Finally, run the terraform apply command to apply the changes.