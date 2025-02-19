# Building and Deploying a Netflix Clone App to Azure Kubernetes service 

I recently worked on a project to set up a CI/CD pipeline for a Netflix Clone App. This project leverages Azure DevOps, Docker, Azure Container Registry (ACR), ArgoCD, and Azure Kubernetes Services (AKS) for seamless integration and deployment. Here’s a step-by-step breakdown of how I implemented this:

![image](https://github.com/user-attachments/assets/e68f0c88-82b3-4b8a-8876-7d71b91524c9)


### Project Overview
• Source Code: Hosted in Azure Repos.
• TMDB API: Integrated to fetch movie data, API key referenced securely in the Dockerfile and Kubernetes yaml.
• Deployment Target: Azure Kubernetes Services (AKS) with zero-downtime updates via ArgoCD.

![image](https://github.com/user-attachments/assets/1562a7a9-5fe9-47d5-a756-21c18be43d35)


#### CI - Continuous Integration in Azure DevOps
Pipeline Stages:
• Build: Containerize the app using the multi-stage Dockerfile.
• Push: Push the built image to Azure Container Registry (ACR) using a configured Service Connection.

![image](https://github.com/user-attachments/assets/ec4344b1-49ac-444b-aedf-83162410ab2c)


#### CD - Continuous Deployment with ArgoCD
Pipeline Stages:
• Update Script for Image Version:
• Automatically updates the image version in the Kubernetes deployment YAML based on the latest build.
• Ensures ArgoCD picks up the changes in real-time.
ArgoCD Integration:
• Monitors the Kubernetes manifests stored in a Git repository.
• Deploys the app to AKS with zero downtime by applying rolling updates.

![image](https://github.com/user-attachments/assets/bed4bd32-ebe3-407f-be8a-9028fab860ad)
![image](https://github.com/user-attachments/assets/cd93d2d6-d238-4b11-a087-e0c4e564c01d)
![image](https://github.com/user-attachments/assets/33abaab6-d6c6-47d5-9c37-4808531ae834)
![image](https://github.com/user-attachments/assets/138847d8-a7c3-4b80-a868-7b1524dd054f)


#### Prerequisites
1. Azure Container Registry (ACR) and a service connection to it from Azure DevOps.
2. Azure Kubernetes Service (AKS) cluster with proper inbound port rules enabled for NodePort traffic.
3. TMDB API key securely referenced in the Dockerfile for fetching movie data.
4. ArgoCD installed on the AKS cluster for managing deployments.
