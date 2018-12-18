FROM node:8
RUN echo 'Building from base image Node:8'

ENV MONGO_URL=mongodb://mongo:27017/todos
ENV ROOT_URL=http://localhost
ENV PORT=3000

WORKDIR /usr/app

RUN curl https://install.meteor.com/ | sh

git 

RUN echo 'Setting the work directory to /usr/app'


RUN echo 'Copying everything to work direcory'
COPY ./output ./

RUN echo 'installing dependencies'
RUN cd bundle/programs/server
RUN npm install -- production

RUN echo $MONGO_URL


CMD ["node","bundle/main.js"]