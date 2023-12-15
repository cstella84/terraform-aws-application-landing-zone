# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
    bucket = "my-terraform-landing-zone-bucket-siuoedb7xk9c"

    tags = {
        Name = "${var.app_name}-landing-zone-bucket"
    }
}

# Set ownership controls for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "example" {
    bucket = aws_s3_bucket.example_bucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

# Set Access Control List (ACL) for the S3 bucket
resource "aws_s3_bucket_acl" "example" {
    depends_on = [aws_s3_bucket_ownership_controls.example]

    bucket = aws_s3_bucket.example_bucket.id
    acl    = "private"
}