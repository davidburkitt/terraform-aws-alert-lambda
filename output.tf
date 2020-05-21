
output "log_filter" {
  value = module.log_filter.log_filters_output
  description = "log filter name"
}

output "metric_alarm" {
  value = module.metric_alarm.metric_alarms_output
  description = "metric alarm name"
}

output "lambda_function" {
  value = module.lambda_function.lambda_functions_output
  description = "lambda function arn"
}

