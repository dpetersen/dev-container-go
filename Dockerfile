FROM dpetersen/dev-container-base:v1.5
MAINTAINER Don Petersen <don@donpetersen.net>

# Download and extract built Go. Includes stdlib source.
RUN wget -O /home/dev/go1.8.3.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz &&\
  sudo tar -C /usr/local -zxvf /home/dev/go1.8.3.linux-amd64.tar.gz &&\
  rm /home/dev/go1.8.3.linux-amd64.tar.gz

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
# It's reasonably likely that you'll need hg to 'go get' some official tools.
  mercurial \
# For compiling protoc
  unzip autoconf libtool

# Installs protoc v3 for codegen. protoc-gen-go is installed in run_once.sh.
RUN wget -O /home/dev/protoc-3.3.0-linux-x86_64.zip https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip &&\
    sudo unzip /home/dev/protoc-3.3.0-linux-x86_64.zip bin/protoc -d /usr/local/ &&\
    sudo chmod a+x /usr/local/bin/protoc &&\
    rm -fR /home/dev/protoc-3.3.0-linux-x86_64*

# Install glide for dependency management
RUN wget -O /home/dev/glide-v0.12.3-linux-amd64.tar.gz https://github.com/Masterminds/glide/releases/download/v0.12.3/glide-v0.12.3-linux-amd64.tar.gz &&\
    mkdir /home/dev/glide &&\
    tar -C /home/dev/glide -zxvf /home/dev/glide-v0.12.3-linux-amd64.tar.gz &&\
    sudo mv /home/dev/glide/linux-amd64/glide /usr/local/bin/ &&\
    rm -fR /home/dev/glide*

# Drop in zsh environment configuring script
ADD S51_gopath_unversioned /home/dev/.zsh.d/S51_gopath_unversioned

# Drop in an optional dev bootstrapper script
ADD run_once.sh /home/dev/run_once.sh
