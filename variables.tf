variable "instance_name" {
  description = "The Name tag for the EC2 instance"
  type        = string
  default     = "demo-server"
}

variable "instance_type" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
