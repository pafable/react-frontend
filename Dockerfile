FROM node:alpine as builder 
WORKDIR '/appl'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /appl/build /usr/share/nginx/html