# # # # # NACL # # # # #
resource "aws_network_acl" "n_acl" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.belongs_to}-NACL"
  }

}


# NACL ASSOCIATION WITH SUBNETS 
resource "aws_network_acl_association" "private_nacl" {
  network_acl_id = aws_network_acl.n_acl.id
  subnet_id = var.private_subnet_id
}

resource "aws_network_acl_association" "public_nacl" {
  network_acl_id = aws_network_acl.n_acl.id
  subnet_id = var.public_subnet_id
}


# INGRESS aka INBOUND

# ALL TRAFFIC
resource "aws_network_acl_rule" "ing_n_acl_4_all_in" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"   # TRY CHANGING THIS TYPE
  from_port      = -1
  to_port        = -1
}

# SSH
resource "aws_network_acl_rule" "ing_n_acl_4_ssh" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"   # TRY CHANGING THIS TYPE
  from_port      = 22
  to_port        = 22
}

# HTTP
resource "aws_network_acl_rule" "ing_n_acl_4_http" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

# HTTPS
resource "aws_network_acl_rule" "ing_n_acl_4_https" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 400
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

# ICMP
resource "aws_network_acl_rule" "ing_n_acl_4_icmp" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 500
  egress         = false
  protocol       = 1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = -1
  to_port        = -1
}

# MySQL
resource "aws_network_acl_rule" "ing_n_acl_mysql" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 600  
  egress         = false
  protocol       = "tcp"  
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"  
  from_port      = 3306  # MySQL default port
  to_port        = 3306  # MySQL default port
}

# EGRESS aka OUTBOUND

# ALL TRAFFIC
resource "aws_network_acl_rule" "ing_n_acl_4_all_out" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"   # TRY CHANGING THIS TYPE
  from_port      = -1
  to_port        = -1
}

# SSH
resource "aws_network_acl_rule" "egr_n_acl_4_ssh" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}


# HTTP
resource "aws_network_acl_rule" "egr_n_acl_4_http" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 300
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

# HTTPS
resource "aws_network_acl_rule" "egr_n_acl_4_https" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 400
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

# ICMP
resource "aws_network_acl_rule" "egr_n_acl_4_icmp" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 500
  egress         = true
  protocol       = 1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = -1
  to_port        = -1
}

# MySQL
resource "aws_network_acl_rule" "eg_n_acl_mysql" {
  network_acl_id = aws_network_acl.n_acl.id
  rule_number    = 600  # Ensure uniqueness
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"  # Adjust as needed
  from_port      = 3306
  to_port        = 3306
}