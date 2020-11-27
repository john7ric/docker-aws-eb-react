FROM node:alpine

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . /app
RUN npm run build

FROM nginx

WORKDIR /app
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
