
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
  version = "~> 2.52"
  shared_credentials_file = var.aws_creds
}

resource "aws_cloudwatch_log_metric_filter" "log_metric_filter" {
  name           = var.log_filter.name
  pattern        = var.log_filter.pattern
  log_group_name = var.log_filter.log_group

  metric_transformation {
    name      = var.log_filter.metric_name
    namespace = var.log_filter.metric_name_space
    value     = var.log_filter.metric_value
    default_value = var.log_filter.metric_default_value
  }
}

resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  alarm_name                = var.metric_alarm.name
  alarm_description         = var.metric_alarm.description
  metric_name               = var.metric_alarm.metric_name
  namespace                 = var.metric_alarm.metric_namespace
  statistic                 = var.metric_alarm.statistic
  comparison_operator       = var.metric_alarm.comparitor
  period                    = var.metric_alarm.period
  evaluation_periods        = var.metric_alarm.periods
  threshold                 = var.metric_alarm.threshold
  insufficient_data_actions = var.metric_alarm.insufficient_data_actions
  alarm_actions             = var.metric_alarm.alarm_actions
}

module "lambda_function" {
  source = "../terraform-aws-lambda-function"
  #source = "github.com/davidburkitt/terraform-aws-lambda-function" # no override.tf if loaded from github!
  aws_creds = var.aws_creds
  aws_region = var.aws_region
  #count = length(var.lambda_functions)
  lambda_function = var.lambda_function
}



