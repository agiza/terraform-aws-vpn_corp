/**
 * tf_vpn_corp Terraform Module
 * =====================
 *
 * Setup VPN connection to Corporate
 *
 * Usage:
 * ------
 *
 *     module "tf_vpn_corp" {
 *       source       = "../tf_vpn_corp"
 *       name         = ""
 *       environment  = "dev"
 *       vpc_id       = ""
 *       dest_cidrs   = ""
 *     }
**/

# TODO: remove code fom tf_gateway, elsewhere

# TODO: create gateway per AZ
resource "aws_vpn_gateway" "vpn_gw_corp" {
  vpc_id = "${var.vpc_id}"
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name        = "${var.environment}-vpn-gw-corp"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}

/*
resource "aws_customer_gateway" "cgw_corp" {
  bgp_asn     = "12345"
  ip_address  = "x.x.x.x"
  type        = "ipsec.1"
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name        = "${var.environment}-cgw-corp"
    Environment = "${var.environment}"
  }
}
*/
resource "aws_vpn_connection" "vpn_corp" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw_corp.id}"
  #customer_gateway_id = "${aws_customer_gateway.cgw_corp.id}"
  customer_gateway_id = "${var.corp_customer_gateway_id}"
  type                = "ipsec.1"
  static_routes_only  = true
  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
  }
  tags = "${ merge(
    var.tags,
    map("Name", var.namespaced ?
     format("%s-%s-vpn", var.environment, var.name) :
     format("%s-vpn", var.name) ),
    map("Environment", var.environment),
    map("Terraform", "true") )}"
}

resource "aws_vpn_connection_route" "vpn_route_corp" {
  count                   = "${length(var.dest_cidrs)}"
  destination_cidr_block  = "${element(var.dest_cidrs, count.index)}"
  vpn_connection_id       = "${aws_vpn_connection.vpn_corp.id}"
}
