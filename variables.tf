/**
 *  Variables for tf_vpn_corp
**/

// Standard Variables

variable "name" {
  description = "Name"
}
variable "environment" {
  description = "Environment (ex: dev, qa, stage, prod)"
}
variable "namespaced" {
  description = "Namespace all resources (prefixed with the environment)?"
  default     = true
}
variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

// Module specific Variables

variable "dest_cidrs" {
  description = "Destination CIDRS for building routes"
  type        = "list"
}
variable "vpc_id" {
  description = "AWS VPC ID"
}
variable "corp_customer_gateway_id" {
  description = "Corporate Customer Gateway ID"
}
