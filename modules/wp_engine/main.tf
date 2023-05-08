data "template_file" "wp-app-file" {
  template = file("./modules/wp_engine/wp-config.tpl")
  vars = {
    db   = var.db
    user = var.user
    pass = var.pass
    theme = var.theme
  }
}

resource "aws_instance" "wp-app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.wp-sg.id]
  user_data              = data.template_file.wp-app-file.rendered

  tags = {
    Name : "wp-engine"
  }
}

resource "aws_security_group" "wp-sg" {
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]

  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "allow ssh"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow http"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
  }]
}

output "public_ip" {
  value = aws_instance.wp-app.public_ip
}

