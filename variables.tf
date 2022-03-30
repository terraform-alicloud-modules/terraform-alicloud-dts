##############################
# DTS Synchronization Instance
##############################
variable "create_sync_instance" {
  description = "Controls if synchronization instance should be created"
  type        = bool
  default     = true
}

variable "auto_pay" {
  description = "Whether to automatically renew when it expires. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "auto_start" {
  description = "Whether to automatically start the task after the purchase completed. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "payment_type" {
  description = "(Required) The payment type of the resource. Valid values: `Subscription`, `PayAsYouGo`."
  type        = string
  default     = "PayAsYouGo"
}

variable "payment_duration" {
  description = "(Required When payment_type equals `Subscription`) The duration of prepaid instance purchase."
  type        = number
  default     = 1
}

variable "payment_duration_unit" {
  description = "(Required When payment_type equals `Subscription`) The payment duration unit. Valid values: `Month`, `Year`."
  type        = string
  default     = "Month"
}

variable "source_endpoint_region" {
  description = "(Required) The region of source instance."
  type        = string
  default     = ""
}

variable "destination_endpoint_region" {
  description = "(Required) The region of destination instance."
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "The instance class. Valid values: `large`, `medium`, `micro`, `small`, `xlarge`, `xxlarge`. You can only upgrade the configuration, not downgrade the configuration. If you downgrade the instance, you need to submit a ticket."
  type        = string
  default     = "medium"
}


#########################
# DTS Synchronization Job
#########################
variable "create_sync_job" {
  description = "Controls if synchronization job should be created"
  type        = bool
  default     = false
}

variable "dts_instance_id" {
  description = "The ID of dts synchronization instance. While create_sync_instance equals false, this parameter should be configured."
  type        = string
  default     = ""
}

variable "dts_job_name" {
  description = "(Required) The name of synchronization job."
  type        = string
  default     = ""
}

variable "data_initialization" {
  description = "(Required) Whether to perform full data migration or full data initialization. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "data_synchronization" {
  description = "(Required) Whether to perform incremental data migration or synchronization. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "structure_initialization" {
  description = "(Required) Whether to perform library table structure migration or initialization. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "synchronization_bidirectional" {
  description = "Whether to build a bidirectional channel. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "source_endpoint_instance_id" {
  description = "(Required) The ID of source instance."
  type        = string
  default     = ""
}

variable "source_endpoint_database_name" {
  description = "(Required) The name of the database to which the migration object belongs in the source instance."
  type        = string
  default     = ""
}

variable "source_endpoint_user_name" {
  description = "(Required) The username of database account."
  type        = string
  default     = ""
}

variable "source_endpoint_password" {
  description = "(Required) The password of database account."
  type        = string
  default     = ""
}

variable "destination_endpoint_instance_id" {
  description = "(Required) The ID of destination instance."
  type        = string
  default     = ""
}

variable "destination_endpoint_database_name" {
  description = "(Required) The name of the database to which the migration object belongs in the target instance."
  type        = string
  default     = ""
}

variable "destination_endpoint_user_name" {
  description = "(Required) The username of database account."
  type        = string
  default     = ""
}

variable "destination_endpoint_password" {
  description = "(Required) The password of database account."
  type        = string
  default     = ""
}

variable "delay_notice" {
  description = "The delay notice. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "delay_phone" {
  description = "The delay phone. The mobile phone number of the contact who delayed the alarm. Multiple mobile phone numbers separated by English commas ,. This parameter currently only supports China stations, and only supports mainland mobile phone numbers, and up to 10 mobile phone numbers can be passed in."
  type        = string
  default     = ""
}

variable "delay_rule_time" {
  description = "The delay rule time. When delay_notice is set to true, this parameter must be passed in. The threshold for triggering the delay alarm. The unit is second and needs to be an integer. The threshold can be set according to business needs. It is recommended to set it above 10 seconds to avoid delay fluctuations caused by network and database load."
  type        = string
  default     = "60"
}

variable "error_notice" {
  description = "The error notice. Valid values: `true`, `false`."
  type        = bool
  default     = false
}

variable "error_phone" {
  description = "The error phone. The mobile phone number of the contact who error the alarm. Multiple mobile phone numbers separated by English commas ,. This parameter currently only supports China stations, and only supports mainland mobile phone numbers, and up to 10 mobile phone numbers can be passed in."
  type        = string
  default     = ""
}

variable "db_list" {
  description = "(Required) Migration object, with the format of JSON strings. For detailed definition instructions, please refer to [The description of migration, synchronization or subscription objects](https://help.aliyun.com/document_detail/209545.html)."
  type        = string
  default     = ""
}

variable "dts_job_status" {
  description = "The status of the resource. Valid values: `Synchronizing`, `Suspending`. You can stop the task by specifying `Suspending` and start the task by specifying `Synchronizing`."
  type        = string
  default     = "Synchronizing"
}


#####################
# DTS Job Moitor Rule
#####################
variable "create_monitor_rule" {
  description = "Controls if monitor rule should be created"
  type        = bool
  default     = false
}

variable "monitor_rule_type" {
  description = "(Required) Monitoring rules of type, valid values: `delay`, `error`."
  type        = string
  default     = "delay"
}

variable "monitor_rule_delay_time" {
  description = "Trigger delay alarm threshold, which is measured in seconds."
  type        = string
  default     = "60"
}

variable "monitor_rule_phone" {
  description = "The alarm is triggered after notification of the contact phone number, A plurality of phone numbers between them with a comma (,) to separate."
  type        = string
  default     = ""
}

variable "monitor_rule_status" {
  description = "Whether to enable monitoring rules, valid values: `Y`, `N`."
  type        = string
  default     = "Y"
}