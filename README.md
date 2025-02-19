# Building and Deploying a Netflix Clone App to Azure Kubernetes service 

I recently worked on a project to set up a CI/CD pipeline for a Netflix Clone App. This project leverages Azure DevOps, Docker, Azure Container Registry (ACR), ArgoCD, and Azure Kubernetes Services (AKS) for seamless integration and deployment. Here’s a step-by-step breakdown of how I implemented this:

### Project Overview
• Source Code: Hosted in Azure Repos.
• TMDB API: Integrated to fetch movie data, API key referenced securely in the Dockerfile and Kubernetes yaml.
• Deployment Target: Azure Kubernetes Services (AKS) with zero-downtime updates via ArgoCD.

#### CI - Continuous Integration in Azure DevOps
Pipeline Stages:
• Build: Containerize the app using the multi-stage Dockerfile.
• Push: Push the built image to Azure Container Registry (ACR) using a configured Service Connection.

#### CD - Continuous Deployment with ArgoCD
Pipeline Stages:
• Update Script for Image Version:
• Automatically updates the image version in the Kubernetes deployment YAML based on the latest build.
• Ensures ArgoCD picks up the changes in real-time.
ArgoCD Integration:
• Monitors the Kubernetes manifests stored in a Git repository.
• Deploys the app to AKS with zero downtime by applying rolling updates.

#### Prerequisites
✔️ Azure Container Registry (ACR) and a service connection to it from Azure DevOps.
✔️ Azure Kubernetes Service (AKS) cluster with proper inbound port rules enabled for NodePort traffic.
✔️ TMDB API key securely referenced in the Dockerfile for fetching movie data.
✔️ ArgoCD installed on the AKS cluster for managing deployments.
