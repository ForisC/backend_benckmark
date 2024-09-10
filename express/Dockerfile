# 使用 Node.js 官方映像
FROM node:14
WORKDIR /app

COPY ./app /app
RUN npm install

EXPOSE 8000
CMD ["node", "index.js"]
