FROM rocker/plumber:4.3.1

# instalar remotes e microdatasus
RUN install2.r remotes
RUN Rscript -e 'remotes::install_github("rfsaldanha/microdatasus")'

COPY plumber.R /app/plumber.R
EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('/app/plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
