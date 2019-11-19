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

resource "aws_instance" "demo_instance" {
  ami                    = "${var.aws_ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${var.aws_security_group_id}"]  
}