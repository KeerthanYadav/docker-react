#Build Phase
#Base image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#RUN is not needed here as nginx image default command is to start nginx
