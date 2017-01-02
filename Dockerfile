FROM ubuntu:14.04

CMD ["/etc/service/vpnc/run"]

RUN apt-get update -y && apt-get install -y iptables

# Install Fortinet-compatible vpnc
COPY vpnc_0.5.3r512-2ubuntu2_amd64.deb /root
RUN dpkg -i /root/vpnc_0.5.3r512-2ubuntu2_amd64.deb

# Setup vpnc service
RUN mkdir -p /etc/service/vpnc
COPY bin/vpnc.sh /etc/service/vpnc/run

# Clean up
RUN apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
