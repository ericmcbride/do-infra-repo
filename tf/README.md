formed Digital Ocean Cluster
Creates a 2 node (2 gb each) Kubernetes cluster in Digital Ocean. 
Make sure you have the following:
``
export TF_VAR_do_token=your_digital_ocean_token
export TF_VAR_do_cluster_name=your_cluster_name
``

run `terraform plan` to make sure everything looks good.

If good, run `terraform apply`

### TODO:
- Add Helm + Tiller 
- Add Linkerd Install + Flagger
- Kubernetes microservices files.`
