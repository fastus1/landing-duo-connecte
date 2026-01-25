FROM nginx:alpine

COPY pages/duo-connecte/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
