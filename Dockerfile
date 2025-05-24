FROM r-base:4.3.1

# Instala dependências de sistema
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instala pacotes R
RUN R -e "install.packages(c('remotes', 'plumber'), repos='https://cloud.r-project.org')" \
 && R -e "remotes::install_github('rfsaldanha/microdatasus')"

# Copia o código da API
COPY plumber /plumber

EXPOSE 8000

CMD ["R", "-e", "pr <- plumber::plumb('/plumber/api.R'); pr$run(host='0.0.0.0', port=8000)"]
