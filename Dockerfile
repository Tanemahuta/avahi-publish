FROM alpine:3.20

LABEL org.label-schema.schema-version = "1.0"\
      org.label-schema.name="avahi-publish"\
      org.label-schema.description="image providing avahi-publish for zeroconf"\
      org.label-schema.vcs-url="https://github.com/Tanemahuta/avahi-lb"\
      org.label-schema.docker.cmd="docker run -v /var/run/dbus:/var/run/dbus publish-hostname.local 192.168.0.1"\
      maintainer="Christian Heike<christian.heike@icloud.com>"

# D-Bus socket directory
VOLUME /var/run/dbus

# Add the avahi-tools containing avahi-publish
RUN apk add --no-cache avahi-tools=0.8-r17

# Entrypoint is the publish command for an address
ENTRYPOINT ["/usr/bin/avahi-publish", "-a"]
