#
# Postgres 9.6-alpine
#
# https://hub.docker.com/_/postgres/
#

FROM postgres:9.6-alpine

COPY copy.sh /root/copy.sh
RUN chmod 777 /root/copy.sh
