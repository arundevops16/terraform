resource "aws_key_pair" "arun" {
	key_name = "arun"
	public_key = file(var.PUBLIC_KEY_PATH)
}

resource "aws_instance" "webapp01" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.medium"
	subnet_id = aws_subnet.arun-dev-pub-sub-1.id
	vpc_security_group_ids = [aws_security_group.arun-dev-ssh.id]
	key_name = aws_key_pair.arun.key_name
	# count = var.instance_count

	provisioner "local-exec" {
		command = "echo ${aws_instance.webapp01.public_ip} >> /tmp/publicIp.txt"
	}

	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh"
		]
	}

	connection {
		user = var.INSTANCE_USERNAME
		private_key = file(var.PRIVATE_KEY_PATH)
		host = self.public_ip
		type = "ssh"
	}
	tags = {
		Name = "webapp01"
  }
}
output "public_IP1" {
	value = "${aws_instance.webapp01.public_ip}"
}

output "private_IP1" {
	value = "${aws_instance.webapp01.private_ip}"
}

resource "aws_instance" "webapp02" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.medium"
	subnet_id = aws_subnet.arun-dev-pub-sub-2.id
	vpc_security_group_ids = [aws_security_group.arun-dev-ssh.id]
	key_name = aws_key_pair.arun.key_name
	# count = var.instance_count

	provisioner "local-exec" {
		command = "echo ${aws_instance.webapp02.public_ip} >> /tmp/publicIp.txt"
	}

	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh"
		]
	}

	connection {
		user = var.INSTANCE_USERNAME
		private_key = file(var.PRIVATE_KEY_PATH)
		host = self.public_ip
		type = "ssh"
	}
	tags = {
		Name = "webapp02"
  }
}

output "public_IP2" {
	value = "${aws_instance.webapp02.public_ip}"
}

output "private_IP2" {
	value = "${aws_instance.webapp02.private_ip}"

}
resource "aws_instance" "apigateway" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.medium"
	subnet_id = aws_subnet.arun-dev-pub-sub-2.id
	vpc_security_group_ids = [aws_security_group.arun-dev-ssh.id]
	key_name = aws_key_pair.arun.key_name
	# count = var.instance_count

	provisioner "local-exec" {
		command = "echo ${aws_instance.apigateway.public_ip} >> /tmp/publicIp.txt"
	}

	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh"
		]
	}

	connection {
		user = var.INSTANCE_USERNAME
		private_key = file(var.PRIVATE_KEY_PATH)
		host = self.public_ip
		type = "ssh"
	}
	tags = {
		Name = "apigateway"
  }
}

output "public_IP3" {
	value = "${aws_instance.apigateway.public_ip}"
}

output "private_IP3" {
	value = "${aws_instance.apigateway.private_ip}"
}