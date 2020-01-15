FROM docker.elastic.co/beats/filebeat:7.5.1
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
USER filebeat
#RUN ./filebeat setup --pipelines --modules system,traefik,redis,elasticsearc
