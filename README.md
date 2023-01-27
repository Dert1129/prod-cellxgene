# prod-cellxgene
Repo for using cellxgene for a production environment

## How to use this app
*   Create an environment file (.env) in the root of this project. See .env.example for reference
*   In config.yaml, line 80 type the name of the .h5ad file being used. Do not remove the leading slash. (i.e /file.h5ad)
*   Store your.h5ad file in the ./data folder
*   Run docker pull mithoopolly/cellxgene:prod_v0.0.3
*   Run docker build -t image/name:tage
*   Run docker-compose up -d