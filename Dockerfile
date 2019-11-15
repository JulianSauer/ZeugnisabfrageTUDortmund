FROM alpine:3.8

LABEL maintaner.author="Julian Sauer"

RUN apk add --update busybox-suid httpie

COPY ./query.sh ./

COPY ./cron-job /etc/cron.d/cron-job

RUN crontab /etc/cron.d/cron-job \
 && touch /var/log/cron.log

CMD /usr/sbin/crond -f -l 8 && tail -f /var/log/cron.log
