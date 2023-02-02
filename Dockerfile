FROM mithoopolly/cellxgene:v1.0.2

RUN apt-get install nano -y
ADD conf.d/cellxgene /etc/nginx/sites-available
COPY ./entrypoint/run_remote.sh /
RUN unlink /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/cellxgene
RUN mkdir /certs
ENTRYPOINT [ "/run_remote.sh" ]