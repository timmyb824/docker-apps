# Need to use node 16 because symon mode doesn't work in lower version.
# Also need to use 16.15 because npm ci fails with 16.15.
FROM node:22.11-alpine AS builder

WORKDIR /monika

COPY package*.json ./
COPY . .

RUN npm install typescript
RUN npm run prepack
RUN npm pack

FROM node:22.11-alpine AS runner

# Had to change directory to use /packages/notification
COPY --from=builder /monika/packages/notification/hyperjumptech-monika-*.tgz ./
RUN npm install -g --unsafe-perm ./hyperjumptech-monika-*.tgz

WORKDIR /
RUN mkdir /config

CMD ["monika"]
