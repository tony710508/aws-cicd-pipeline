resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-tony"

  tags = {
    Name        = "CodePipeline Artifacts Bucket"
    Environment = "Development"
  }
}

resource "aws_s3_bucket_versioning" "versioning_codepipeline_artifacts" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "codepipeline_artifacts" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}