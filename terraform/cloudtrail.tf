resource "aws_cloudtrail" "security_audit" {
  name                          = "aegis-enterprise-cloudtrail"
  s3_bucket_name                = "aegis-audit-logs-vault"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}

resource "aws_guardduty_detector" "threat_detector" {
  enable = true
}
