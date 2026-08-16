# Terraform-gcp-infra

A small, learning-focused Terraform project that provisions a public web
server on Google Cloud: a VPC and subnet, firewall rules for HTTP/SSH, and
one `e2-micro` VM running nginx. Built to stay entirely within GCP's
[Always Free tier](https://cloud.google.com/free/docs/free-cloud-features#compute).

## Architecture

```
bootstrap/              -> one-time setup: creates the GCS bucket that
                            holds Terraform's remote state for dev/prod

modules/
  network/               -> VPC + subnet
  firewall/               -> firewall rules (HTTP open, SSH restricted
                              to a single IP)
  compute/               -> the VM, boot disk, and an nginx startup script

environments/
  dev/                   -> calls all three modules with dev values
  prod/                  -> calls all three modules with prod values
```

`environments/dev` and `environments/prod` are independent: same modules,
different variable values, and separate state files stored under different
prefixes inside the one shared state bucket bootstrap creates.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [gcloud CLI](https://cloud.google.com/sdk/docs/install), authenticated
  (`gcloud auth login`)
- A GCP project with billing enabled (the Always Free tier still requires a
  billing account attached to the project, it just won't charge you for
  usage within the free limits)
- The Compute Engine API enabled on that project:
  ```
  gcloud services enable compute.googleapis.com --project=<your-project-id>
  ```

## Setup

### 1. Bootstrap — create the remote state bucket (run once)

```
cd bootstrap
cp terraform.tfvars.example terraform.tfvars
# edit terraform.tfvars: set project_id, region, and a globally-unique bucket_name
terraform init
terraform plan
terraform apply
```

### 2. Point an environment's backend at that bucket

In `environments/dev/backend.tf` (and `environments/prod/backend.tf`), set
`bucket` to the exact bucket name you chose above. Each environment uses a
different `prefix` (`"dev"` / `"prod"`) so their state files don't collide
inside the shared bucket.

### 3. Deploy an environment

```
cd environments/dev          # or environments/prod
cp terraform.tfvars.example terraform.tfvars
# edit terraform.tfvars: set project_id, region, and ssh_source_range
# (find your IP with: curl -4 ifconfig.me — restricts SSH to just you
# instead of the whole internet)
terraform init
terraform plan
terraform apply
```

On success, Terraform prints `web_server_ip` — open `http://<that-ip>/` in
a browser to see nginx running.

### 4. Tear down when you're done

```
terraform destroy
```

Always destroy an environment after you're done testing it rather than
leaving it running unattended.

## Staying free

- GCP's Always Free tier covers **one** `e2-micro` instance per billing
  account per month — **never run `dev` and `prod` at the same time**, or
  one of them will incur normal charges. Destroy one before applying the
  other.
- Everything else here (10 GB standard disk, ephemeral IP, VPC, firewall
  rules) is free regardless of usage.

## CI

`.github/workflows/ci.yml` runs on every push/PR touching a `.tf` file:
`terraform fmt -check` followed by `terraform init -backend=false` +
`terraform validate` for both `dev` and `prod`. It never runs `plan` or
`apply` — it's a pure syntax/style safety net and needs no GCP credentials.

## Learning notes

The `notes/` folder has a plain-English writeup of every file, every bug
found and fixed, and the key Terraform concepts behind each part of this
project — written while debugging this repo from scratch. Start at
`notes/01-bootstrap.txt` and read in order.
