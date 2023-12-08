# Create a new Datadog - Amazon Web Services integration tag filter
resource "datadog_integration_aws_tag_filter" "foo" {
  account_id     = "746776318030"
  namespace      = "sqs"
  tag_filter_str = "business_application:roller_skate_state"
}