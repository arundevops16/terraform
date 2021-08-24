resource "aws_elb" "arun-elb" {
  name               = "arun-elb"
#   availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
#   subnets         = [aws_subnet.arun-dev-pub-sub-1.id, aws_subnet.arun-dev-pub-sub-2.id, aws_subnet.arun-dev-pub-sub-2.id]
   subnets         = [aws_subnet.arun-dev-pub-sub-1.id]

  security_groups = [aws_security_group.arun-dev-elb.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.apigateway.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "arun-elb"
  }
}