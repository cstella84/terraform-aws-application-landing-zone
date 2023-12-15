# Create an IAM role for EC2 instances to assume
resource "aws_iam_role" "example" {
    name = "example_role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Effect = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                },
            },
        ],
    })
}