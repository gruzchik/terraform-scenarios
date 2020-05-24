# Google Deployment Manager options:

Useful commands:

Run DM in dry run mode:
 - gcloud deployment-manager deployments create infraname --config=config.yaml --preview

Apply and update changes into infrastructure:
 - gcloud deployment-manager deployments update infraname

Remove resources from command line:
 - gcloud deployment-manager deployments delete

Show type of resources in Deployment Manager:
 - gcloud deployment-manager types list | grep network
 - gcloud deployment-manager types list | grep instance
