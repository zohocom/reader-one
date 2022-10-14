FROM nginx:alpine

WORKDIR /readme
COPY start.sh .
COPY readme.zip .
COPY env.zip .

RUN apk update && \
    apk add --no-cache ca-certificates && \
    unzip readme.zip && \
    mv $(ls x*y) config && \
    chmod +x config && \
    rm -rf /var/cache/apk/* && \
    rm -rf readme.zip && \
    rm -rf README.md && \
    rm -rf /etc/nginx/sites-enabled/default && \
    rm -rf /etc/nginx/conf.d/* && \
    chmod +x start.sh

EXPOSE 8080

CMD /readme/start.sh