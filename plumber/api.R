library(plumber)
library(microdatasus)

#* @get /fetch_data
function(year_start, year_end, uf, information_system) {
  dados <- fetch_datasus(as.integer(year_start), as.integer(year_end), uf, information_system)

  dados_proc <- switch(information_system,
    "SIM-DO" = process_sim(dados),
    "SINASC" = process_sinasc(dados),
    "SIH-RD" = process_sih(dados),
    stop("Sistema inválido.")
  )

  return(dados_proc)
}

