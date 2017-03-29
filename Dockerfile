FROM debian:8

RUN apt-get update && apt-get install -y \
    vim \
    git \
    
RUN cd /usr/local/src && \
    curl -O https://github.com/kubernetes/kubernetes/releases/download/v1.6.0/kubernetes.tar.gz && \
    echo "e89318b88ea340e68c427d0aad701e544ce2291195dc1d5901222e7bae48f03b kubernetes.tar.gz" | sha256sum -c && \
    tar -xvf kubernetes.tar.gz && \
    cat << EOF > /etc/profile.d/path-kubectl.sh
      # Add kubectl to path
      export PATH=/usr/local/src/kubernetes/platforms/linux/amd64:$PATH
      EOF
    
