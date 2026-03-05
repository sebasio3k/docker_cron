# ----------------------- DEV DEPS -------------------------
FROM node:19.2-alpine3.16 AS deps

# cd /app
WORKDIR /app
# COPY source destination
COPY package.json ./
# install dependencies
RUN npm install


# ----------------------- RUN TEST -------------------------
FROM node:19.2-alpine3.16 AS test-build

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# test app
RUN npm run test


# ----------------------- PROD DEPS -------------------------
FROM node:19.2-alpine3.16 AS prod-deps 

WORKDIR /app
COPY package.json ./
# Production dependencies
RUN npm install --prod


# ----------------------- RUN APP -------------------------
FROM node:19.2-alpine3.16 AS runner

WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks

# run app
CMD ["node", "app.js"]

