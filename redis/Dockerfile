FROM redis:5.0.7
COPY redis.conf /usr/local/etc/redis/redis.conf
RUN mkdir /log
#RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
#RUN sysctl net.core.somaxconn=511
#RUN sysctl vm.overcommit_memory=1
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
EXPOSE 6379
