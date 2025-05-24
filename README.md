# Microdatasus API

API construída com Plumber e microdatasus em R para acessar dados do DataSUS.

## Endpoints

GET `/fetch_data`

Parâmetros:
- `year_start`: ano inicial
- `year_end`: ano final
- `uf`: unidade federativa (ex: RJ)
- `information_system`: SIM-DO, SINASC ou SIH-RD

## Deploy

Hospede usando Render: https://render.com/

Dockerfile incluído para facilitar deploy automático.
