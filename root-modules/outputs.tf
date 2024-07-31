output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cloudfront_s3.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.cloudfront_s3.cloudfront_domain_name
}

output "cloudfront_origin_access_identity" {
  description = "The CloudFront origin access identity"
  value       = module.cloudfront_s3.cloudfront_origin_access_identity
}
