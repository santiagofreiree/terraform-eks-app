This is a complete implementation of creating an EKS AWS cluster with Terraform using one EC2 node. For greater security, the worker node is inside a private network, without a public IP. The worker node reaches the Internet by means of a NAT Gateway. Two private VPC networks are created, as well as two public VPC networks, needed to provide Internet access for the cluster.

The necessary IAM roles and network policies are also created by Terraform, including the necessary ALB role, which allows the cluster to create the Internet-facing ALB. The modern Gateway API Kubernetes implementation, which replaces Ingress, is implemented. In the implementation, you can notice that annotations are not needed to create the ALB, because now you have to create the LoadBalancerConfiguration custom resource and TargetGroupConfiguratio, which includes the configurations needed to run the ALB with Internet-facing access.

In the folder kubernetes/global are the YAML files which are common to all customers, which include StorageClass, Gateway, and LoadBalancer configuration. Inside kubernetes/base you can find the Kustomize base files which will be used to deploy the accounting system to all customers. An example of the customizations for a customer is found in the chapter kubernetes/customer1. Each app runs with a security context, using its own user, and the necessary network policies are applied.

How can you create the cluster:

terraform init
terraform plan
terraform apply

Then run:
intall.sh

Yo will have running EKS cluster with ALB working for the modern Gateway API which replace ingress controler.

Santiago Freire 
