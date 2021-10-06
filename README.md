# Infrastructure as Code Demo

This repository contains a demo app showcasing Infrastructure as Coding principles, in combination with some Continuous Deployment. Each of the subfolders contains a separate README with information about that specific component.

The app that is deployed here consists of a Docker container that is being built in the GitHub Actions pipeline. The app is being deployed to a Flatcar virtual machine that is running on an OpenStack cloud setting - all provisioned through Terraform.