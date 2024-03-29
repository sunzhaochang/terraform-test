provider "alicloud" {}

resource "alicloud_vpc" "default" {
  name       = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "clouder"
    workspaces {
      name = "terraform-test"
    }
  }
}

data "terraform_remote_state" "default" {
  backend = "remote"

  config = {
    organization = "clouder"

    workspaces = {
      name = "test-vpc"
    }
  }
}

