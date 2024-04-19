variable "name_prefix" {
  description = "Prefix for the name of the resources"
  default = "myapp"
}

variable "env" {
  description = "Environment for the resources"
  default = "prd"
}

variable "container_port" {
  description = "Container port"
  default = 80
}