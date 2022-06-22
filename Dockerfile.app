# Install Dependencies
FROM node:lts-alpine3.15 AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json yarn.lock ./

RUN yarn

RUN yarn global add @angular/cli #added

COPY . ./

EXPOSE 4200/tcp
#RUN npm start #executes 'ng serve --host 0.0.0.0' #removed!
CMD ng serve --host 0.0.0.0 #added