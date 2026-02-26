FROM node:14



WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG DEFAULT_PORT=80
ENV PORT $DEFAULT_PORT

EXPOSE $PORT

#VOLUME [ "/app/feedback" ] This volume is anonymous and  not persistent by default between different containers


CMD ["npm", "server.js"]
