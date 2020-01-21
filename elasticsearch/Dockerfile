FROM docker.elastic.co/elasticsearch/elasticsearch:7.3.2 AS custom-elasticsearch
RUN elasticsearch-plugin install -b https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-1.3.0.1.zip
RUN elasticsearch-plugin install -b https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-1.3.0.0.zip
RUN elasticsearch-plugin install -b https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/performance-analyzer/opendistro_performance_analyzer-1.3.0.0.zip
