#!/bin/bash

# =====================================
# AUTHOR: jason.ross@nccgroup.com
# VERSION: 0.1.0
# =====================================
export DEBIAN_FRONTEND=noninteractive

WORKDIR=/root
TMPDIR=/tmp
IBMDIR=/root/.bluemix

echo -e "\n\nIBM Cloud CLI Installation Starting...\n\n"

# =====================================
# install IBM Cloud CLI
# =====================================
cd ${TMPDIR}
curl "https://download.clis.cloud.ibm.com/ibm-cloud-cli/1.2.3/IBM_Cloud_CLI_1.2.3_amd64.tar.gz" -o "ibmcli.tgz"
tar xvf ibmcli.tgz
cd ${TMPDIR}/Bluemix_CLI
./install


# install common CLI plugins
plugins=(\
"container-registry" \
"container-service" \
"cloud-functions" \
"cloud-databases" \
"cloud-object-storage" \
"cloud-dns-services" \
"push-notifications" \
)

for plugin in ${plugins[@]}; do
  echo -e "Installing plugin: ${plugin}"
  ibmcloud plugin install ${plugin} -f
done
