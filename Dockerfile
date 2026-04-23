FROM nginx:alpine

ENV TZ=Asia/Shanghai

RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    sed -i 's/listen\s*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf && \
    chown -R nginx:nginx /var/cache/nginx /var/log/nginx /etc/nginx/conf.d && \
    chmod -R 755 /var/cache/nginx && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

COPY --chown=nginx:nginx . /usr/share/nginx/html

USER nginx

EXPOSE 8080
