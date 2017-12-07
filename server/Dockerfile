FROM node:6.11-alpine
LABEL maintainer="chris.greenhalgh@nottingham.ac.uk"

RUN npm install -g bower
RUN apk add --no-cache git

WORKDIR /root/musiccodes/server/
ADD bower.json .bowerrc ./
RUN bower install --allow-root

ADD package.json ./
RUN npm install --production

ADD server.js ./
ADD lib/ lib/
ADD public/ public/
# pegjs? dev dep...
#RUN npm run prepublish

ADD experiences/ experiences/
# VOLUME /root/musiccodes/server/experiences

RUN bower install --allow-root
# update alpine package list and install opensll
RUN apk update && apk add openssl

#https://stackoverflow.com/questions/44047315/generate-a-self-signed-certificate-in-docker
# Generate SSL stuff for the image
# TODO: Learn what this does.  Soon!
RUN openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 && \
    openssl rsa -passin pass:x -in server.pass.key -out server.key && \
    rm server.pass.key && \
    openssl req -new -key server.key -out server.csr \
        -subj "/C=UK/ST=Nottinghamshire/L=Nottingham/O=uon/OU=IT Department/CN=example.com" && \
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# 2-stage build requires docker 17.05 or above!
FROM node:6.11-alpine
LABEL maintainer="chris.greenhalgh@nottingham.ac.uk"

WORKDIR /root/
##broke here
COPY --from=0 /root/musiccodes/server/ .

VOLUME /root/logs

EXPOSE 3000

CMD ["node","server.js"]
