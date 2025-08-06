FROM pangeo/pangeo-notebook:latest

USER root

# Install more packages
COPY environment.yml environment.yml
RUN mamba env update --name notebook -f environment.yml && mamba clean --all
RUN rm environment.yml

# Revert to default user
USER ${NB_USER}
