# INFRA STEP BY STEP
- VPC
- SUBNETS
    - Elastic IP
    - Nat Gateway
    - INTERNET GATEWAY
- ROUTE TABLE
- ROUTE
- ROUTE TABLE ASSOCIATION
- SECURITY GROUP
- SECURITY GROUP RULES


MY TERRA-NETWORKING PROJECT
In journey of this project I tried to build understanding of IaC (Terraform) and to gain 
knowledge of networking concepts like NAT, NACL, Security Group, Route .. 
following is the list of Data Block and Resource Block present in this IaC-Networking Project.


# DATA BLOCK
AVAILABILITY ZONE | ROUTE TABLE | AMI

# RESOURCES BLOCK
VPC | SUBNET | SECURITY GROUP | SECURITY GROUP RULES

S3 | VPC ENDPOINT 

ROUTE TABLE | ROUTE

NAT GATEWAY | ELASTIC IP

NACL | NACL RULE

KEY PAIR | TLS PRIVATE KEY

INTERNET GATEWAY | IG ATTACHMENT

INSTANCE


# Directory Structure
- FINE-TUNING/IaC/IAM
    - Module
    - Root (Root Dir)
- FINE-TUNING/IaC/InfraStructure
    - Module
    - Root (Root Dir)


# Project - Infrastructure
- VPC
    - NACL
        - NACL Rules
            - Private Subnet
                - Security Group
                    - Security Group Rule
                - Route
                    - Route Table
                
            - Public Subnet
                - Security Group
                    - Security Group Rule
                - EC2
                    - Key Pair
                - Route
                    - Route Table
                - Internet Gateway
                - NAT
                    - Elastic IP ( EIP )

- S3 ( Global Service )


# get sensitive data in Ubuntu Terminal
terraform output --raw 
