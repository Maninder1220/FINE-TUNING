output "username" {
  value = module.iam.username
}

output "user_arn" {
  value = module.iam.user_arn
}

output "secret_key" {
  value     = module.iam.secret
  sensitive = true
}

output "access_key" {
  value = module.iam.access_key
}

output "user_password" {
  value     = module.iam.password
  sensitive = true
}