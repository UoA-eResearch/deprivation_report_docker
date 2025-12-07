FROM rocker/geospatial:latest
RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler libjq-dev default-jdk
RUN R -e "options(Ncpus = 8); install.packages(c('tictoc', 'mailR', 'rJava', 'progress', 'geojsonio', 'Orcs', 'highcharter', 'leaflet', 'shinycssloaders', 'shinyjs', 'leaflet.extras', 'plumber', 'uuid', 'curl', 'mailR', 'kableExtra', 'stringr', 'swfscMisc', 'sf', 'geosphere', 'rangeBuilder', 'rgeos', 'raster', 'mapview', 'rmapshaper', 'doParallel', 'rgdal', 'sp', 'RColorBrewer', 'htmltools', 'htmlwidgets', 'knitr', 'rmarkdown', 'GAlogger', 'tinytext', 'shiny'), repos='https://cran.rstudio.com/');"
RUN R CMD javareconf
RUN R -e "install.packages('GAlogger', repos = 'http://www.datatailor.be/rcube', type = 'source');"
RUN R -e "devtools::install_github('dkahle/ggmap');"
RUN R -e "devtools::install_github('mtennekes/tmap');"
RUN R -e "devtools::install_github('tidyverse/ggplot2');"
RUN R -e "devtools::install_github('rstudio/leaflet');"
RUN R -e "devtools::install_github('neon-ninja/leaflet.extras');"
#RUN R -e "devtools::install_github('Beachnad/mailR@patch');"
# phantomjs is required for webshot to snapshot htmlwidgets when knitting to PDF
RUN R -e "webshot::install_phantomjs()"
# This ENV var is required in order for webshot to function
ENV OPENSSL_CONF="/etc/ssl"
RUN rocker_scripts/install_shiny_server.sh
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
