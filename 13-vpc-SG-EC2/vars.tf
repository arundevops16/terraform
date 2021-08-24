variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "us-east-1"
}
variable "AMIS" {
	type = map(string)
	default = {
		us-east-1 = "ami-0747bdcabd34c712a"
		eu-west-1 = "ami-0943382e114f188e8"
		ap-southeast-1 = "ami-055147723b7bca09a"
		ap-south-1 = "ami-04bde106886a53080"
	}
}

# variable "instance_count" {
# 	default = "3"
# }
variable "PUBLIC_KEY_PATH" {
	default = "arun.pub"
}

variable "PRIVATE_KEY_PATH" {
	default = "arun"
}

variable "INSTANCE_USERNAME" {
	default = "ubuntu" 
}

variable "Instance-Name" {
	default = "kundrupu"
}


