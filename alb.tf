resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = "application"
  # subnets            = If you're running the Public Module, LB should be attached under the public subnets. If it's running against private, then this has to be attached
  #                      to private subnets.
  subnets            = var.INTERNAL ? data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS : data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNET_ID
  security_groups    = var.INTERNAL ? [aws_security_group.alb_private.*.id] : [aws_security_group.alb_public.*.id] 

  enable_deletion_protection = true



  tags = {
    Environment = "production"
  }
}

# var.INTERNAL is a booleane ": true or false"

# using the conditions
# Ref: https://www.terraform.io/language/expressions/conditionals