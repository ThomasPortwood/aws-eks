# kube-airflow
Terraform infrastructure definition for AWS Elastic Kubernetes Service cluster

Steps:
1. Create AWS resources with terraform
    - virtual private cloud
    - subnets
    - iam role
    - elastic kubernetes service cluster
    - node group
    
2. Configure local kubeconfig for the new elastic kubernetes service cluster
    - https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html

3. Create alb ingress controller so we can use the ingress resource on our cluster
    - https://github.com/kubernetes-sigs/aws-alb-ingress-controller
    
- TODO
    - add commands to this readme to make it more useful
    - route table and internet gateway association in terraform
    - database security group via terraform