FROM ubuntu:20.10 AS prereqs

LABEL maintainer="Jason Ross <jason.ross@nccgroup.com>"

ARG VCS_REF
ARG VCS_URL
ARG VERSION
ARG BUILD_DATE
ARG VENDOR
ARG NAME
ARG DESCRIPTION
ARG DEBIAN_FRONTEND=noninteractive

# Build-time metadata as defined at http://label-schema.org
LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name=$NAME \
    org.label-schema.description=$DESCRIPTION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vendor=$VENDOR \
    org.label-schema.version=$VERSION

COPY ./bin/container-install-prereqs.sh /tmp

# install the software pre-reqs
RUN ["/bin/bash", "-c","/tmp/container-install-prereqs.sh"]

# install AWS2
FROM prereqs AS aws2
COPY ./bin/container-install-aws2.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-aws2.sh"]

# install Azure CLI
FROM aws2 AS azure
COPY ./bin/container-install-azure.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-azure.sh"]

# install gCloud SDK
FROM azure AS gcloud
COPY ./bin/container-install-gcp.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-gcp.sh"]

# install gCloud SDK
FROM gcloud AS ibmcloud
COPY ./bin/container-install-ibmcloud.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-ibmcloud.sh"]

# install Scoutsuite
FROM ibmcloud AS scoutsuite
COPY ./bin/container-install-prereqs.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-scoutsuite.sh"]

# Add container security checks to make sure we're solid
# This currently fails in the autobuild, so leaving it out for now
# FROM scoutsuite as secscan
# ADD https://get.aquasec.com/microscanner .
# RUN chmod +x microscanner
# RUN ["./microscanner ${AQUA_TOKEN"]

# set up the venv and leave users with a helpful login message
FROM scoutsuite AS final
RUN ["/bin/bash", "-c", "/root/bin/container-set-motd.sh"]

# entrypoint
CMD ["/bin/bash"]
