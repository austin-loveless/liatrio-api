# Kubernetes Helm Charts

Kubernetes is managed enirely by Helm.

## Chart

This project has a single API chart used to deploy a `dev` and `prod` version. You can determine which version values to use by added the flag `-f values-<env>.yaml`

#### Commands:

- First setup helm chart: `helm install api -f values-<env>.yaml`
- Deploy new versions of chart: `helm upgrade api -f values-<env>.yaml`
- Delete chart: `helm uninstall api`

### Helpful commands for testing Application:

- Connect to EKS cluster: `aws eks update-kubeconfig --region us-east-1 --name eks-cluster-liatrio-<ENV> --profile <profile>`
- Test svc: `kubectl run curl-test --image=radial/busyboxplus:curl -i --tty --rm --restart=Never -- curl <SERVICE_IP>`

## EKS Load Balancer

When deploying the EKS load balancer make sure you deploy the resources in this order:

1. `/templates/elb/cert-manager-crds.yaml`
2. `/templates/elb/cert-manager.yaml`
3. `/templates/elb/controller.yaml`
4. `/templates/elb/ingress-class.yaml`
5. `/templates/ingress.yaml`

This will require multiple releases to get the prod and dev environments intialized
