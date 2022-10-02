resource "aws_instance" "lab" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  key_name = aws_key_pair.kp.key_name

  tags = {
    Name = "Terraform Lab"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("mykey.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd"
    ]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_instance.lab.primary_network_interface_id
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "Terraform_Lab_Key"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
       echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem
       chmod 400 ./myKey.pem
    EOT
  }
}

output "private_key" {
  value     = tls_private_key.pk.private_key_pem
  sensitive = true
}

/*
resource "aws_instance" "vm" {
  ami           = lookup(var.ami, var.os)
  instance_type = "t2.micro"
  count         = 2
  tags = {
    name = var.os
  }
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}
*/




/*
resource "aws_instance" "lab" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  count = 3
}

resource "aws_instance" "Production" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  count = var.server == true ? 1 : 0
}

resource "aws_instance" "Devlopment" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  count = var.server == false ? 1 : 0
}
*/
/*
resource "aws_instance" "lab" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Lab"
  }
}
*/

/*
resource "aws_eip" "eip" {
  #instance = aws_instance.lab
  vpc      = true
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.lab.id
  allocation_id = aws_eip.eip.id
}

output "publicip" {
  value = aws_instance.lab.public_ip
}




resource "aws_s3_bucket" "test" {
  bucket = "terraform-lab-bucket-suraj"

  tags = {
    Name        = "Terraform_Lab"
    Environment = "Dev"
  }
}
*/


