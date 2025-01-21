#!/bin/bash
echo "Hello"
REPO_URL="https://58UaIMznNKDqTrd7Oizcmj1j6UfJiLyNS4dovgg46sXs46vIa4EIJQQJ99BAACAAAAAAAAAAAAASAZDOe1Tq@dev.azure.com/azkdev992/K%20Dev/_git/K%20Dev"

git clone "REPO_URL" /tmp/temp_repo
cd tmp/temp_repo

sed -i "s|image:.*|image: azdevreg.azurecr.io/kdev:30|g" k8smanifests/deployment.yml

git add .
git commit -m "Updated the K8S file with new image tag"
git push
rm -rf /tmp/temp_repo