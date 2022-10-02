/*
variable "cidr_block" {
  default = ["128.30.50.90/32"]
}

variable "instancetype" {
  #default = "t2.micro"
  #type = list()
  default = ["t2.large", "t2.medium", "t2.nano"]
}

variable "iam_user" {
  type = list(any)
}

variable "types" {
  default = {
    us-east-1 = "t2.micro"
    us-west-1 = "t2.nano"
  }
}

variable "server" {
  default = false
}

variable "os" {
  type = string
}

variable "ami" {
  type = map(any)
  default = {
    linux   = "ami-0464d49b8794eba32"
    windows = "ami-0f1ee03d06c4c659c"
  }
}

variable "ports" {
  default = ["443","80","8080","8081","22"]
}
*/