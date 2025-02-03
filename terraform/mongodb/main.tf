resource "aws_instance" "mongodb" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  
  user_data = file("${path.module}/setup.sh")

  vpc_security_group_ids = [aws_security_group.mongodb_sg.id]

  tags = {
    Name = "MongoDB Server"
  }
}
