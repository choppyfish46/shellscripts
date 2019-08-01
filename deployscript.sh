#!/usr/bin/env bash

infra_repo="git@bitbucket.org:rochedis/dp-common-infra.git"
infra_branch="develop"
manifests_repo="git@bitbucket.org:rochedis/dp-deployment-manifests.git"
manifests_branch="develop"
manifests_dir="manifests"
config_set_name="nonprod-base-deployment"
ecs_cluster_repo='git@bitbucket.org:rochedis/platform-services-cluster.git'
ecs_cluster_branch="develop"
ecs_cluster_dir="ecs_cluster"

product_name="empty"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo '----------'
echo $script_dir
echo '--------'
cd ..

echo 'creating tmp directory'
mkdir -p -- tmp && cd tmp
echo 'in the tmp directory'
echo 'deleting  files and folders from tmp directory'
rm -rf *
echo 'cloning infra repo'
git clone -b $infra_branch $infra_repo
echo 'creating manifests directory'
mkdir -p -- $manifests_dir && cd $manifests_dir
echo 'cloning manifest repo'
git clone -b $manifests_branch $manifests_repo
c_set=/$manifests_dir/config-sets/$config_set_name.yml

echo 'out file path is '$c_set


echo '++++++++++++++++++++++++++++++'
echo --------$product_name
cd ..

mkdir -p -- $ecs_cluster_dir && cd $ecs_cluster_dir
git clone -b $ecs_cluster_branch  $ecs_cluster_repo

PWD
cd $script_dir
cd ..
PWD
cp -R venv  tmp
tar -czvf package-deployment.tar.gz tmp/  
cp package-deployment.tar.gz out

