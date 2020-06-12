# aws-eks
This repository is for my own educational purposes. 

It contains Terraform infrastructure definition to create an [AWS Elastic Kubernetes Service cluster](https://aws.amazon.com/eks/). 

[Terraform Cloud](https://www.terraform.io/) manages infrastructure state.

Steps:
1. Create version control repository

2. Get set up on [Terraform Cloud](https://www.terraform.io/):
    - create account
    - create workspace
    - link the workspace to version control system repository
    - define variables

3. Push code to the version control repository to trigger a Terraform run which will create AWS resources:
    - virtual private cloud
    - subnets
    - iam role
    - elastic kubernetes service cluster
    - node group
    
4. [Configure access to the new elastic kubernetes service cluster](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

5. [Create an ingress controller so we can use the ingress resources on our cluster](https://github.com/kubernetes-sigs/aws-alb-ingress-controller)
    
6. [Set up authorization to access your Docker registry from Kubernetes](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)
    
- TODO
    - route table and internet gateway association in terraform
