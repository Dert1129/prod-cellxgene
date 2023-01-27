FROM mithoopolly/cellxgene:prod_v0.0.3

RUN apt-get install nano -y

ENV IS_TESTING=TRUE
ADD conf.d/cellxgene /etc/nginx/sites-available
COPY ./entrypoint/start.sh /
COPY ./data/$H5AD_NAME /test-files/
COPY ./config.yaml /
RUN unlink /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/cellxgene
RUN mkdir /certs
ENTRYPOINT [ "/start.sh" ]