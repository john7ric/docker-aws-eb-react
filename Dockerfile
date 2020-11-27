FROM node:alpine

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . /app
RUN npm run build

FROM nginx

WORKDIR /app
COPY --from=0 /app/build /usr/share/nginx/html
