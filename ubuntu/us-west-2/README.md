# Jammy templates

Only one .tf file can be in the pwd during the terraform by default, so delete whatever isn't getting used :)

There are two .tf files, the basic minimal one `ubuntu2022jammy.tf` and another more detailed one `ubuntu2022jammy_with_net.tf` with post provision execution and network rules.


The `mountup` script is the post provisioning script that adds additional disks, and in the template example does a `docker-compose up -d`. 
This template does not include a docker-compose.yml or anything, so remove/replace that as needed with whatever post provisioning actions you need.
