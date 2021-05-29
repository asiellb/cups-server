FROM asiellb/cups:latest
LABEL Asiel Lara "asiel.lb@gmail.com"

RUN apt-get --quiet update && apt-get --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages dist-upgrade

# Install HL-1200 drivers and dependencies
WORKDIR /tmp
RUN wget https://download.brother.com/welcome/dlf101872/hl1200cupswrapper-3.0.1-1.i386.deb \
    && sudo dpkg  -i  --force-all hl1200cupswrapper-3.0.1-1.i386.deb \
    && wget https://download.brother.com/welcome/dlf101871/hl1200lpr-3.0.1-1.i386.deb \
    && sudo dpkg  -i  --force-all hl1200lpr-3.0.1-1.i386.deb

RUN apt-get update \
    && apt-get install --assume-yes \
    libtinfo5 \
    lib32z1

# Clean Packages
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

WORKDIR /root
