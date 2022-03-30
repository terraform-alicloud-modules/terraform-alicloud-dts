output "dts_instance_id" {
  value = concat(alicloud_dts_synchronization_instance.sync_instance.*.id, [""])[0]
}

output "dts_job_id" {
  value = concat(alicloud_dts_synchronization_job.sync_job.*.id, [""])[0]
}

output "dts_job_name" {
  value = concat(alicloud_dts_synchronization_job.sync_job.*.dts_job_name, [""])[0]
}

output "dts_job_status" {
  value = concat(alicloud_dts_synchronization_job.sync_job.*.status, [""])[0]
}

output "monitor_rule_id" {
  value = concat(alicloud_dts_job_monitor_rule.monitor_rule.*.id, [""])[0]
}

output "monitor_rule_state" {
  value = concat(alicloud_dts_job_monitor_rule.monitor_rule.*.state, [""])[0]
}