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

provider "azurerm" {
	version = "=1.20.0"
	subscription_id = "${var.subscription_id}"
	client_id       = "${var.client_id}"
	client_secret   = "${var.client_secret}"
	tenant_id       = "${var.tenant_id}"
}

provider "docker" {
  host = "${var.docker_host}"
}