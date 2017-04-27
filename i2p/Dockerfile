FROM ubuntu:latest

LABEL maintainer "development@fuentescapella.com"

# disable interactive debconf mode
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update base system
RUN apt-get -y update

# install apt-utils to avoid further errors while package install
RUN apt-get -y install apt-utils

# install pidgin
RUN apt-add-repository ppa:i2p-maintainers/i2p

# update base system, now that we have the repository
RUN apt-get -y update

# install i2p
RUN apt-get -y install i2p

# set timezone and locale
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure -f noninteractive locales
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

#RUN useradd -m user 
#USER 

ENTRYPOINT ["bash"]
