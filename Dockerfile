FROM jupyter/scipy-notebook:cf6258237ff9

RUN conda install -y nbgrader -c conda-forge

