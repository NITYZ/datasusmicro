FROM rocker/plumber:4.3.1

# Instala remotes e microdatasus
RUN install2.r remotes
RUN Rscript -e 'remotes::install_github("rfsaldanha/microdatasus")'

# Copia o script Plumber
COPY plumber.R /app/plumber.R

# Exponha porta
EXPOSE 8000

# Inicialize o serviço Plumber
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('/app/plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
