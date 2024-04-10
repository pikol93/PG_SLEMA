FROM node:18

WORKDIR /app

COPY ./package.json ./package.json

RUN npm install --save-dev @angular/cli@17.3.3