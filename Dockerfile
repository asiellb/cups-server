FROM ubuntu:16.04
MAINTAINER Dave Burke "asiel.lb@gmail.com"

RUN apt-get --quiet update && apt-get --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages dist-upgrade

# Install Packages (basic tools, cups, basic drivers, HP drivers)
RUN apt-get install --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages \
    sudo \
    whois \
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
    hplip \
    smbclient \
    lib32tinfo5 \
    lib32z1 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Install others drivers
WORKDIR /tmp
RUN  wget https://download.brother.com/welcome/dlf101872/hl1200cupswrapper-3.0.1-1.i386.deb \
&& sudo dpkg  -i  --force-all hl1200cupswrapper-3.0.1-1.i386.deb \
&& wget https://download.brother.com/welcome/dlf101871/hl1200lpr-3.0.1-1.i386.deb \
&& sudo dpkg  -i  --force-all hl1200lpr-3.0.1-1.i386.deb

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

# Expose port
EXPOSE 631

# Default shell
CMD ["/usr/sbin/cupsd", "-f"]

