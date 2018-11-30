locals {
  deployment = <<EOF
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: blueocean-master
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: blueocean
    spec:
      containers:
        - name: proxy
          image: nginx:1.15.7
          ports:
          - containerPort: 80
        - name: blueocean
          image: jenkinsci/blueocean:1.9.0
          ports:
          - containerPort: 8080
EOF
}
