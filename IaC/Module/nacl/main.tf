# # # # # NACL # # # # #
resource "aws_network_acl" "n_acl" {
  vpc_id = var.vpc_id
}

# INGRESS aka INBOUND
resource "aws_network_acl_rule" "ing_n_acl_4_ssh" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "ing_n_acl_4_http" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "ing_n_acl_4_https" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 443
  to_port        = 443
}

# EGRESS aka OUTBOUND
resource "aws_network_acl_rule" "egr_n_acl_4_ssh" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "egr_n_acl_4_http" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "egr_n_acl_4_https" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 300
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_destination_cider
  from_port      = 443
  to_port        = 443
}