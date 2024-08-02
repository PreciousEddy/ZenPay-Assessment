# providers.tf

provider "aws" {
  region  = var.region

  # Optionally specify an AWS profile (if using named profiles)
  #profile = var.aws_profile

  # Optionally specify access credentials (not recommended for security reasons)
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

# Define other providers if needed, such as for other cloud services or APIs
