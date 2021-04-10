# Utils on mimimalist base for debugging shells on k8s

# Start with Debian having only 89 packages
FROM debian:10-slim

# ARG SPARK_VER=2.4.6

WORKDIR /root
# ENV http_proxy http://172.16.17.4:3128
# ENV https_proxy http://172.16.17.4:3128

# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
# RUN  apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# Install goodies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && apt-get -y install \
    wget \
    curl \
    telnet \
    netcat \
    nmap \
    finger \
    jq \
    htop \
    python3 \
    dnsutils \
    iproute2 \
    iputils-ping \
    iputils-arping \
    iputils-tracepath \
    net-tools \
    openssh-client \
    sudo \
&& useradd -m -s /bin/bash -G users,sudo gregj


# Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
RUN rm -rf /root/* && chmod 755 /root



USER gregj
WORKDIR /home/gregj
# CMD ["notebook", "--no-browser", "--ip=0.0.0.0", "--port=8888"]
# ENTRYPOINT ["/bin/bash"]
