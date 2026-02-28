FROM node:alpine

WORKDIR /app

COPY package*.json .

RUN npm install && npm install -g nodemon

COPY . .

ARG DEFAULT_PORT=80
ENV PORT $DEFAULT_PORT

EXPOSE $PORT

CMD ["nodemon", "app.js"]
