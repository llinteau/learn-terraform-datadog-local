resource "datadog_synthetics_test" "beacon" {
  type    = "api"
  subtype = "http"

  request_definition {
    method = "GET"
    url    = "http://a461624b0b190493aaf9ef94ac9ab2b7-1318968685.us-east-2.elb.amazonaws.com:8080"
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }

  locations = ["aws:us-west-2"]
  options_list {
    tick_every          = 900
    min_location_failed = 1
  }

  name    = "♥ CSVD - EOB - EMS - Datadog Admin - Lysettes Personal LAB EKS Beacon API Check via Terraform ♥"
  message = "Oh no! Light from Lysettes Beacon app is no longer shining!"
  tags    = ["app:beacon", "env:demo", "cost-usage:lysette-personal"]

  status = "live"
}

