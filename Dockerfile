FROM node

ENV HOME /root
ENV NODE_ENV production
ENV ENGI_BIND_IP 0.0.0.0
ENV MONGODB mongodb://mongo:27017/engi
ENV GRIDFS mongodb://mongo:27017/engi-assets
EXPOSE 8000

RUN apt-get -q update
RUN apt-get install -y graphicsmagick

CMD [ "node", "app.js" ]

ADD . /usr/src/app

WORKDIR /usr/src/app
RUN npm install
RUN ./node_modules/.bin/gulp plugins

