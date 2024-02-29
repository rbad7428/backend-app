resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "aae6941f-1d45-47c5-b556-74382d3c40ad"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "59e50d72-01e2-477f-9d63-e9728e4904ee"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "05428ab5-43c2-4aa2-96c5-b3b0c5f0af7b"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "7138ef1b-c13a-42bc-9a83-2a5a9ffab4dc"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "1c24ceab-e448-4410-9258-f8cfbf616772"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "4f0739f4-f657-4595-8855-8a41d1c62948"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "616ef308-c88b-4449-ad2e-7b4414ff9e90"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "244ef3d5-e173-448c-984d-1e96f6785df2"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "3bdadd06-4ea5-4027-9da9-1e4574464404"
  }
}