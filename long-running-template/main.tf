#**********************************************************************
#                        Docker provider
#**********************************************************************
provider "docker" {
  host = "${var.docker_host}" 
}

resource "random_string" "long_running" {    
    
	length  = 10
	special = false
	lower   = false
	
    provisioner "local-exec" {
      command = "ping 127.0.0.1 -n ${var.ping_time}"
    }
}

variable "ping_time" {
}

variable "docker_host" {
  default = "http://vvnappsrv04:4243"
}

