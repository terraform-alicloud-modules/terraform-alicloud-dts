Terraform Module for creating Data Transmission Service (DTS) on Alibaba Cloud.

terraform-alicloud-dts
=====================================================================

[English](README.md) | 简体中文

本 Module 用于基于DTS自动化构建和管理数据传输服务，包含数据同步实例、数据同步作业、监控规则。

本 Module 支持创建以下资源:

* [alicloud_dts_synchronization_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dts_synchronization_instance)
* [alicloud_dts_synchronization_job](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dts_synchronization_job)
* [alicloud_dts_job_monitor_rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dts_job_monitor_rule)

## 用法

```hcl
module "default" {
  source = "terraform-alicloud-modules/dts/alicloud"

  create_sync_instance               = "true"
  auto_pay                           = "true"
  auto_start                         = "true"
  payment_type                       = "PayAsYouGo"
  source_endpoint_region             = "cn-hangzhou"
  destination_endpoint_region        = "cn-hangzhou"
  instance_class                     = "small"
  create_sync_job                    = true
  synchronization_bidirectional      = true
  dts_job_name                       = "tf-testAccCase"
  data_initialization                = "true"
  data_synchronization               = "true"
  structure_initialization           = "true"
  source_endpoint_instance_id        = "rm-bp1gxxxxxxxxjv"
  source_endpoint_database_name      = "source_database"
  source_endpoint_user_name          = "username"
  source_endpoint_password           = "password"
  destination_endpoint_instance_id   = "rm-bp1gxxxxxxxxka"
  destination_endpoint_database_name = "destination_database"
  destination_endpoint_user_name     = "username"
  destination_endpoint_password      = "password"
  db_list                            = "{\"test_database\":{\"name\":\"test_database\",\"all\":true,\"state\":\"normal\"}}"
  dts_job_status                     = "Synchronizing"
  create_monitor_rule                = false
}
```

## 示例

* [DTS 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-dts/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.138.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.138.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
