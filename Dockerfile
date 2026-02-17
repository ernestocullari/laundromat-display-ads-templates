FROM nginx:alpine
COPY . /usr/share/nginx/html/
RUN echo 'server { listen 8080; root /usr/share/nginx/html; index index.html; location / { add_header Cache-Control "no-cache, no-store, must-revalidate"; add_header Pragma "no-cache"; add_header Expires 0; try_files $uri $uri/ =404; } }' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
