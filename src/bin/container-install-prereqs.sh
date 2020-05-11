#!/bin/bash

# =====================================
# install software packages needed for
# all the other components to run
# =====================================
# AUTHOR: jason.ross@nccgroup.com
# VERSION: 0.1.0
# =====================================
export DEBIAN_FRONTEND=noninteractive

WORKDIR=/root
TMPDIR=/tmp
cd ${TMPDIR}

echo -e "\n\nSoftware Pre-reqs Installation Starting...\n\n"


# =====================================
# set up the pre-reqs
# =====================================
apt-get update > /dev/null 2>&1
apt-get install -qy \
  apt-transport-https \
  apt-utils \
  ca-certificates \
  cmake \
  curl \
  dialog \
  gnupg \
  groff \
  less \
  lsb-release \
  nano \
  python3 \
  python3-pip \
  unzip \
  vim \
  virtualenv \
  virtualenvwrapper
 
echo -e "\n\nSoftware Pre-reqs Installation Complete!\n\n"
