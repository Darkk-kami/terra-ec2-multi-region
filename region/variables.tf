variable "region" {
}

variable "vpc_name" {
  type    = string
  default = "ec2_multi_region"
}

variable "cidr_block" {
  description = "CIDR Block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnets"
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}

variable "public_subnets" {
  description = "Public Subnets"
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {
    Name = "Ec2_multi_region"
  }
}

variable "map_public_ip" {
  description = "Mapping Public Ip on Launch"
  type        = bool
  default     = true
}


# EC2 Instance Configurations
variable "instance_type" {
  description = "Instance Type"
  type = string
  default = "t2.micro"
}

variable "egress" {
  description = "egress rules to set on the default security group"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
    ipv6_cidr_blocks = optional(list(string), [])
    prefix_list_ids  = optional(list(string), [])
    description      = optional(string, null)
    security_groups  = optional(list(string), [])
    self             = optional(bool, false)
  }))

  default = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow Outbound Traffic"
    }
  ]
}

variable "ingress" {
  description = "ingress rules to set on default security group"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
    ipv6_cidr_blocks = optional(list(string), [])
    prefix_list_ids  = optional(list(string), [])
    description      = optional(string, null)
    security_groups  = optional(list(string), [])
    self             = optional(bool, false)
  }))

  default = [
    {
      from_port = 22
      to_port   = 80
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      decription = "Allow Http Traffic"
    }
  ]
}