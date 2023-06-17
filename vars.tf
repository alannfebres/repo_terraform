# Creating a Variable for ami of type map


variable "ec2_ami" {
  type = map(any)

  default = {
    us-west-1 = "ami-0f8e81a3da6e2510a"
  }
}

# Creating a Variable for region

variable "region" {
  default = "us-west-1"
}


# Creating a Variable for instance_type
variable "instance_type" {
  type = string
}