FROM node:alpine

ENV TIDDLYWIKI_VERSION=5.1.22

RUN npm install -g tiddlywiki@${TIDDLYWIKI_VERSION}

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
