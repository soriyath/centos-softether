FROM soriyath/centos-swissfr
MAINTAINER Sumi Straessle

# SoftEther build dependencies
RUN yum install -y binutils chkconfig zlib binutils readline openssl ncurses libevent ncurses-devel openssl-devel readline-devel

# Compile SoftEther
WORKDIR /usr/local/src
RUN git clone --depth=1 https://github.com/SoftEtherVPN/SoftEtherVPN.git
WORKDIR /usr/local/src/SoftEtherVPN
RUN ./configure <<< $'1\n2\n' \
	&& make \
	&& make install \
	&& cd .. \
	&& rm -rf SoftEtherVPN

ADD softether.sv.conf /etc/supervisor/conf.d/softether.sv.conf

EXPOSE 1194/udp 5555/tcp 1701/tcp 4500/udp 500/udp

# default command
CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]
