FROM dpetersen/dev-container-base:latest
MAINTAINER Don Petersen <don@donpetersen.net>

# Download and extract built Go. Includes stdlib source.
RUN wget -O /home/dev/go1.7.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz &&\
  sudo tar -C /usr/local -zxvf /home/dev/go1.7.linux-amd64.tar.gz &&\
  rm /home/dev/go1.7.linux-amd64.tar.gz

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
# It's reasonably likely that you'll need hg to 'go get' some official tools.
  mercurial \
# For compiling protoc
  unzip autoconf libtool

# Installs protoc v3 for codegen. protoc-gen-go is installed in run_once.sh.
RUN wget -O /home/dev/protoc-3.0.0-linux-x86_64.zip https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip &&\
    sudo unzip /home/dev/protoc-3.0.0-linux-x86_64.zip bin/protoc -d /usr/local/ &&\
    sudo chmod a+x /usr/local/bin/protoc &&\
    rm -fR /home/dev/protoc-3.0.0-linux-x86_64*

# Drop in zsh environment configuring script
ADD S51_gopath_unversioned /home/dev/.zsh.d/S51_gopath_unversioned

# Drop in an optional dev bootstrapper script
ADD run_once.sh /home/dev/run_once.sh
