packer {
  required_plugins {
    vagrant = {
      version = ">= 1.0.2"
      source  = "github.com/hashicorp/vagrant"
    }
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_app-instance-type" {
    type = string
}

variable "aws_region" {
    type = string
}

locals {
  timestamp = regex_replace(timestamp(), "[ - TZ:]", "")
  common_tags = {
    OS      = "Ubuntu"
    Release = "latest"
    Type    = "Wa-TEST"
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "wa-packer-aws-eds-${local.timestamp}"
  instance_type = "${var.aws_app-instance-type}"
  region        = "${var.aws_region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners              = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
  tags         = local.common_tags
}

build {
  name = "wa-packer-build"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = ["ENV_NAME=wa-packer-aws-eds-${local.timestamp}"]
    inline = [
      "echo Wellcome to $ENV_NAME",
      "echo Start update and upgrade",
      "sudo apt update -y && sudo apt upgrade -y"
    ]
  }

  provisioner "breakpoint" {
    disable = false
    note    = "Br before run script: ${local.timestamp}"
  }

  provisioner "shell" {
  pause_before = "2s"
  script = "./scripts/docker.sh"
  }
}

