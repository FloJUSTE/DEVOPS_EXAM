FROM nginx:alpine

RUN apk update && apk upgrade && apk add git
COPY nginx/default.conf /etc/nginx/conf.d/

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
RUN git clone https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off"]
