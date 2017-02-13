FROM autogrow/rpi-golang

WORKDIR /tmp

RUN apk --update add tar

RUN curl -LO https://dl.influxdata.com/influxdb/releases/influxdb-1.2.0_linux_armhf.tar.gz
RUN tar -xvzf influxdb-1.2.0_linux_armhf.tar.gz  -C / --strip-components=2 --show-transformed-names
RUN rm influxdb-1.2.0_linux_armhf.tar.gz

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-armhf" \
    && chmod +x /usr/local/bin/gosu

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/var/lib/influxdb", "/var/log/influxdb"]

EXPOSE 8083 8086

ENTRYPOINT "/entrypoint.sh"
CMD ["influxd"]
