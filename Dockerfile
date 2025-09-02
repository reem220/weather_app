# -------- Build stage --------
 FROM node:20 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --omit=dev
# -------- Runtime stage --------
FROM node:20-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./
EXPOSE 5000
CMD ["node", "app.js"]
