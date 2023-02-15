#  Terraform project example that creates a basic infrastructure in AWS consisting of an S3 bucket and a DynamoDB table
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket"
}

resource "aws_dynamodb_table" "example" {
  name = "example-table"

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"

  provisioned_throughput {
    read_capacity  = 5
    write_capacity = 5
  }
}
# In this example, the Terraform code creates an S3 bucket and a DynamoDB table in AWS. The `aws_s3_bucket` resource creates the S3 bucket, while the `aws_dynamodb_table` resource creates the DynamoDB table. The table has a single attribute `id` of type `S`, which is used as the hash key for the table. The `provisioned_throughput` block sets the read and write capacities for the table.

# Once you've written your Terraform code, you can follow the steps outlined in my previous responses to initialize, plan, and apply the changes to your infrastructure.