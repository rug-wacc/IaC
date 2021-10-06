# Basic Docker image

Extremely simplistic Docker image. Build and publish using
```
docker build . -t <username>/<imagename>:<tag>
docker push <username>/<imagename>:<tag>
```

The exact image name should correspond with the value in `locals.auto.tfvars.json` for Terraform.