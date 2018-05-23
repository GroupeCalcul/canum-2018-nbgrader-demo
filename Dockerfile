FROM jupyter/scipy-notebook:cf6258237ff9

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
ADD nbgrader_config.py /home/jovyan/.jupyter/nbgrader_config.py

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN conda install --quiet --yes nbgrader -c conda-forge

# Setup the exchange directory
USER root
RUN mkdir -p /srv/nbgrader/exchange
RUN chmod ugo+rw /srv/nbgrader/exchange

USER jovyan