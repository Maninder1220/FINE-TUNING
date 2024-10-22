# AVAILABILITY ZONE

# LOCAL
locals {
  aws_availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}



# Randomly Select AZ
resource "random_shuffle" "az" {
  input = local.aws_availability_zones
  result_count = 3    # No of availablity zone in list
}