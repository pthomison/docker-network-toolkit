FROM fedora:31

RUN dnf update -y

RUN dnf install -y \
nmap \
nmap-ncat \
tcpdump