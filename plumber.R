# plumber.R
library(plumber)
library(microdatasus)

#* @apiTitle Microdatasus API para PubMack
#* @param uf Estado (sigla)
#* @param year Ano (YYYY)
#* @get /sinasc
function(uf, year){
  fetch_datasus(year_start = as.integer(year),
                year_end   = as.integer(year),
                uf         = uf,
                information_system = "SINASC")
}
