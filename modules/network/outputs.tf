output "vpc_id" {
  value = aws_vpc.learning.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}