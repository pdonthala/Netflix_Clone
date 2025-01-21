#!/bin/bash

#set -x

# Set the repository URL
REPO_URL="https://58UaIMznNKDqTrd7Oizcmj1j6UfJiLyNS4dovgg46sXs46vIa4EIJQQJ99BAACAAAAAAAAAAAAASAZDOe1Tq@dev.azure.com/azkdev992/K%20Dev/_git/K%20Dev"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: azdevreg.azurecr.io/kdev:$1|g" k8smanifests/deployment.yml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo