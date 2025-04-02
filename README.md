📌 Overview

This project demonstrates how to containerize a simple web application using Docker and deploy it to Kubernetes using Minikube. The application serves a basic "Hello, World!" response.

🚀 Technologies Used

Docker - To containerize the web application

Kubernetes (Minikube) - To deploy the application

Express.js (Node.js) - Web server framework

🛠 Setup & Installation

1️⃣ Prerequisites

Ensure you have the following installed:

Docker

Minikube

Kubectl

2️⃣ Clone the Repository
git clone https://github.com/your-username/test-app.git
cd test-app

3️⃣ Build the Docker Image
docker build -t test-app .

4️⃣ Load the Image into Minikube
minikube image load test-app

🎯 Deploy to Kubernetes

1️⃣ Start Minikube
minikube start  

2️⃣ Deploy Application to Kubernetes
kubectl apply -f deployment.yaml

3️⃣ Verify the Deployment
kubectl get pods

✅ Verification

1️⃣ Check Logs of Running Application
kubectl logs -l app=web-app

2️⃣ Check Service & Get NodePort
kubectl get services

3️⃣ Access the Application Using Minikube
Option 1: Open in Browser
minikube service web-app-service

Option 2: Use Curl
curl http://$(minikube ip):<NodePort>

Option 3: Port Forwarding
If the NodePort isn't accessible, try port forwarding:
kubectl port-forward deployment/web-app 5000:5000