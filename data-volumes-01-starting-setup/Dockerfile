FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 80

#VOLUME [ "/app/feedback" ] This volume is anonymous and  not persistent by default between different containers


CMD ["npm", "start"]
