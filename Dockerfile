# 1) Base com R 4.3.1
FROM rocker/r-ver:4.3.1

# 2) Instala plumber e remotes
RUN install2.r plumber remotes

# 3) Instala o microdatasus do GitHub
RUN Rscript -e "remotes::install_github('rfsaldanha/microdatasus')"

# 4) Copia seu script Plumber
COPY plumber.R /app/plumber.R
WORKDIR /app

# 5) Porta e entrypoint
EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('/app/plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
