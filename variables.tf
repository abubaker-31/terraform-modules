variable "identifier" {
  description = "Identifier needs to be added in all resources"
  default     = "usama-test"
}

variable "aws_region" {
  description = "The AWS region where infrastructure will be deployed"
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "Name for the S3 bucket"
  default = "ayatunes-dashboard-frontend"
}

variable "cname" {
  description = "The CNAME for the CloudFront distribution"
  type        = string
  default     = "www.yourdomain.com" # replace with your default CNAME
}

variable "repo" {
  description = "URL of repo"
  type        = string
  default     = "https://github.com/pwr-dev/ayatunes-dashboard-frontend.git"
}

variable "buildspec" {
  description = "name of buildspec file"
  type        = string
  default     = "CI-CD/buildspec.yml"
}

variable "repo-branch" {
  description = "name of repo branch"
  type        = string
  default     = "stage"
}
