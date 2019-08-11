#!/bin/bash
# make sure the terraform plan is ok (check for envs, etc)
terraform plan
terraform apply

# this conforms to whats in our main.tf
CLUSTER_ID=$(terraform output cluster-id)
OUTFILE="kube.config"

echo "Grabbing k8s config from Digital Ocean $CLUSTER_ID"
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${TF_VAR_do_token}" "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTER_ID/kubeconfig" > $OUTFILE
