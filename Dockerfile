FROM node:16 AS builder

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install

COPY . /app

FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["node", "src/app.js"]