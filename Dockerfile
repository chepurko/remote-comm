FROM debian:8

RUN apt-get update && apt-get install -y \
    vim \
    git \
    ca-certificates \
    curl \
    lynx \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*
    
RUN cd /usr/local/src && \
    curl -O https://github.com/kubernetes/kubernetes/releases/download/v1.6.0/kubernetes.tar.gz && \
    echo "e89318b88ea340e68c427d0aad701e544ce2291195dc1d5901222e7bae48f03b kubernetes.tar.gz" | sha256sum -c && \
    tar -xvf kubernetes.tar.gz && \
    printf '# Add kubectl to path\n\
      export PATH=/usr/local/src/kubernetes/platforms/linux/amd64:$PATH'\
      >> /etc/profile.d/path-kubectl.sh
