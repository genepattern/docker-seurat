# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.
FROM genepattern/genepattern-notebook:latest
# we need to assign unique tags to the GP nb

MAINTAINER Edwin Juarez <ejuarez@ucsd.edu>

ENV LANG=C LC_ALL=C

RUN conda install -y -c bioconda r-seurat==2.3.4

USER root
RUN conda install -y -c r rpy2==2.9.4
RUN pip install nbtools genepattern-python genepattern-notebook jupyter-wysiwyg && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter nbextension install --py nbtools && \
    jupyter nbextension enable --py nbtools && \
    jupyter serverextension enable --py nbtools && \
    jupyter nbextension install --py genepattern && \
    jupyter nbextension enable --py genepattern && \
    jupyter serverextension enable --py genepattern && \
    jupyter nbextension install --py jupyter_wysiwyg && \
    jupyter nbextension enable --py jupyter_wysiwyg

# Installing collapsible_headings (et al.)
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions && \
    jupyter nbextension enable collapsible_headings/main --user

RUN pip install scanpy==1.3.4

USER $NB_USER

# Obsolete instructions below
# build using this:
# docker build -t genepattern/gpnb:1.0 .

# run using this:
# docker run --rm -t -p 8888:8888 -e GRANT_SUDO=yes genepattern/gpnb:1.0
