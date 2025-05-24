FROM rocker/plumber:latest

RUN install2.r --error remotes \
 && R -e "remotes::install_github('rfsaldanha/microdatasus')"

COPY plumber /plumber

EXPOSE 8000

CMD R -e "pr <- plumber::plumb('/plumber/api.R'); pr$run(host='0.0.0.0', port=8000)"
