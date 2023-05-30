# Terraform

This projects infrastructure is managed by terraform.

## Environments

There are 3 different environments. 2 Application environments and 1 Shared resources environment.

#### Application Environments:

- Develop: Deploys resources to Develop env when pushing to `main` branch
- Prod: Deploys resources to Prod env when creating a tag with `release-<version>`

#### Shared Environment:

The Shared environment is responsible for deploying resources that would be shared across both application environments. Currently the only thing being used this way is the ECR Repository.

## App Module

The core infrastructure of the application sits in the `/modules/app` directory. This is where the VPC, IAM Roles, and EKS cluster are defined. They are referenced in the 2 application environments.

## State Management

All State lives in S3 and has State Locking enabled with DynamoDB.

For learning how to set this up follow [this link](https://developer.hashicorp.com/terraform/language/settings/backends/s3).
