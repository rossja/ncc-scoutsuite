FROM ubuntu:20.04 AS build

LABEL maintainer="Jason Ross <jason.ross@nccgroup.com>"

ARG VCS_REF
ARG VCS_URL
ARG VERSION
ARG BUILD_DATE
ARG VENDOR
ARG NAME
ARG DESCRIPTION

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

COPY ./bin /root/bin

# install the software pre-reqs
RUN ["/bin/bash", "-c","/root/bin/container-install-prereqs.sh"]

# install AWS2
RUN ["/bin/bash", "-c", "/root/bin/container-install-aws2.sh"]

# install Azure CLI
RUN ["/bin/bash", "-c", "/root/bin/container-install-azure.sh"]

# install gCloud SDK
RUN ["/bin/bash", "-c", "/root/bin/container-install-gcp.sh"]

# install ScoutsuiteA
FROM build as scoutsuite
RUN ["/bin/bash", "-c", "/root/bin/container-install-scoutsuite.sh"]

# set up a helpful login message
RUN ["/bin/bash", "-c", "/root/bin/container-set-motd.sh"]

# ADD https://get.aquasec.com/microscanner .
# RUN chmod +x microscanner
# RUN ["./microscanner NTM2NTEzM2RkYjU2"]

# entrypoint
CMD ["/bin/bash"]
