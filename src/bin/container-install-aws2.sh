#!/bin/bash

# =====================================
# container-scoutsuite-install.sh
# =====================================
# AUTHOR: jason.ross@nccgroup.com
# VERSION: 0.0.21
# =====================================

WORKDIR=${HOME}
TMPDIR=/tmp
AWSDIR=${HOME}/.aws

echo -e "\n\nAWS2 CLI Installation Starting...\n\n"

# =====================================
# install AWS CLI v2
# =====================================
cd ${TMPDIR}
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# =====================================
# clean up install artifacts
# =====================================
rm ${TMPDIR}/awscliv2.zip
rm -rf ${TMPDIR}/aws

# =====================================
# Setup AWS configuration templates
# =====================================
mkdir ${AWSDIR}

# create the config template
cat <<'EOF' >${AWSDIR}/config
[default]
region = us-east-1
output = json
EOF

# create the credentials template
cat <<'EOF' >${AWSDIR}/credentials
[default]
aws_access_key_id = <access-key>
aws_secret_access_key = <secret key>
EOF

echo -e "\n\nAWS2 CLI Installation Complete!\n\n"
