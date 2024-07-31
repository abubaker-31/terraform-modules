resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  # Other S3 bucket configurations as needed
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.oai_comment
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.cf_comment
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = var.origin_id
    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
    cache_policy_id        = aws_cloudfront_cache_policy.cache.id
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
    acm_certificate_arn            = var.acm_certificate_arn
  }

  depends_on = [aws_s3_bucket.bucket]
}

resource "aws_cloudfront_cache_policy" "cache" {
  name        = var.cache_policy_name
  comment     = var.cache_policy_comment
  default_ttl = var.cache_default_ttl
  max_ttl     = var.cache_max_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    headers_config {
      header_behavior = var.headers_behavior
    }

    cookies_config {
      cookie_behavior = var.cookie_behavior
    }

    query_strings_config {
      query_string_behavior = var.query_string_behavior
    }
  }
}
