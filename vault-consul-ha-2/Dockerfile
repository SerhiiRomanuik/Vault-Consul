FROM ubuntu:16.04

ENV VAULT_VERSION=1.3.0 \
  CONSUL_VERSION=1.6.2

RUN apt-get update \
  && apt-get install -y \
  build-essential \
  curl \
  wget \
  nano \
  net-tools \
  iputils-ping \
  dnsutils \
  zip \
  unzip \
  && wget -O /tmp/vault.zip "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/vault.zip \
  && chmod 755 /bin/vault \
  && rm /tmp/vault.zip \
  && wget -O /tmp/consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/consul.zip \
  && chmod 755 /bin/consul \
  && rm /tmp/consul.zip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
