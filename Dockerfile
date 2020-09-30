
FROM ubuntu:20.04

RUN chmod 777 /tmp && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install wget gpg && \
    wget -O - https://qgis.org/downloads/qgis-2020.gpg.key | gpg --import && \
    gpg --export --armor F7E06F06199EF2F2 | apt-key add - && \
    echo 'deb http://qgis.org/ubuntu focal main' > /etc/apt/sources.list.d/ubuntu-qgis.list

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y qgis-server xvfb && \
    apt-get clean

CMD ["/usr/bin/xvfb-run", "/usr/bin/qgis_mapserver"]
