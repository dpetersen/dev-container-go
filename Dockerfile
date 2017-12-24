FROM dpetersen/dev-container-base:v1.7
MAINTAINER Don Petersen <don@donpetersen.net>

# Download and extract built Go. Includes stdlib source.
ENV DEV_CONTAINER_GO_VERSION=go1.9.2
RUN wget -O /home/dev/$DEV_CONTAINER_GO_VERSION.linux-amd64.tar.gz https://storage.googleapis.com/golang/$DEV_CONTAINER_GO_VERSION.linux-amd64.tar.gz &&\
  sudo tar -C /usr/local -zxvf /home/dev/$DEV_CONTAINER_GO_VERSION.linux-amd64.tar.gz &&\
  rm /home/dev/$DEV_CONTAINER_GO_VERSION.linux-amd64.tar.gz

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
# For compiling protoc
  unzip autoconf libtool

# Installs protoc for codegen. protoc-gen-go is installed in run_once.sh.
ENV PROTOC_VERSION=3.5.1
RUN wget -O /home/dev/protoc-$PROTOC_VERSION-linux-x86_64.zip https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip &&\
    sudo unzip /home/dev/protoc-$PROTOC_VERSION-linux-x86_64.zip bin/protoc -d /usr/local/ &&\
    sudo chmod a+x /usr/local/bin/protoc &&\
    rm -fR /home/dev/protoc-$PROTOC_VERSION-linux-x86_64*

# Installs dep for dependency management
ENV DEP_VERSION=v0.3.2
RUN sudo wget -O /usr/local/bin/dep https://github.com/golang/dep/releases/download/$DEP_VERSION/dep-linux-amd64 &&\
    sudo chmod a+x /usr/local/bin/dep

# Drop in zsh environment configuring script
ADD S51_gopath_unversioned /home/dev/.zsh.d/S51_gopath_unversioned

# Drop in an optional dev bootstrapper script
ADD run_once.sh /home/dev/run_once.sh
