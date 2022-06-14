# Install Dependencies
FROM node:18-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json yarn.lock node_modules ./

# WORKDIR /usr/local/bin
RUN yarn install --frozen-lockfile
RUN node_modules/.bin/ng build --prod
RUN ng add angular-cesium
RUN yarn build

# Start Server that pulls data
EXPOSE 3000
ENV PORT 3000
RUN yarn server


# Set up user and group
ENV NODE_ENV production

RUN addgroup -g 1001 -S nodejs
RUN adduser -S angularjs -u 1001

USER angularjs


# Start Development Application
EXPOSE 4200
ENV PORT 4200

ENV NEXT_TELEMETRY_DISABLED 1

RUN yarn start