FROM nginx:mainline-alpine

LABEL org.opencontainers.image.vendor="Roboception GmbH"
LABEL org.opencontainers.image.title="Hello rc_cube"
LABEL org.opencontainers.image.description="Simple example for rc_cube UserSpace"
LABEL org.opencontainers.image.url="https://github.com/roboception/hello_rc_cube"
LABEL org.opencontainers.image.source="https://github.com/roboception/hello_rc_cube"

# This label tells the rc_cube that the protocol for mapped host ports is http.
# The value is not considered
LABEL com.roboception.app.http=""

# add curl for healthcheck
RUN apk --no-cache add curl

RUN rm /etc/nginx/conf.d/*
COPY hello.conf /etc/nginx/conf.d/
COPY html/* /usr/share/nginx/html/

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:80 || exit 1
