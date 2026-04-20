o# Cloudbox — Multi-Environment Kubernetes Platform

![CI](https://github.com/tulinakdnz/cloudbox/actions/workflows/ci.yml/badge.svg)
![Terraform](https://img.shields.io/badge/Terraform-1.7.5-purple)
![Kubernetes](https://img.shields.io/badge/Kubernetes-1.29-blue)

Production-ready multi-environment Kubernetes platform managed with Terraform and GitHub Actions CI/CD.

## Features
- Modular Terraform structure (VPC, EKS, RDS modules)
- Kustomize-based per-environment Kubernetes configuration
- Automated CI/CD with GitHub Actions
- Kubernetes manifest validation on every push

## Environments
| Environment | Nodes | Instance   | Purpose     |
|-------------|-------|------------|-------------|
| dev         | 2     | t3.small   | Development |
| staging     | 3     | t3.medium  | Testing     |
| prod        | 5     | t3.large   | Production  |

## Project Structure
\`\`\`
cloudbox/
├── terraform/
│   ├── modules/        # Reusable modules (vpc, eks, rds)
│   └── environments/   # dev / staging / prod
├── kubernetes/
│   ├── base/           # Base manifests
│   └── overlays/       # Per-environment patches
├── helm/               # Helm charts and values
└── .github/workflows/  # CI/CD pipelines
\`\`\`

## Quick Start
\`\`\`bash
git clone https://github.com/tulinakdnz/cloudbox.git
cd cloudbox/terraform/environments/dev
terraform init
terraform plan
\`\`\`

## Tech Stack
Terraform · Kubernetes · Helm · GitHub Actions · AWS EKS · Kustomize
