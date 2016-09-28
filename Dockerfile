FROM centos:latest

RUN \
    yum install -y wget && \
    wget https://nodejs.org/download/release/latest-v4.x/node-v4.6.0-linux-x64.tar.gz && \
    tar --strip-components 1 -xzvf node-v* -C /usr/local

RUN npm install -g forever

COPY src /src
RUN  mkdir /logs

RUN cd /src; npm install

CMD ["forever", "-l", "/forever.log", "-o", "/out.log", "-e", "/err.log", "-vf", "/src/index.js"]
