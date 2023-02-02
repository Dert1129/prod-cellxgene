#!/bin/bash
# Compute gives following variables
# 1. OPEN_APP_ID Is the url route that invokes the docker compute.polly.elucidata.io/shiny/app_direct/{uuid}/cellxgene/?dataset_id=jjfeje&repo_name=feffwef&repo_id=rfrfw
# 2. POLLY_REFRESH_TOKEN, POLLY_ID_TOKEN, POLLY_WORKSPACE_ID, POLLY_USER, POLLY_AUD, POLLY_SUB
# 3. discover py package and download the data
# 4. port of in which data is exposed should begiven to compute
nginx -t

# DATASET_ID=$(echo $OPEN_APP_ID | tr "&" "\n" | grep dataset_id | cut -d"=" -f2)
# REPO_NAME=$(echo $OPEN_APP_ID | tr "&" "\n" | grep repo_name | cut -d"=" -f2)

# ELEMENTS=(${OPEN_APP_ID//[=&]/ })
# CONST_PATH="/srv/dataset/datalake"
# PATH_TO_H5AD=${CONST_PATH}/${REPO_NAME}/data/${DATASET_ID}/${DATASET_ID}.h5ad
# echo ${PATH_TO_H5AD}

# IS_TESTING="TRUE"
echo $IS_TESTING
if [ -f "${PATH_TO_H5AD}" ]; then
    sed '80 c\
    datapath: '${PATH_TO_H5AD} /config.yaml > /tmp_config.yaml
    cat /tmp_config.yaml > /config.yaml
    cat /config.yaml
else
    echo 'starting the run'
    python3 -u ./discover_script.py
fi
echo "python executed"

# python3 app.py
echo $(ls;echo ""; /etc/init.d/nginx start;echo "";ls) & supervisord -c /etc/supervisor.conf