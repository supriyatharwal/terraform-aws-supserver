variable "image" {
  default = "ami-0603cbe34fd08cb81"
}

variable "hw" {
  default = "t2.micro"
}

variable "name" {
  default = "supriya-server-from-module"
}

variable "bucket-name" {
  default = "supriya-default-bucket-must-change"
}

resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw

  tags = {
    Name = var.name
    Env = lower("Dev")
  }
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket-name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}
