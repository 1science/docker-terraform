FROM python:3.6-slim

ENV TERRAFORM_VERSION=0.9.11

RUN apt-get update \
	&& apt-get install -y unzip curl ca-certificates libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /tmp/terraform \
    && cd /tmp/terraform \
    && curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > \
      terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform* /usr/local/bin/ \
    && rm -rf /tmp/terraform \
    && apt-get purge -y --auto-remove unzip
