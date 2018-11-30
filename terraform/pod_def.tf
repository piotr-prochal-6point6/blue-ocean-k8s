locals {
  blue_ocean = <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: blueocean-master
  labels:
    app: blueocean
spec:
  containers:
    - name: nginx-proxy
      image: nginx:1.15.7
      ports:
      - containerPort: 80
    - name: blueocean-master
      image: jenkinsci/blueocean:1.9.0
      ports:
      - containerPort: 8080
EOF
}
