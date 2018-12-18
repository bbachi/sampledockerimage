FROM node:8
RUN echo 'Building from base image Node:8'

ENV MONGO_URL=mongodb://mongo:27017/todos
ENV ROOT_URL=http://localhost
ENV PORT=3000

WORKDIR /usr/app

RUN apt-get install -y curl
RUN apt-get update
RUN apt-get install -y --no-install-recommends bsdtar
RUN export tar='bsdtar'
RUN curl https://install.meteor.com/ | /bin/sh

RUN git clone https://github.com/bbachi/sampledockerimage.git

RUN echo 'git clone completed'

RUN cd sampledockerimage\
    && meteor npm install\
    && pwd\
    && ls -l\
    && chown -R root:root /usr/app\
    && meteor build --allow-superuser --directory output\
    && cd output/bundle/programs/server\
    && npm install -- production


RUN echo $MONGO_URL


CMD ["node","output/bundle/main.js"]