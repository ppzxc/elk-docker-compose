FROM docker.elastic.co/logstash/logstash:7.3.2 AS custom-logstash
RUN bin/logstash-plugin install logstash-filter-hex_to_ascii
