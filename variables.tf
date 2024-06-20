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
variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "internal" {
  description = "Boolean to determine if the ALB is internal or external"
  type        = bool
}

variable "security_groups" {
  description = "The security groups associated with the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "The subnets associated with the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Boolean to enable deletion protection on the ALB"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "The protocol for the target group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the target group is located"
  type        = string
}

variable "health_check_interval" {
  description = "The interval for health checks"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The path for health checks"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "The port for health checks"
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "The protocol for health checks"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The timeout for health checks"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "The number of successful health checks required before considering an instance healthy"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "The number of failed health checks required before considering an instance unhealthy"
  type        = number
  default     = 3
}

variable "listener_port" {
  description = "The port for the listener"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "The protocol for the listener"
  type        = string
  default     = "HTTP"
}




