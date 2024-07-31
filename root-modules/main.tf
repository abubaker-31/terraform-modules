module "cloudfront_s3" {
  source = "./modules/cloudfront_s3"

  bucket_name                   = "your-s3-bucket-name"
  oai_comment                   = "Custom OAI comment"
  cf_comment                    = "Custom CloudFront Distribution comment"
  default_root_object           = "index.html"
  allowed_methods               = ["GET", "HEAD"]
  cached_methods                = ["GET", "HEAD"]
  viewer_protocol_policy        = "redirect-to-https"
  min_ttl                       = 0
  default_ttl                   = 3600
  max_ttl                       = 86400
  price_class                   = "PriceClass_100"
  restriction_type              = "none"
  cloudfront_default_certificate = true
  acm_certificate_arn           = "your-acm-certificate-arn"
  cache_policy_name             = "optimized-for-s3"
  cache_policy_comment          = "Cache policy optimized for S3"
  cache_default_ttl             = 50
  cache_max_ttl                 = 100
  headers_behavior              = "none"
  cookie_behavior               = "none"
  query_string_behavior         = "none"
}
