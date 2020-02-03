FROM fedora:31

RUN dnf update -y

# basics
RUN dnf install -y \
git \
less \
openssh-clients

# network tools
RUN dnf install -y \
nmap \
nmap-ncat \
tcpdump \
iptables \
bind-utils \
net-tools \
mariadb 

# process tools
RUN dnf install -y \
procps-ng \
htop

# RUN echo "eval ssh-agent $SHELL" >> /root/.bashrc

COPY jump.sh /usr/bin/jump
COPY bashrc /root/.bashrc

ENTRYPOINT /bin/bash
