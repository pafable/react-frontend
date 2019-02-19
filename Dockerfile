FROM node:alpine as builder 
WORKDIR '/appl'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# EXPOSE 8080
COPY --from=builder /appl/build /usr/share/nginx/html