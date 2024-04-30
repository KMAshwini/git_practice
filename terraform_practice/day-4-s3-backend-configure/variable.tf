variable "ami" {
    description = "passing AMI value to main.tf"
    type = string
    default = "ami-019f9b3318b7155c5"
}
variable "aws_instance" {
    description = "passing instance to main.tf"
    type = string
    default = "t2.micro"
}
variable "key_name" {
    description = "passing keyName to main.tf"
    type = string
    default = "awsdev"
}