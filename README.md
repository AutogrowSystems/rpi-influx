# rpi-influx

An Influx container for ARM

## Usage

To ensure you have permissions for the files in the data volume, pass your user ID into the `LOCAL_USER_ID` envvar:

    docker run --rm -it -e LOCAL_USER_ID=`id -u $USER` -p "8086:8086" -v influxdb:/var/lib/influxdb autogrow/rpi-influx
