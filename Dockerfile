FROM rocker/geospatial
RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler libjq-dev
RUN R -e "install.packages(c('highcharter', 'leaflet', 'shinycssloaders', 'shinyjs', 'tmap', 'ggmap', 'leaflet.extras', 'plumber'), repos='https://cran.rstudio.com/');"
RUN export ADD=shiny && bash /etc/cont-init.d/add
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
