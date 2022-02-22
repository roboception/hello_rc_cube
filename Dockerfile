FROM nginx:mainline-alpine

# add curl for healthcheck
RUN apk --no-cache add curl

RUN rm /etc/nginx/conf.d/*
COPY hello.conf /etc/nginx/conf.d/
COPY html/* /usr/share/nginx/html/

# This label tells the rc_cube that the protocol for mapped host ports is http.
# The value is not considered
LABEL com.roboception.app.http=""

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:80 || exit 1
