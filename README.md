
[![Slalom][logo]](https://slalom.com)

# terraform-aws-staticsite [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-aws-staticsite.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-staticsite) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-staticsite.svg)](https://github.com/JamesWoolfenden/terraform-aws-staticsite/releases/latest) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

Terraform module to provision a secure Terraform S3 bucket as a static website.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "static" {
  source              = "JamesWoolfenden/staticsite/aws"
  verion              = "0.2.4"
  common_tags         = var.common_tags
  permitted_ip_ranges = var.permitted_ip_ranges
  s3_bucket_name      = var.s3_bucket_name
}
```

## Module Usage

This creates an s3 bucket with policy and applies the common tags scheme.
The module uses a tagging scheme based on the map variable common_tags.
This needs to consist of as a minimum(in your *terraform.tfvars*):

```HCL
common_tags = {
    application = "terraform"
    module      = "staticsite"
    environment = "develop"
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| access\_log\_bucketame | Name of your access logging bucket | `string` | `"access_log_record"` | no |
| bucket\_acl | n/a | `string` | `"Private"` | no |
| common\_tags | n/a | `map` | n/a | yes |
| force\_destroy | n/a | `bool` | `true` | no |
| permitted\_iam | iam roles with access to S3 bucket website. | `list` | n/a | yes |
| permitted\_ip\_ranges | IP Address ranges permitted to access S3 bucket website. | `list` | n/a | yes |
| s3\_bucket\_name | The raw name of the bucket | `string` | n/a | yes |
| versioning | Switch to control versioning | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| account\_id | n/a |
| s3\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| s3\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| s3\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
| s3\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| s3\_id | The name of the bucket. |
| s3\_name | n/a |
| s3\_region | The AWS region this bucket resides in. |
| s3\_website\_domain | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| s3\_website\_endpoint | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Instructions

## Related Projects

Check out these related projects.

- [terraform-aws-statebucket](https://github.com/jameswoolfenden/terraform-aws-statebucket) - Terraform s3 state buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-staticsite/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-staticsite/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_email]: mailto:?subject=terraform-aws-staticsite&body=https://github.com/JamesWoolfenden/terraform-aws-staticsite
