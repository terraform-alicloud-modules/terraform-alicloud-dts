resource "alicloud_dts_synchronization_instance" "sync_instance" {
  count                            = var.create_sync_instance ? 1 : 0
  auto_pay                         = var.auto_pay
  auto_start                       = var.auto_start
  payment_type                     = var.payment_type
  payment_duration                 = var.payment_type == "Subscription" ? var.payment_duration : null
  payment_duration_unit            = var.payment_type == "Subscription" ? var.payment_duration_unit : null
  source_endpoint_region           = var.source_endpoint_region
  destination_endpoint_region      = var.destination_endpoint_region
  source_endpoint_engine_name      = "MySQL"
  destination_endpoint_engine_name = "MySQL"
  instance_class                   = var.instance_class
  sync_architecture                = var.synchronization_bidirectional ? "bidirectional" : "oneway"
}

resource "alicloud_dts_synchronization_job" "sync_job" {
  count                              = var.create_sync_job ? 1 : 0
  depends_on                         = [alicloud_dts_synchronization_instance.sync_instance]
  dts_instance_id                    = local.this_dts_instance_id
  dts_job_name                       = var.dts_job_name
  instance_class                     = var.instance_class
  data_initialization                = var.data_initialization
  data_synchronization               = var.data_synchronization
  structure_initialization           = var.structure_initialization
  synchronization_direction          = var.synchronization_bidirectional ? "Forward" : null
  source_endpoint_instance_type      = "RDS"
  source_endpoint_engine_name        = "MySQL"
  source_endpoint_region             = var.source_endpoint_region
  source_endpoint_instance_id        = var.source_endpoint_instance_id
  source_endpoint_database_name      = var.source_endpoint_database_name
  source_endpoint_user_name          = var.source_endpoint_user_name
  source_endpoint_password           = var.source_endpoint_password
  destination_endpoint_instance_type = "RDS"
  destination_endpoint_engine_name   = "MySQL"
  destination_endpoint_region        = var.destination_endpoint_region
  destination_endpoint_instance_id   = var.destination_endpoint_instance_id
  destination_endpoint_database_name = var.destination_endpoint_database_name
  destination_endpoint_user_name     = var.destination_endpoint_user_name
  destination_endpoint_password      = var.destination_endpoint_password
  delay_notice                       = var.delay_notice
  delay_phone                        = var.delay_phone
  delay_rule_time                    = var.delay_rule_time
  error_notice                       = var.error_notice
  error_phone                        = var.error_phone
  db_list                            = var.db_list
  status                             = var.dts_job_status
}

resource "alicloud_dts_synchronization_job" "sync_job_reverse" {
  count                              = var.create_sync_job ? var.synchronization_bidirectional ? 1 : 0 : 0
  depends_on                         = [alicloud_dts_synchronization_instance.sync_instance]
  dts_instance_id                    = local.this_dts_instance_id
  dts_job_name                       = format("%s%s", var.dts_job_name, "_reverse")
  instance_class                     = var.instance_class
  data_initialization                = var.data_initialization
  data_synchronization               = var.data_synchronization
  structure_initialization           = var.structure_initialization
  synchronization_direction          = "Reverse"
  source_endpoint_instance_type      = "RDS"
  source_endpoint_engine_name        = "MySQL"
  source_endpoint_region             = var.destination_endpoint_region
  source_endpoint_instance_id        = var.destination_endpoint_instance_id
  source_endpoint_database_name      = var.destination_endpoint_database_name
  source_endpoint_user_name          = var.destination_endpoint_user_name
  source_endpoint_password           = var.destination_endpoint_password
  destination_endpoint_instance_type = "RDS"
  destination_endpoint_engine_name   = "MySQL"
  destination_endpoint_region        = var.source_endpoint_region
  destination_endpoint_instance_id   = var.source_endpoint_instance_id
  destination_endpoint_database_name = var.source_endpoint_database_name
  destination_endpoint_user_name     = var.source_endpoint_user_name
  destination_endpoint_password      = var.source_endpoint_password
  delay_notice                       = var.delay_notice
  delay_phone                        = var.delay_phone
  delay_rule_time                    = var.delay_rule_time
  error_notice                       = var.error_notice
  error_phone                        = var.error_phone
  db_list                            = var.db_list
  status                             = var.dts_job_status
}

resource "alicloud_dts_job_monitor_rule" "monitor_rule" {
  count           = var.create_sync_job ? var.create_monitor_rule ? 1 : 0 : 0
  depends_on      = [alicloud_dts_synchronization_job.sync_job]
  dts_job_id      = concat(alicloud_dts_synchronization_job.sync_job.*.id, [""])[0]
  type            = var.monitor_rule_type
  delay_rule_time = var.monitor_rule_delay_time
  phone           = var.monitor_rule_phone
  state           = var.monitor_rule_status
}