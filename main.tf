
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
  version = "~> 2.52"
  shared_credentials_file = var.aws_creds
}

module "log_filter" {
  source = "../terraform-aws-log-filter"
  #source = "github.com/davidburkitt/terraform-aws-log-filter"
  aws_creds = var.aws_creds
  aws_region = var.aws_region
  #count = length(var.log_filters)
  log_filter = var.log_filter
}

module "metric_alarm" {
  source = "../terraform-aws-metric-alarm"
  #source = "github.com/davidburkitt/terraform-aws-metric-alarm"
  aws_creds = var.aws_creds
  aws_region = var.aws_region
  #count = length(var.metric_alarms)
  metric_alarm = var.metric_alarm
}

module "lambda_function" {
  source = "../terraform-aws-lambda-function"
  #source = "github.com/davidburkitt/terraform-aws-lambda-function" # no override.tf if loaded from github!
  aws_creds = var.aws_creds
  aws_region = var.aws_region
  #count = length(var.lambda_functions)
  lambda_function = var.lambda_function
}



