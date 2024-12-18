FROM node:16 AS builder

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install

COPY . /app

RUN npm install -g pkg && pkg .

FROM node:21-alpine

WORKDIR /app

COPY --from=builder /app/tz-demo-app /app/exe

EXPOSE 3000

CMD ["./exe"]
#CMD ["/bin/sh", "-c", "while true; do echo $(date -u) >> out.txt; sleep 5; done"]

# docker build  -t test:latest .
#docker run test &
#docker exec -it dreamy_pare sh