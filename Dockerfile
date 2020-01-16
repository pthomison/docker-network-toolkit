FROM fedora:31

RUN dnf update -y

# basics
RUN dnf install -y \
git \
less

# network tools
RUN dnf install -y \
nmap \
nmap-ncat \
tcpdump \
iptables \
bind-utils
