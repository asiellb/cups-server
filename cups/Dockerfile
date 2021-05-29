FROM debian:buster-slim
LABEL Asiel Lara "asiel.lb@gmail.com"

RUN apt-get --quiet update && apt-get --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages dist-upgrade

# Install Packages (basic tools, cups, basic drivers, HP drivers)
RUN apt-get install --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages \
  sudo \
  whois \
  libcups2-dev \
  cups \
  cups-client \
  cups-bsd \
  cups-filters \
  foomatic-db-compressed-ppds \
  printer-driver-all \
  printer-driver-hpcups \
  openprinting-ppds \
  hpijs-ppds \
  hp-ppd \
  hplip

# Add user and disable sudo password checking
RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
  && sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

# Copy configuration file
COPY config/cupsd.conf /etc/cups/cupsd.conf

# Clean Packages
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

WORKDIR /root

# Expose port
EXPOSE 631

# Default shell
CMD ["/usr/sbin/cupsd", "-f"]


