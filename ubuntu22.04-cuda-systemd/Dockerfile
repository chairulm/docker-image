FROM chairulfm/ubuntu22.04-cuda-fake-systemctl

# Make sure sshd directory exists
RUN mkdir -p /var/run/sshd

# Expose SSH port
EXPOSE 22

# Run sshd in foreground as PID 1 (instead of systemctl)
CMD ["/usr/sbin/sshd", "-D"]
