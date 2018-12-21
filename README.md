# sampledockerimage
This is just sample docker image

## Docker Commands
  `docker run -it --link mongo1:mongo  -p 3000:3000 bbachin1/simplemeteor`
  
  `docker build -t bbachin1/meteorpackage .`
  
#### How to name containers while running
  `docker run --name name1`
  
#### How to pass arguments building docker file

  Docker file
  
  `
    FROM node:8
    ARG VERSION=0
  `
  command line argument while builing
  
  `docker build --build-arg VERSION=0.1 -t <tag-name> .`
