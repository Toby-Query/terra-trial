# output "ec2_public_ip" {
#   value = aws_instance.fastapi_ec2.public_ip
#   description = "Public IP of the FastAPI EC2 instance"
# }

# output "rds_endpoint" {
#   value = aws_db_instance.postgres.endpoint
#   description = "PostgreSQL RDS endpoint"
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.pyinstaller_bucket.bucket
#   description = "S3 bucket storing PyInstaller executables"
# }

# output "fastapi_url" {
#   value = "http://${aws_instance.fastapi_ec2.public_ip}"
#   description = "The base URL for the deployed FastAPI app"
# }
