variable "ami" {
  type = string
  description = "value for a ami"
}

variable "instance_type" {
  type = string
  description = "value for a instance_type"
}

variable "login_user" {
  type = string
  description = "value for a ssh login user"
}

variable "public_key" {
  type = string
  description = "value for a ssh public_key"
}

variable "private_key" {
  type = string
  description = "value for a ssh private_key"
}

variable "content_source" {
  type = string
  description = "value for a source path"
}

variable "content_destination" {
  type = string
  description = "value for a destination path"
}