FROM docker.elastic.co/beats/metricbeat:7.3.2 AS custom-metricbeats
EXPOSE 5066
#
## The file to monitor the host is different from the file to monitor docker services.ADD
## So we pass the filename at build time to choose the target (host or services) of the image built.
#COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
#
#USER root
#
##RUN yum -y install nc
#
#RUN mkdir /var/log/metricbeat \
#    && chown root:metricbeat /usr/share/metricbeat/metricbeat.yml \
#    && chown root:metricbeat /var/log/metricbeat \
#    && chmod go-w /usr/share/metricbeat/metricbeat.yml
#
#COPY entrypoint.sh /usr/local/bin/custom-entrypoint
#RUN chmod +x /usr/local/bin/custom-entrypoint
#
#USER metricbeat
#
#COPY healthcheck.sh /
#HEALTHCHECK --interval=1s --retries=300 CMD sh /healthcheck.sh
#
#ENTRYPOINT ["/usr/local/bin/custom-entrypoint"]
