resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = "application"

  # subnets            = If you're running the Public Module, LB should be attached under the public subnets. If it's running against private, then this has to be attached
  #                      to private subnets.
  subnets            =  ???

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}