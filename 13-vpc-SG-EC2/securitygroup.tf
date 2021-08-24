resource "aws_security_group" "arun-dev-ssh" {
    vpc_id = "${aws_vpc.arun-dev.id}"
    name = "arun-dev-ssh"
    description = "allow ssh access from local"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow all outbound traffic"
      from_port = 0
      protocol = "-1"
      self = false
      to_port = 0
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow ssh access from local"
        from_port = 22
        to_port = 22
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = ["94.59.83.96/32", "0.0.0.0/0"]
        description = "allow http access from local"
        from_port = 80
        to_port = 80
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0"]
        description = "allow all inbound traffic"
        from_port = 0
        protocol = "-1"
        to_port = 0
        self = false
    }
    tags = {
      "Name" = "arun-dev-ssh"
    }
}


resource "aws_security_group" "arun-dev-elb" {
    vpc_id = "${aws_vpc.arun-dev.id}"
    name = "arun-dev-elb"
    description = "allow ssh access from local"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow all outbound traffic"
      from_port = 0
      protocol = "-1"
      self = false
      to_port = 0
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow ssh access from local"
        from_port = 22
        to_port = 22
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = ["94.59.83.96/32", "0.0.0.0/0"]
        description = "allow http access from local"
        from_port = 80
        to_port = 80
        self = false
        protocol = "tcp"
    }
    tags = {
      "Name" = "arun-dev-ssh"
    }
}

