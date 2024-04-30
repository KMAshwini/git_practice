variable "ami" {
    description = "passing AMI value to main.tf"
    type = string
    default = ""
}
variable "aws_instance" {
    description = "passing instance to main.tf"
    type = string
    default = ""
}
variable "key_name" {
    description = "passing keyName to main.tf"
    type = string
    default = ""
}