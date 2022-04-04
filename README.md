helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install --values values.yaml --values ../../../secrets/argo/secrets.yaml  argo argo/argo-cd


kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo


kubectl port-forward svc/argocd-server 8080:443

kubectl port-forward svc/argo-argocd-server 8080:443
