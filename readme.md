# Terraform Docker Image

![!](https://img.shields.io/dub/l/vibe-d.svg) ![!](https://img.shields.io/docker/stars/raffaeldutra/docker-terraform.svg) ![!](https://img.shields.io/docker/pulls/raffaeldutra/docker-terraform.svg) ![!](https://img.shields.io/docker/automated/raffaeldutra/docker-terraform.svg) ![!](https://img.shields.io/docker/build/raffaeldutra/docker-terraform.svg)

You can find this image in the link below.

[https://hub.docker.com/r/raffaeldutra/docker-terraform](https://hub.docker.com/r/raffaeldutra/docker-terraform/)

All tags available for this image, which is based on Terraform versions.
[https://cloud.docker.com/repository/docker/raffaeldutra/docker-terraform/tags](https://cloud.docker.com/repository/docker/raffaeldutra/docker-terraform/tags)

## What does Terraform do?

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions. Configuration files describe to Terraform the components needed to run a single application or your entire datacenter.

You will find the whole documentation here:
[https://https://www.terraform.io/docs/index.html](https://https://www.terraform.io/docs/index.html)

## TL;DR

You will just follow the default "behavior" for Terraform, run the init, plan, apply and destroy commands in your CLI as usual, but inside a container.

You need to provide a folder containing your infrastructure's definition.

## What does this image do?

* Terraform binary installation.
* You need to pass your folder containing the infrastructure's definition, in my example below it is my current directory `$(pwd)`.
* You need to pass the credentials for your service, `~/.aws` or using another approach.
* If you have modules in a different path, you need to map it using volumes.
* If you are creating files (ssh keys, maybe?), you need to map that to get access to those files/directories.

## How to build this image?

```bash
docker build -t raffaeldutra/docker-terraform .
```

## Initializing a project

The `terraform init` command.

On this example:

* Using the current terraform files and mapping it to `/terraform` volume.
* Using volumes to map the credentials for `AWS`.

```bash
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
raffaeldutra/docker-terraform:v0.12.0 \
terraform init
```

## Planning your infrastructure

The `terraform plan` command.

```bash
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
raffaeldutra/docker-terraform:v0.12.0 \
terraform plan
```

## Applying your infrastructure

The `terraform apply` command.

Here we need to map `ssh` directory, because on this example, it generates keys in `/tmp/ssh`

```bash
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
-v $(pwd)/ssh:/tmp/ssh \
raffaeldutra/docker-terraform:v0.12.0 \
terraform apply -auto-approve
```

## Destroying your infrastructure

The `terraform destroy` command.

```bash
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
raffaeldutra/docker-terraform:v0.12.0 \
terraform destroy -auto-approve
```