data "aws_caller_identity" "current" {}

resource "aws_codebuild_project" "codebuild" {
  name          = "${var.identifier}-build"
  source_version = var.repo-branch
  description   = "CodeBuild for frontend s3 cloudfront serving"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.account_id
    }
    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.aws_region
    }
  }
  
  source {
    type            = "GITHUB"
    location        = var.repo
    git_clone_depth = 1

  git_submodules_config {
    fetch_submodules = true
  }

  buildspec = var.buildspec

  }
}
