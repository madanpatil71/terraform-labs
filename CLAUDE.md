# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

A personal repo of Terraform practice configurations for AWS. It is not a production codebase. There is no CI, no remote backend, no shared modules and no test suite. Study notes live in a separate repo (`devops-terraform-labs`).

## Layout

- `terraform-basics/<topic>/`: small, single-resource exercises (e.g. `ec2-instance`).
- `terraform-projects/<project>/`: multi-resource builds (e.g. `aws-vpc-architecture`). These use the standard `main.tf` / `variables.tf` split, and outputs/providers are added as separate files when needed.

Each folder is an independent Terraform root module with its own state. Run commands from inside that folder, not from the repo root. Several `.tf` files are currently empty placeholders. The provider is pinned to `hashicorp/aws ~> 5.0` and the region is `ap-south-1`.

## Commands

Run these from inside a specific root module directory:

```sh
terraform init        # download providers / set up backend
terraform fmt         # format (use -recursive from repo root to format everything)
terraform validate    # syntax/consistency check (requires init first)
terraform plan
terraform apply
terraform destroy
```

`apply` and `destroy` create and delete real AWS resources, which can cost money. Never run them unless the user explicitly asks. Use `fmt`, `validate` and `plan` for verification.

Commit `.terraform.lock.hcl`. Never commit `.terraform/` or state files; `.gitignore` already excludes them.
