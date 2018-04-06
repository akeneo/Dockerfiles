FROM debian:stretch-slim
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main">> /etc/apt/sources.list && \
    apt-get update && apt-get install -y python gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&\
    apt-get update && apt-get install -y ansible 
