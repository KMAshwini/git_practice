resource "aws_instance" "dev" {
    ami = var.ami.id
    instance_type = var.instance.id
    key_name = var.key_name
    subnet_id = aws_subnet.dev_pub.id
    tags = {
      Name= "dev_ec2"
      
    }
  
}