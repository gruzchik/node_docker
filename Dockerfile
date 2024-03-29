FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

COPY package*.json ./
RUN npm install
COPY . .

#COPY --chown=node:node . .
RUN chown -R node:node /home/node/app

USER node

EXPOSE 9090
CMD [ "node", "app.js" ]
