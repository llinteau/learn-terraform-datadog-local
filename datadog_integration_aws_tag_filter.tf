# https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/integration_aws_tag_filter
# Provides a Datadog AWS tag filter resource. This can be used to create and manage Datadog AWS tag filters.
resource "datadog_integration_aws_tag_filter" "foo" {
  account_id     = "746776318030"
  namespace      = "sqs"
  tag_filter_str = "added_via_tf_application:rollerskate_haven"
}