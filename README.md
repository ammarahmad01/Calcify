# Calcify — Automated Deployment Pipeline

A functional calculator deployed using a full DevOps pipeline.

## Live URL

http://13.233.132.168:30080

## Tech Stack

- **App:** HTML, CSS, JavaScript
- **Containerization:** Docker + Nginx
- **Infrastructure:** Terraform (AWS EC2, VPC, Security Groups)
- **Configuration:** Ansible (microk8s, ArgoCD)
- **Orchestration:** Kubernetes (microk8s)
- **CI Pipeline:** GitHub Actions
- **CD Pipeline:** ArgoCD

## Deployment Steps

### 1. Dockerize

```bash
docker build -t ammar0990/calcify:latest .
docker push ammar0990/calcify:latest
```

### 2. Provision Infrastructure

```bash
cd terraform
terraform init
terraform apply
```

### 3. Configure EC2

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

### 4. Deploy to Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 5. CI/CD

- Push to main branch triggers GitHub Actions
- GitHub Actions builds and pushes Docker image
- ArgoCD automatically syncs cluster with latest manifests

## Repository Structure

```
Calcify/
├── Dockerfile
├── index.html
├── style.css
├── calculator.js
├── terraform/
├── ansible/
├── k8s/
├── argocd/
└── .github/workflows/
```
