FROM docker.elastic.co/logstash/logstash:7.3.2 AS custom-logstash
EXPOSE 8000
RUN bin/logstash-plugin install logstash-filter-hex_to_ascii
RUN bin/logstash-plugin install logstash-filter-math
RUN bin/logstash-plugin install logstash-codec-nmap
#RUN yum install -y nmap
#RUN bin/logstash-plugin update logstash-filter-ruby
