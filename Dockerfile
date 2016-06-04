# Piper Dockerfile
#
# https://github.com/dockerfile/piper

# This Dockerfile installs Piper (PiperPushCache) in /opt/piper, sets up
# simlinks from /usr/local/bin to both piper and mill. This docker setup places
# the configuration file, pages, flows, log file under the /piper directory. It
# attempts to copy locals data with the same names to those locations.

FROM ubuntu:14.04

# Install Piper.

# Fetching and untaring the Piper binary.
RUN \
  apt-get update && \
  apt-get install -y wget && \
  cd /tmp && \
  wget http://www.piperpushcache.com/downloads/piper-latest_ubuntu-14.04.tar.gz && \
  tar xvzf piper-latest_ubuntu-14.04.tar.gz

# Moving the Piper directory to /opt and setting up simlinks in /usr/local/bin
RUN \
  mkdir -p /opt && \
  mv /tmp/piper /opt && \
  ln -s /opt/piper/bin/piper /usr/local/bin/piper && \
  ln -s /opt/piper/bin/mill /usr/local/bin/mill

# Create a working directory.
RUN \
  mkdir -p /piper
  
# Make directory mountable.
VOLUME ["/piper"]

WORKDIR /piper

# Copy configuration file to the container along with flows and pages.
COPY ./piper_cfg.json /piper
COPY ./pages /piper
COPY ./flows /piper

# default command
ENTRYPOINT ["piper"]
CMD ["--config", "/piper/piper_cfg.json"]
#CMD ["--help"]

# Expose ports.
#EXPOSE 8080
EXPOSE 7660

# docker run -p 7660:7660 -d --name piper piper:latest
