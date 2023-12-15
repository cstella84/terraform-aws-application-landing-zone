output "vpc_id" {
  value = module.aws-simple-lz.vpc_id
}

output "public_subnet_id" {
  value = module.aws-simple-lz.public_subnet_id
}

output "private_subnet_id" {
  value = module.aws-simple-lz.private_subnet_id
}

output "s3_bucket_arn" {
  value = module.aws-simple-lz.s3_bucket_arn
}