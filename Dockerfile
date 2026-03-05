# app
# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
FROM node:19.2-alpine3.16

# cd /app
WORKDIR /app>

# COPY source destination
COPY package.json ./

# install dependencies
RUN npm install

# COPY tasks ./tasks
# COPY test ./tests

COPY . .

# test app
RUN npm run test

# delete unneeded files and folders 
RUN rm -rf tests && rm -rf node_modules 
# RUN rm -rf node_modules

# Production dependencies
RUN npm install --prod

# run app
CMD ["node", "app.js"]


