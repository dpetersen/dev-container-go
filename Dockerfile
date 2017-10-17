FROM dpetersen/dev-container-base:v1.5
MAINTAINER Don Petersen <don@donpetersen.net>

# Download and extract built Go. Includes stdlib source.
RUN wget -O /home/dev/go1.9.1.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz &&\
  sudo tar -C /usr/local -zxvf /home/dev/go1.9.1.linux-amd64.tar.gz &&\
  rm /home/dev/go1.9.1.linux-amd64.tar.gz

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
# For compiling protoc
  unzip autoconf libtool

ENV PROTOC_VERSION=3.4.0
# Installs protoc for codegen. protoc-gen-go is installed in run_once.sh.
RUN wget -O /home/dev/protoc-$PROTOC_VERSION-linux-x86_64.zip https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip &&\
    sudo unzip /home/dev/protoc-$PROTOC_VERSION-linux-x86_64.zip bin/protoc -d /usr/local/ &&\
    sudo chmod a+x /usr/local/bin/protoc &&\
    rm -fR /home/dev/protoc-$PROTOC_VERSION-linux-x86_64*

# Installs dep for dependency management
RUN sudo wget -O /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.3.1/dep-linux-amd64 &&\
    sudo chmod a+x /usr/local/bin/dep

# Drop in zsh environment configuring script
ADD S51_gopath_unversioned /home/dev/.zsh.d/S51_gopath_unversioned

# Drop in an optional dev bootstrapper script
ADD run_once.sh /home/dev/run_once.sh
