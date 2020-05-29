# terraform-scenarios

useful commands:

install modules:
 - terraform init

show future changes:
 - terraform plan

apply functionality from TF file:
 - terraform apply

delete functionality from TF file:
 - terraform destroy

show created insfastructure:
 - terraform show

use some command with only specified target:
 - terraform (plan/apply/destroy) --target modulename

run terraform with specified vars:
 - terraform (plan/apply/destroy) -var="tf_project_name=project_name_id"
