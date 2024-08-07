resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for static-hosting-bucket"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = "S3-static-hosting-bucket-origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront Distribution for S3 bucket"
  default_root_object = "index.html"

  #aliases = [var.cname]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"] #["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-static-hosting-bucket-origin"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    # Reference to the cache policy
    cache_policy_id = aws_cloudfront_cache_policy.cache.id
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    #acm_certificate_arn = var.acm_certificate_arn # Replace with your ACM certificate ARN
  }

depends_on = [aws_s3_bucket.bucket]
}
###############################################################################################################################################################################################################################################
resource "aws_cloudfront_cache_policy" "cache" {
  name        = "optimized-for-s3"
  comment     = "Cache policy optimized for S3"
  default_ttl = 50
  max_ttl     = 100

  parameters_in_cache_key_and_forwarded_to_origin {
    headers_config {
      header_behavior = "none"
    }

    cookies_config {
      cookie_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}
