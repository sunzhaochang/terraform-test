output "vpc_id" {
  value = "${alicloud_vpc.default.id}"
}

output "backend" {
  value = data.terraform_remote_state.default.outputs.vpc_id
}