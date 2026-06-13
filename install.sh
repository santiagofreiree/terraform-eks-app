#!/bin/bash
kubectl create namespace development
kubectl apply -f /home/santiago/project-sysmarket/base/gitlab-secrets.yaml
kubectl apply -f ./kubernetes/global/aws-storageclass.yaml
kubectl apply --server-side=true -f https://github.com/kubernetes-sigs/gateway-api/releases/download/monthly-2026.05/monthly-2026.05-install.yaml
helm repo add eks https://aws.github.io/eks-charts
helm repo update
kubectl create namespace aws-lb
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n aws-lb --set clusterName=eks-dep --set serviceAccount.create=true --set serviceAccount.name=aws-load-balancer-controller --set vpcId=$(terraform output -raw vpc_id) --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=$(terraform output -raw alb_controller_role_arn)  --set region=us-east-1
kubectl apply -f ./kubernetes/global/lbconfig.yaml 
kubectl apply -f ./kubernetes/global/lbtarget.yaml
kubectl -n kube-system rollout restart aws-load-balancer-controller
kubectl apply -f ./kubernetes/global/gatewayclass.yaml
kubectl apply -f ./kubernetes/global/gateway.yaml
