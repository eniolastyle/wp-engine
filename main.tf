data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["099720109477"] # Canonical

}

module "wp_engine" {
  source        = "./modules/wp_engine"
  ami           = data.aws_ami.ubuntu.id
  db            = var.db
  user          = var.user
  pass          = var.pass
  region        = var.region
  key_name      = var.key_name
  instance_type = var.instance_type
  theme         = var.theme
}
