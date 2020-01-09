FROM docker.elastic.co/logstash/logstash:7.5.1

HEALTHCHECK CMD /usr/bin/curl --fail http://localhost:9600 || exit 1
