FROM node:0.10

RUN wget https://nodejs.org/dist/v14.17.6/node-v14.17.6-linux-x64.tar.xz -O /tmp/node-v14.17.6-linux-x64.tar.xz \
  && tar -xf /tmp/node-v14.17.6-linux-x64.tar.xz -C /opt/ \
  && rm -rf /tmp/node-v14.17.6-linux-x64.tar.xz \
  && mv /opt/node-v14.17.6-linux-x64 /opt/node14 \
  && ln -sf /opt/node14/bin/node /usr/local/bin/node14

RUN apt-get update && apt-get install -y unzip git coreutils sqlite3 \
  && rm -rf /var/lib/apt/lists/*

ENV VERSION=3.41.10-ca
ENV RELEASE=v3.41.10-ca-6
ADD https://github.com/cloudacademy/jsbin/releases/download/${RELEASE}/${RELEASE}.zip /jsbin.zip
RUN unzip /jsbin.zip \
    && mkdir -p /home/project \
    && mv /jsbin-${VERSION} /jsbin \
    && rm -f /jsbin.zip
RUN cd /jsbin \
    && npm install

RUN apt-get update && apt-get install -y nginx \
  && rm -rf /var/lib/apt/lists/*

ARG ghuser
ARG pat
ARG repo
ARG forceclone=false
RUN git clone https://${ghuser}:${pat}@${repo}.git /content
COPY start.sh /start.sh
COPY config.default.json /jsbin/
COPY defaults/ /home/project/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000
ENV VOLUME_LOAD_DELAY 5
ENV PROXY_LOAD_DELAY 0
ENTRYPOINT /start.sh