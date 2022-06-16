# Install Dependencies
FROM node:lts-alpine3.15 AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
# RUN node_modules/.bin/ng build --prod
# RUN ng add angular-cesium
# RUN yarn build
# ENV NEXT_TELEMETRY_DISABLED 1
CMD ["yarn", "start"]

# Start Server that pulls data
# EXPOSE 3000
# ENV PORT 3000
# RUN yarn server

# Set up user and group
# ENV NODE_ENV production

# RUN addgroup -g 1001 -S nodejs
# RUN adduser -S angularjs -u 1001

# USER angularjs


# Start Development Application




# RUN yarn start