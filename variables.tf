variable "region" {
  description = "The AWS region to deploy the ASG"
  type        = string
  default     =  "eu-central-1"    
}

variable "subnets" {
  description = "A list of subnet IDs for the ASG"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
 default      = "ami-00cf59bc9978eb266"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "The desired number of instances"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "The minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances"
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}