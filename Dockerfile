FROM r-base:4.3.1

# Instala dependências do sistema
RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev && \
    R -e "install.packages(c('plumber', 'remotes'), repos='http://cran.us.r-project.org')" && \
    R -e "remotes::install_github('rfsaldanha/microdatasus')"

# Copia API
COPY plumber /plumber

EXPOSE 8000

CMD ["R", "-e", "pr <- plumber::plumb('/plumber/api.R'); pr$run(host='0.0.0.0', port=8000)"]
