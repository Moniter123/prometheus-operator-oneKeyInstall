#!/bin/sh

# Author: Lowry
# Time: 2018/10/14

namespace="monitoring"			# TODO(可选)
image_registry="dr.edit.io\/k8s"    	# TODO(必须)

nfs_host="10.18.11.12"			# TODO(必须)
nfs_dir="\/opt\/prometheus"		# TODO(必须)

# -------------------------------------
# create namespace
#kubectl create namespace $namespace
sleep 2

function editImage()
{
    sed -i "s/namespace: monitoring/namespace: $namespace/g" grafana-pvc.yaml
    sed -i "s/namespace: monitoring/namespace: $namespace/g" prometheus-pvc.yaml
    sed -i "s/namespace: monitoring/namespace: $namespace/g" prometheus-operator-base.yaml
    sed -i "s/namespace: monitoring/namespace: $namespace/g" manifests/*
    sed -i "s/quay.io\/coreos/$image_registry/g" prometheus-operator-base.yaml
    sed -i "s/quay.io\/coreos/$image_registry/g" manifests/*
    sed -i "s/quay.io\/prometheus/$image_registry/g" manifests/*
    sed -i "s/image: grafana/image: $image_registry/g" manifests/grafana-deployment.yaml
}

# instead .yaml registry address(TODO)
#editImage
sleep 2

# create pv and pvc(TODO)
#sed -i "s/127.0.0.1/$nfs_host/g" ./prometheus-pvc.yaml
#sed -i "s/127.0.0.1/$nfs_host/g" ./grafana-pvc.yaml
#sed -i "s/\/opt\/nfsserver/$nfs_dir/g" ./prometheus-pvc.yaml
#sed -i "s/\/opt\/nfsserver/$nfs_dir/g" ./grafana-pvc.yaml
#kubectl create -f ./prometheus-pvc.yaml
#kubectl create -f ./grafana-pvc.yaml
sleep 2

# install promethes-operator(TODO)
#kubectl create -f prometheus-operator-base.yaml
sleep 2

# install all .yaml(TODO)
#kubectl create -f manifests
sleep 2

# check install result


exit 0
