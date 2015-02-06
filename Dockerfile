FROM dpetersen/dev-container-base:latest
MAINTAINER Don Petersen <don@donpetersen.net>

# Download, compile, and install Go
RUN git clone --branch go1.4.1 https://github.com/golang/go.git /root/go && \
  cd /root/go/src && \
  ./all.bash && \
  cp /root/go/bin/go /usr/local/bin/

# Drop in zsh environment configuring script
ADD S51_gopath_unversioned /root/.zsh.d/S51_gopath_unversioned

# Drop in an optional dev bootstrapper script
ADD run_once.sh /root/run_once.sh
