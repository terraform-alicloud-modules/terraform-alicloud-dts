locals {
  # Get ID of dts sync job resources
  this_dts_instance_id = var.create_sync_instance ? concat(alicloud_dts_synchronization_instance.sync_instance.*.id, [""])[0] : var.dts_instance_id
}
