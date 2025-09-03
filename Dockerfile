# -------- Build stage --------
 FROM node:20 AS builder
WORKDIR /usr/app
COPY package*.json ./
RUN npm install --omit=dev
# -------- Runtime stage --------
FROM node:20-slim
WORKDIR /usr/app
COPY --from=builder /usr/app ./
EXPOSE 5000
CMD ["node", "app.js"]
