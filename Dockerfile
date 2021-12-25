FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

LABEL org.opencontainers.image.source="https://github.com/scholzj/java-base-image" \
      summary="Java Base Image" \
      description="Base container for running Java application"

RUN microdnf update \
    && microdnf install java-11-openjdk-headless openssl shadow-utils \
    && microdnf clean all

ENV JAVA_HOME /usr/lib/jvm/jre-11

# Copy scripts for starting Java apps
COPY scripts/* /bin/