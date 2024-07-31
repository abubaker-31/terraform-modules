output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_origin_access_identity" {
  description = "The CloudFront origin access identity"
  value       = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
}
