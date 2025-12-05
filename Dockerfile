FROM node:24-alpine3.21 AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 




FROM node:24-alpine3.21
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV MONGO=true \ 
    MONGO_URL="mongodb://mongodb:27017/catalogue"
COPY --from=build /opt/server /opt/server

USER roboshop
CMD ["node", "server.js"]
