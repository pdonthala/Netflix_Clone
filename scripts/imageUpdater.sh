#!/bin/bash
echo "Hello"

dos2unix /home/azureuser/myagent/_work/1/s/scripts/imageUpdater.sh

REPO_URL="https://B9FeDCntv6BF8ipN6VWBDM5otB9L0QrHfTIb0Cr7Hf9nYuGIUhAZJQQJ99BAACAAAAAAAAAAAAASAZDOzfwN@dev.azure.com/azkdev992/K%20Dev/_git/K%20Dev"

git clone "REPO_URL" /tmp/temp_repo
cd tmp/temp_repo

sed -i "s|image:.*|image: azdevreg.azurecr.io/kdev:30|g" k8smanifests/deployment.yml

git add .
git commit -m "Updated the K8S file with new image tag"
git push
rm -rf /tmp/temp_repo