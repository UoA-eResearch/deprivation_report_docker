FROM rocker/geospatial
RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler apache2 apache2-utils libjq-dev
RUN R -e "install.packages(c('highcharter', 'leaflet', 'shinycssloaders', 'shinyjs', 'tmap', 'ggmap', 'leaflet.extras'), repos='https://cran.rstudio.com/');"
RUN export ADD=shiny && bash /etc/cont-init.d/add
COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod proxy_http proxy_wstunnel rewrite
ENTRYPOINT htpasswd -cb /etc/apache2/.htpasswd deprivation_report ${PASSWORD:-password} && service apache2 restart && /init
