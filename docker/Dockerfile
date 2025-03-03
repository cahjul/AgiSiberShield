FROM ubuntu:latest
RUN apt update && apt install -y snort ufw fail2ban
COPY scripts/agi-linux.sh /usr/local/bin/harden-linux.sh
RUN chmod +x /usr/local/bin/harden-linux.sh
CMD ["/usr/local/bin/harden-linux.sh"]
