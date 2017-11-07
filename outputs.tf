/**
 *  Outputs for tf_vpn_corp
**/


// Corporate Gateway ID
output "corp_gtwy_id" {
  #value = "${aws_customer_gateway.cgw_corp.id}"
  value = "${aws_vpn_connection.vpn_corp.customer_gateway_id}"
}
/*
// Corporate Gateway BGP ASN
output "corp_gtwy_bgp" {
  value = "${aws_customer_gateway.cgw_corp.bgp_asn}"
}
// Corporate Gateway External Interface IP
output "corp_gtwy_ip" {
  value = "${aws_customer_gateway.cgw_corp.ip_address}"
}
// Corporate Gateway Type
output "corp_gtwy_type" {
  value = "${aws_customer_gateway.cgw_corp.type}"
}
*/

// Corporate VPN ID
output "corp_vpn_id" {
  value = "${aws_vpn_connection.vpn_corp.id}"
}
// Corporate VPN Tunnel 1 public IP
output "corp_vpn_tun1_ip" {
  value = "${aws_vpn_connection.vpn_corp.tunnel1_address}"
}
// Corporate VPN Tunnel 1 preshared key
output "corp_vpn_tun1_key" {
  value = "${aws_vpn_connection.vpn_corp.tunnel1_preshared_key}"
}
// Corporate VPN Tunnel 2 public IP
output "corp_vpn_tun2_ip" {
  value = "${aws_vpn_connection.vpn_corp.tunnel2_address}"
}
// Corporate VPN Tunnel 2 preshared key
output "corp_vpn_tun2_key" {
  value = "${aws_vpn_connection.vpn_corp.tunnel2_preshared_key}"
}
// Corporate VPN connection type
output "corp_vpn_type" {
  value = "${aws_vpn_connection.vpn_corp.type}"
}

//aws_vpn_connection_route.vpn_route_corp.

// Corporate VPN Gateway ID
output "corp_vpn_gtwy_id" {
  value = "${aws_vpn_gateway.vpn_gw_corp.id}"
}
