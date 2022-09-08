
# Public LoadBalancer SG ; This has to be created only if it's running againt th Public Module
resource "aws_security_group" "alb_public" {
  count       = 0 or 1  ( when you run this for private : 0. if you run public 1) 
  name        = "roboshop-public-alb-${var.ENV}"
  description = "roboshop-public-alb-${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-public-alb-${var.ENV}"
  }
}


# Private LoadBalancer SG; This has to be created only if it's running againt th Public Module
resource "aws_security_group" "alb_private" {
  count       = 0 or 1  ( when you run this for private : 0. if you run public 1) 
  name        = "roboshop-private-alb-${var.ENV}"
  description = "roboshop-private-alb-${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-private-alb-${var.ENV}"
  }
}