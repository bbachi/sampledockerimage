FROM node:8
RUN echo 'Building from base image Node:8'

ENV MONGO_URL=mongodb://mongo:27017/todos
ENV ROOT_URL=http://localhost
ENV PORT=3000

RUN apt-get install -y curl
RUN apt-get update
RUN apt-get install -y --no-install-recommends bsdtar
RUN export tar='bsdtar'
RUN apt-get install sudo -y
RUN curl https://install.meteor.com/ | /bin/sh

RUN useradd meteoruser
RUN mkdir -p /home/meteoruser
RUN chown meteoruser /home/meteoruser
USER meteoruser
WORKDIR /home/meteoruser

RUN git clone https://github.com/bbachi/sampledockerimage.git

RUN echo 'git clone completed'

RUN cd sampledockerimage\
    && meteor npm install\
    && /usr/local/bin/meteor build --directory output\
    && cd output/bundle/programs/server\
    && npm install --production


RUN echo $MONGO_URL


CMD ["node","sampledockerimage/output/bundle/main.js"]
