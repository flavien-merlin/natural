# Python Flask Application Deployment on EKS with Terraform

This repository contains the necessary code and instructions to deploy a simple Python Flask "Hello World" application using Docker, create an Amazon Elastic Kubernetes Service (EKS) cluster using Terraform, and expose the Flask application using Helm charts, an Ingress controller, and a load balancer also managed with Terraform. 

## Prerequisites

Before you begin, ensure you have the following tools and accounts set up:

- [Docker](https://www.docker.com/get-started)
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with the necessary IAM permissions to create EKS clusters and other resources.

## Getting Started

Follow these steps to deploy the Python Flask application to EKS:

### 1. Clone the Repository

```shell
git clone <repository-url>
cd <repository-directory>
```

### 2. Build and Dockerize the Flask Application

Inside the repository directory, you will find a simple Python Flask application (`app.py`). Build a Docker image for this application:

```shell
docker build -t flask-app .
```

### 3. Deploy EKS Cluster with Terraform

Navigate to the `terraform` directory to create the EKS cluster:

```shell
cd terraform
```

1. Configure your AWS credentials:

   ```shell
   aws configure
   ```

2. Initialize Terraform:

   ```shell
   terraform init
   ```

3. Create the EKS cluster:

   ```shell
   terraform apply
   ```

Follow the on-screen prompts and wait for the Terraform script to create the cluster.

### 4. Expose the Flask Application with Terraform

Once the EKS cluster is created, we are also exposing the Flask application using Helm charts, an Ingress controller, and a load balancer as part of the terraform.

### 5. Access the Application

After Terraform finishes applying the resources, you will receive the endpoint URL for your Flask application. You can access your Flask application using this URL.

## Cleanup

To clean up and delete all the resources created in AWS and Kubernetes, you can use Terraform:

```shell
cd terraform
terraform destroy
```

## Conclusion

You have successfully deployed a simple Python Flask application on an EKS cluster using Docker and Terraform. You've also exposed the application using Helm charts, an Ingress controller, and a load balancer, making it accessible through an endpoint URL. Enjoy your Flask application running on EKS!
