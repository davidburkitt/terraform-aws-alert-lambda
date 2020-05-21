## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | ~> 2.52 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_creds | path to AWS secret and key | `string` | n/a | yes |
| aws\_region | aws region | `string` | n/a | yes |
| lambda\_function | Object represeting lambda function for metric alarm via SNS | <pre>object({<br>    name      = string # function name<br>    file      = string # zipped application package<br>    handler   = string # handler within function (e.g. main for GO)<br>    runtime   = string # runtime [dotnetcore1.0 dotnetcore2.0 dotnetcore2.1 dotnetcore3.1 go1.x java8 java11 nodejs4.3 nodejs4.3-edge nodejs6.10 nodejs8.10 nodejs10.x nodejs12.x provided python2.7 python3.6 python3.7 python3.8 ruby2.5 ruby2.7]<br>    variables = map(string) # environment variables<br>    topic     = string # SNS topic ARN<br>  })</pre> | n/a | yes |
| log\_filter | Object represeting log filter | <pre>object({<br>    name              = string # log filter name<br>    metric_name_space = string # custom name space for metrics<br>    metric_name       = string # metric name <br>    log_group         = string # log group to filter<br>    pattern           = string # pattern for space delimited log stream<br>    metric_value      = string # metric value (static e.g. "1" or dynamic e.g "$field")<br>    metric_default_value = number # default metric value - should be "0"<br>  })</pre> | n/a | yes |
| metric\_alarm | Object represeting metric alarm | <pre>object({<br>    name = string               # alarm name<br>    description = string        # alarm description<br>    metric_name = string        # metric name<br>    metric_namespace = string   # metric name space<br>    comparitor = string         # metric comparison formula<br>    statistic = string          # statistical measure of the metric to monitor e.g. Average, Max, Min<br>    period = string             # period in seconds over which to monitor<br>    periods = string            # number of periods to monitor<br>    threshold = string          # threshold value<br>    insufficient_data_actions = list(string)  # list of arns for insufficiant data event<br>    alarm_actions = list(string)  #list of arns for alarm event<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_function | lambda function arn |
| log\_filter | log filter name |
| metric\_alarm | metric alarm name |

