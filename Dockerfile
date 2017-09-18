FROM rocker/geospatial
RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler && \
R -e "install.packages(c('highcharter', 'leaflet', 'shinycssloaders', 'shinyjs'), repos='https://cran.rstudio.com/'); library(devtools); install_github(c('mtennekes/tmap', 'mtennekes/tmaptools'))"
