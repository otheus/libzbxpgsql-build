FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get -q update \
  && apt-get -y install wget libpq5 libconfig9 \
  && wget -nv http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb \
  && dpkg -i zabbix-release_2.4-1+trusty_all.deb \
  && apt-get -q update \
  && apt-get -y install zabbix-agent zabbix-get \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
