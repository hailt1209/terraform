#**********************************************************************
#                        AWS provider
#**********************************************************************

provider "aws" {
	region     = "ap-southeast-1"
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "demo_instance" {
  ami                    = "${var.aws_ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${var.aws_security_group_id}"]  
}

resource "random_string" "random_name" {
	length  = 5
	special = false
	lower   = false
}


#**********************************************************************
#                        Google Cloud provider
#**********************************************************************
provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project}"
  region      = "${var.region}"
}


#**********************************************************************
#                        VMware provider
#**********************************************************************
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  
  # If you have a self-signed cert
  allow_unverified_ssl = true
}


#**********************************************************************
#                        Docker provider
#**********************************************************************
provider "docker" {
  host = "${var.docker_host}"
}

resource "docker_image" "demo_docker_image" {
  name = "busybox:latest"
}

resource "docker_container" "demo_docker_container" {
  name  = "${random_string.random_name.result}"
  image = "${docker_image.demo_docker_image.latest}"
  entrypoint = ["/bin/sleep"]
  command = [ "1d" ]
}


#**********************************************************************
#                        JIRA provider
#**********************************************************************
provider "jira" {
  url = "${var.jira_url}"       
  user = "${var.jira_user}"                      
  password = "${var.jira_password}"    
}


#*********************************************************************
#                        CDA provider
#*********************************************************************

provider "cda" {
	cda_server = "${var.cda_server}"
	user       = "${var.cda_user}"
	password   = "${var.cda_password}"
    
    default_attributes = {
		folder = "DEFAULT"
		owner = "${var.owner}"
    }    
}

resource "cda_environment" "cda_env" {
  name  = "env_${random_string.random_name.result}"
  type  = "Generic"
  dynamic_properties = {}
  custom_properties = {}
  deployment_targets = []
  description = "My Environment"
}