
/*
output "log_filter" {
  value = module.log_filter.log_filters_output
  description = "log filter name"
}

output "metric_alarm" {
  value = module.metric_alarm.metric_alarms_output
  description = "metric alarm name"
}
*/

output "log_filter" {
  value = aws_cloudwatch_log_metric_filter.log_metric_filter.name
  description = "log filter name"
}

output "metric_alarm" {
  value = aws_cloudwatch_metric_alarm.metric_alarm.alarm_name
  description = "metric alarm name"
}

output "lambda_function" {
  value = module.lambda_function.lambda_functions_output
  description = "lambda function arn"
}

