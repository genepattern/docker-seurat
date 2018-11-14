# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.
FROM genepattern/genepattern-notebook:latest
# we need to assign unique tags to the GP nb

MAINTAINER Edwin Juarez <ejuarez@ucsd.edu>

ENV LANG=C LC_ALL=C

RUN conda install -y -c bioconda r-seurat==2.3.4

USER root
RUN conda install -y -c r rpy2==2.9.4
USER $NB_USER

# build using this:
# docker build -t genepattern/gpnb:1.0 .

# run using this:
# docker run --rm -t -p 8888:8888 -e GRANT_SUDO=yes genepattern/gpnb:1.0
