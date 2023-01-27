#!/bin/bash
# Compute gives following variables
# 1. OPEN_APP_ID Is the url route that invokes the docker compute.polly.elucidata.io/shiny/app_direct/{uuid}/cellxgene/?dataset_id=jjfeje&repo_name=feffwef&repo_id=rfrfw
# 2. POLLY_REFRESH_TOKEN, POLLY_ID_TOKEN, POLLY_WORKSPACE_ID, POLLY_USER, POLLY_AUD, POLLY_SUB
# 3. discover py package and download the data
# 4. port of in which data is exposed should begiven to compute
nginx -t
if [ "$IS_TESTING" == "TRUE" ]; then
    cp /test-files/${H5AD_NAME} /${H5AD_NAME}
else
    echo 'starting the run'
    python3 -u ./discover_script.py
fi
echo "python executed"

# python3 app.py
echo $(ls;echo "";sleep 15; /etc/init.d/nginx start;echo "";ls) & supervisord -c /etc/supervisor.conf