FROM nginx:latest

COPY ./website/index.html /usr/share/nginx/html/index.html
COPY ./website/caipirinha.html /usr/share/nginx/html/caipirinha.html
COPY ./website/longIslandIcedTea.html /usr/share/nginx/html/longIslandIcedTea.html
COPY ./website/mojito.html /usr/share/nginx/html/mojito.html
COPY ./website/sexontheBeach.html /usr/share/nginx/html/sexontheBeach.html
COPY ./website/styles.css /usr/share/nginx/html/styles.css
COPY ./website/swimmingPool.html /usr/share/nginx/html/swimmingPool.html
COPY ./website/tequilaSunrise.html /usr/share/nginx/html/tequilaSunrise.html
COPY ./website/pictures /usr/share/nginx/html/pictures