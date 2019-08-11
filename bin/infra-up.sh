#!/bin/bash
set -e

# make sure the terraform plan is ok (check for envs, etc)
cd $PWD/../tf 

# Terraform commands
terraform init 
terraform plan 
terraform apply

# this conforms to whats in our main.tf
CLUSTER_ID=$(terraform output cluster-id)
OUTFILE="kube.config"

echo "Grabbing k8s config from Digital Ocean $CLUSTER_ID"
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${TF_VAR_do_token}" "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTER_ID/kubeconfig" > $OUTFILE

# kube.config to KUBECONFIG ENV
export KUBECONFIG=$PWD/kube.config
