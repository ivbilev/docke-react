FROM node:alpine3.10 AS builder

#this tags the phase  as builder
WORKDIR '/app'
#define my work directory
COPY package.json .
#copy dependacies list
RUN npm install
# install node
COPY . .
#copy all of my source code
RUN npm run build
#it will create build forlder in workdir /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#will copy over from builder phase
