variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "oai_comment" {
  description = "Comment for the Origin Access Identity"
  type        = string
  default     = "OAI for static-hosting-bucket"
}

variable "origin_id" {
  description = "Origin ID for CloudFront"
  type        = string
  default     = "S3-static-hosting-bucket-origin"
}

variable "cf_comment" {
  description = "Comment for the CloudFront Distribution"
  type        = string
  default     = "CloudFront Distribution for S3 bucket"
}

variable "default_root_object" {
  description = "The default root object for the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "allowed_methods" {
  description = "Allowed methods for the default cache behavior"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "Cached methods for the default cache behavior"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  description = "Viewer protocol policy for the default cache behavior"
  type        = string
  default     = "redirect-to-https"
}

variable "min_ttl" {
  description = "Minimum TTL for the default cache behavior"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default TTL for the default cache behavior"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum TTL for the default cache behavior"
  type        = number
  default     = 86400
}

variable "price_class" {
  description = "Price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "restriction_type" {
  description = "Geo restriction type for the CloudFront distribution"
  type        = string
  default     = "none"
}

variable "cloudfront_default_certificate" {
  description = "Whether to use the default CloudFront certificate"
  type        = bool
  default     = true
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for the CloudFront distribution (if using a custom certificate)"
  type        = string
  default     = ""
}

variable "cache_policy_name" {
  description = "Name for the CloudFront cache policy"
  type        = string
  default     = "optimized-for-s3"
}

variable "cache_policy_comment" {
  description = "Comment for the CloudFront cache policy"
  type        = string
  default     = "Cache policy optimized for S3"
}

variable "cache_default_ttl" {
  description = "Default TTL for the CloudFront cache policy"
  type        = number
  default     = 50
}

variable "cache_max_ttl" {
  description = "Maximum TTL for the CloudFront cache policy"
  type        = number
  default     = 100
}

variable "headers_behavior" {
  description = "Header behavior for the CloudFront cache policy"
  type        = string
  default     = "none"
}

variable "cookie_behavior" {
  description = "Cookie behavior for the CloudFront cache policy"
  type        = string
  default     = "none"
}

variable "query_string_behavior" {
  description = "Query string behavior for the CloudFront cache policy"
  type        = string
  default     = "none"
}
