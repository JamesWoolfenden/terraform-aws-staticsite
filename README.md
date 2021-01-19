# terraform-aws-staticsite

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-staticsite/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-staticsite)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-staticsite.svg)](https://github.com/JamesWoolfenden/terraform-aws-staticsite/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-staticsite.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-staticsite/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-staticsite/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-staticsite&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-staticsite/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-staticsite&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module to provision a secure Terraform S3 bucket as a static website.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "static" {
  source              = "JamesWoolfenden/staticsite/aws"
  version             = "0.3.1"
  common_tags         = var.common_tags
  permitted_ip_ranges = var.permitted_ip_ranges
  s3_bucket_name      = var.s3_bucket_name
}
```

## Module Usage

This creates an s3 bucket with policy and applies the common tags scheme.
The module uses a tagging scheme based on the map variable common*tags.
This needs to consist of as a minimum(in your \_terraform.tfvars*):

```HCL
common_tags = {
    application = "terraform"
    module      = "staticsite"
    environment = "develop"
}
```

## Checkov

I have added a number of exceptions to this module:

```markdown
#checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
#checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
#checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
#checkov:skip=CKV_AWS_20: "S3 Bucket has an ACL defined which allows public READ access."
#checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
```

They relate to private usage and not website - public usage.

## Testing

This module is validated and built and destroyed with every version.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_log\_bucket | Name of your access logging bucket | `string` | `"access_log_record"` | no |
| bucket\_acl | n/a | `string` | `"public-read"` | no |
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
| s3 | n/a |

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

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_email]: mailto:?subject=terraform-aws-staticsite&body=https://github.com/JamesWoolfenden/terraform-aws-staticsite
