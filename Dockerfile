FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
COPY hello.conf /etc/nginx/conf.d/
COPY html/* /usr/share/nginx/html/

# This label tells the rc_cube that the protocol for mapped host ports is http.
# The value is not considered
LABEL com.roboception.app.http=""
