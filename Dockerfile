FROM node:16 AS builder

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install

COPY . /app

RUN npm install -g pkg && pkg .

FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app/tz-demo-app-linux /app/exe

EXPOSE 3000

CMD ["./exe"]