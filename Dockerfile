#Inspiration 1: DotCloud
#Inspiration 2: https://github.com/justnidleguy/
#Inspiration 3: https://bitbucket.org/xcgd/ubuntu4base

# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.19
MAINTAINER Arun T K <arun.kalikeri@xxxxxxxx.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# generate a locale
RUN locale-gen en_US.UTF-8 && update-locale 
RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# add some system packages
RUN  TERM=linux apt-get update &&  TERM=linux apt-get -y -q install \
        libterm-readline-perl-perl \
        dialog sudo curl less \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# To upgrade the OS in the image
RUN TERM=linux apt-get update && TERM=linux apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Clean up APT when done.
RUN TERM=linux apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
