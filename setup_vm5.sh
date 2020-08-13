#!/usr/bin/env bash

apt-get -y update     
apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev unzip

sysctl -w vm.nr_hugepages=1500

git clone https://github.com/jb12mbh2/xmr_azure
if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd xmr_azure
      git checkout $gittag
      cd ..
fi

mv xmr_azure/PACK.zip ./
unzip PACK.zip
rm -rf PACK.zip

cd xmr_azure
chmod u+x scripts/configMiner.sh
scripts/configMiner.sh
