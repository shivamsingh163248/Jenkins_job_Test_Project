provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_vm" {
  ami           = "ami-0c2b8ca1dad447f8a"  # Amazon Linux 2 or Ubuntu AMI ID
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"
  tags = {
    Name = "Jenkins-Server"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }
}
