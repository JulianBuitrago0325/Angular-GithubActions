FROM nginx:mainline-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY dist/project-test/ /usr/share/nginx/html/
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
RUN chgrp -R root /var/cache/nginx
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
RUN addgroup nginx root
# --- Expose and CMD ---
EXPOSE 8080
#CMD gunicorn --bind 0.0.0.0:5000 wsgi --chdir /usr/share/nginx/html/ & nginx -g "daemon off;"
CMD ["nginx", "-g", "daemon off;"]
