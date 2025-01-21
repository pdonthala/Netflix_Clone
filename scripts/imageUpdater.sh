#Add code
#!/bin/bash

set -x

set -e

# Set the repository URL
REPO_URL="https://58UaIMznNKDqTrd7Oizcmj1j6UfJiLyNS4dovgg46sXs46vIa4EIJQQJ99BAACAAAAAAAAAAAAASAZDOe1Tq@dev.azure.com/azkdev992/K%20Dev/_git/K%20Dev"
TEMP_DIR="/tmp/temp_repo"
# Clone the git repository into the /tmp directory
git clone "$REPO_URL" "$TEMP_DIR"

# Navigate into the cloned repository directory
cd "$TEMP_DIR"

# Make changes to the Kubernetes manifest file(s)
if [[ ! -f "k8smanifests/deployment.yml" ]]; then
  echo "Error: deployment.yml not found in k8smanifests directory."
  exit 1
fi
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: azdevreg.azurecr.io/kdev:$1|g" k8smanifests/deployment.yml

# Add the modified files
git add k8smanifests/deployment.yml

# Commit the changes
git commit -m "Update Kubernetes manifest with new image tag $1"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf "$TEMP_DIR"