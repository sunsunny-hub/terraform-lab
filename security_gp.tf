resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Web Security Group for SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
resource "aws_security_group" "dynamicblock" {
 name = "allow_tls"
 #  description = "Allow TLS inbound traffic"
 #  vpc_id      = aws_vpc.main.id

 dynamic "ingress" {
   for_each = var.ports
   content {
     description = "TLS from VPC"
     from_port   = ingress.value
     to_port     = ingress.value
     protocol    = "tcp"
     cidr_blocks = var.cidr_block
   }
 }
}


 ingress {
   description = "TLS from VPC"
   from_port   = 443
   to_port     = 443
   protocol    = "tcp"
   cidr_blocks = var.cidr_block
 }

 ingress {
   description = "TLS from VPC"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = var.cidr_block
 }

 ingress {
   description = "TLS from VPC"
   from_port   = 53
   to_port     = 53
   protocol    = "tcp"
   cidr_blocks = var.cidr_block
 }

}
*/