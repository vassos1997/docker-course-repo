FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT 80

EXPOSE $PORT

#VOLUME [ "/app/feedback" ] This volume is anonymous and  not persistent by default between different containers


CMD ["npm", "server.js"]
