FROM docker.elastic.co/beats/packetbeat:7.5.1
COPY packetbeat.yml /usr/share/packetbeat/packetbeat.yml
USER root
RUN chown packetbeat /usr/share/packetbeat/packetbeat.yml
USER packetbeat
