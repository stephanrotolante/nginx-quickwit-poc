FROM nginx:1.27.3

RUN apt-get update && apt-get install -y logrotate cron nano tzdata curl iproute2

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime && \
echo "America/New_York" > /etc/timezone

COPY ./logrotate.cron /etc/cron.d/logrotate-cron
RUN chmod 0644 /etc/cron.d/logrotate-cron
RUN crontab /etc/cron.d/logrotate-cron

COPY nginx.logrotate /etc/logrotate.d/nginx.logrotate

# Copy a script to start both cron and Nginx
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose ports
EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]