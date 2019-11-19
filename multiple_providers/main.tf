provider "aws" {
	region     = "ap-southeast-1"
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
}

provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project}"
  region      = "${var.region}"
}

provider "docker" {
  host = "${var.docker_host}"
}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  
  # If you have a self-signed cert
  allow_unverified_ssl = true
}