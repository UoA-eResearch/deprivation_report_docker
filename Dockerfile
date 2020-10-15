FROM rocker/geospatial:latest
RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler libjq-dev
RUN R -e "install.packages(c('highcharter', 'leaflet', 'shinycssloaders', 'shinyjs', 'leaflet.extras', 'plumber', 'uuid', 'curl', 'mailR', 'kableExtra', 'stringr', 'swfscMisc', 'sf', 'geosphere', 'rangeBuilder', 'rgeos', 'raster', 'mapview', 'rmapshaper', 'doParallel', 'rgdal', 'sp', 'RColorBrewer', 'htmltools', 'htmlwidgets', 'knitr', 'rmarkdown', 'GAlogger', 'tinytext', 'shiny'), repos='https://cran.rstudio.com/');"
RUN R -e "install.packages('GAlogger', repos = 'http://www.datatailor.be/rcube', type = 'source');"
RUN R -e "devtools::install_github('dkahle/ggmap');"
RUN R -e "devtools::install_github('mtennekes/tmap');"
RUN R -e "devtools::install_github('tidyverse/ggplot2');"
RUN rocker_scripts/install_shiny_server.sh
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
