output "public" {
  value = aws_instance.localname.public_ip
}

output "private" {
  value = aws_instance.localname.private_ip
}