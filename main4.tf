#  Terraform project example that creates a single instance in AWS EC2, along with a security group that allows incoming traffic on port 22
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "example" {
  name = "example-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}

resource "aws_security_group_rule" "example" {
  security_group_id = aws_security_group.example.id
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}
# In this example, the Terraform code creates an EC2 instance and a security group that allows incoming SSH traffic on port 22 from any IP address. The aws_instance resource is used to create the EC2 instance, while the aws_security_group and aws_security_group_rule resources are used to create the security group and its rules, respectively. The output block at the end of the code outputs the public IP address of the EC2 instance so that it's easily accessible after Terraform has finished running.

# To use this code, you'll need to replace the ami value with the ID of an Amazon Machine Image (AMI) that's available in your region, as well as set the desired instance_type for your EC2 instance.

# After writing the Terraform code, you can follow the steps outlined in my previous responses to initialize, plan, and apply the changes to your infrastructure.