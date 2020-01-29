#!/bin/bash

# =====================================
# install ScoutSuite into a virtual env
# =====================================
# AUTHOR: jason.ross@nccgroup.com
# VERSION: 0.0.21
# =====================================

WORKDIR=${HOME}
TMPDIR=/tmp

# =====================================
# install ScoutSuite
# =====================================
cd ${WORKDIR}
virtualenv -p python3 scoutsuite
source ${WORKDIR}/scoutsuite/bin/activate
pip install scoutsuite

echo -e "\n\nScoutsuite Installation Complete!\n\n"
