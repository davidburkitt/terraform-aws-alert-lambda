variable "aws_creds" {
  type        = string
  description = "path to AWS secret and key"
}

variable "aws_region" {
  type        = string
  description = "aws region"
}

variable "log_filter" {
  type = object({
    name              = string # log filter name
    metric_name_space = string # custom name space for metrics
    metric_name       = string # metric name 
    log_group         = string # log group to filter
    pattern           = string # pattern for space delimited log stream
    metric_value      = string # metric value (static e.g. "1" or dynamic e.g "$field")
    metric_default_value = number # default metric value - should be "0"
  })
  description = "Object represeting log filter"
}

variable "metric_alarm" {
  type = object({
    name = string               # alarm name
    description = string        # alarm description
    metric_name = string        # metric name
    metric_namespace = string   # metric name space
    comparitor = string         # metric comparison formula
    statistic = string          # statistical measure of the metric to monitor e.g. Average, Max, Min
    period = string             # period in seconds over which to monitor
    periods = string            # number of periods to monitor
    threshold = string          # threshold value
    insufficient_data_actions = list(string)  # list of arns for insufficiant data event
    alarm_actions = list(string)  #list of arns for alarm event
  })
  description = "Object represeting metric alarm"
}

variable "lambda_function" {
  type = object({
    name      = string # function name
    file      = string # zipped application package
    handler   = string # handler within function (e.g. main for GO)
    runtime   = string # runtime [dotnetcore1.0 dotnetcore2.0 dotnetcore2.1 dotnetcore3.1 go1.x java8 java11 nodejs4.3 nodejs4.3-edge nodejs6.10 nodejs8.10 nodejs10.x nodejs12.x provided python2.7 python3.6 python3.7 python3.8 ruby2.5 ruby2.7]
    variables = map(string) # environment variables
    topic     = string # SNS topic ARN
  })
  description = "Object represeting slack alert"
}



