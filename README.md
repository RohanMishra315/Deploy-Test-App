# 🌍 Web Application Deployment Using Docker & Kubernetes

## 📌 Overview
This project demonstrates how to containerize a simple web application using **Docker** and deploy it to **Kubernetes** using **Minikube**. The application serves a basic **"Hello, World!"** response.

---

## 🚀 Technologies Used
✅ **Docker** - To containerize the web application  
✅ **Kubernetes (Minikube)** - To deploy the application  
✅ **Express.js (Node.js)** - Web server framework  
✅ **Kubectl** - CLI tool for Kubernetes  

---

## 🛠 Setup & Installation
### **1️⃣ Prerequisites**
Ensure you have the following installed:
- [Docker](https://www.docker.com/get-started)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/your-username/test-app.git
cd test-app
```

### **3️⃣ Build the Docker Image**
```sh
docker build -t test-app .
```

### **4️⃣ Load the Image into Minikube**
```sh
minikube image load test-app
```

---

## 🎯 Deploy to Kubernetes
### **1️⃣ Start Minikube**
```sh
minikube start
```

### **2️⃣ Deploy Application to Kubernetes**
```sh
kubectl apply -f deployment.yaml
```

### **3️⃣ Verify the Deployment**
Check the running pods:
```sh
kubectl get pods
```
Expected Output:
```
NAME                       READY   STATUS    RESTARTS   AGE
web-app-59b5758c55-j6ptf   1/1     Running   0          10s
web-app-59b5758c55-nxfzh   1/1     Running   0          13s
```

---

## ✅ Verification
### **1️⃣ Check Logs of Running Application**
```sh
kubectl logs -l app=web-app
```

### **2️⃣ Check Service & Get NodePort**
```sh
kubectl get services
```
Expected Output:
```
NAME              TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
web-app-service   NodePort   10.100.200.50    <none>        80:30817/TCP   5m
```
**Note:** The **NodePort** in the output is `30817` (this may vary). Use this in the next step.

### **3️⃣ Access the Application Using Minikube**
#### **Option 1: Open in Browser**
```sh
minikube service web-app-service
```

#### **Option 2: Use Curl**
```sh
curl http://$(minikube ip):<NodePort>
```
Example:
```sh
curl http://$(minikube ip):30817
```
Expected Output:
```
Hello, World!
```

#### **Option 3: Port Forwarding**
If the NodePort isn't accessible, try port forwarding:
```sh
kubectl port-forward deployment/web-app 5000:5000
```
Then open [http://localhost:5000](http://localhost:5000) in your browser.

---


