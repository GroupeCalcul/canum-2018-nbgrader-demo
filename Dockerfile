FROM jupyter/scipy-notebook:cf6258237ff9

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
ADD nbgrader_config.py /home/jovyan/.jupyter/nbgrader_config.py

USER root
RUN chown -R jovyan ${HOME}
RUN mkdir -p /srv/nbgrader/exchange
RUN chmod ugo+rw /srv/nbgrader/exchange

USER jovyan

RUN conda install --quiet --yes nbgrader -c conda-forge
