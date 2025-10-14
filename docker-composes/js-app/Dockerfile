FROM node:18-alpine

EXPOSE 80
WORKDIR /app

COPY app.js .

RUN npm install express redis
RUN npm install

ENTRYPOINT ["node", "app.js"]
