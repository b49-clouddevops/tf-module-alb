# Creates Listener ; Rules will be created and added by the components from the tf code in that respective componenet 
 resource "aws_lb_listener" "private" {
  count             = var.INTERNAL ? 1 : 0 
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Okkk"
      status_code  = "200"
    }
  }
}


