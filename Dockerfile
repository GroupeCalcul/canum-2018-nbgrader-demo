FROM jupyter/scipy-notebook:cf6258237ff9

RUN conda install --quiet --yes nbgrader -c conda-forge

# Setup the exchange directory
USER root
RUN mkdir -p /srv/nbgrader/exchange
RUN chmod ugo+rw /srv/nbgrader/exchange

USER jovyan
ADD nbgrader_config.py /home/jovyan/.jupyter/nbgrader_config.py