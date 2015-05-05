FROM debian:jessie
MAINTAINER Jonathan DEKHTIAR "contact@jonathandekhtiar.eu"

# Link in our build files to the docker image
ADD src/ /tmp

# Run all ubuntu updates and apt-get installs
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get upgrade -y --fix-missing&& \
	apt-get install -y --fix-missing git \
		wget \
		build-essential \
		python-dev \
		sudo \
		vim \
		libglu-dev \
		libgl1-mesa-dev \
		libxtst6 \
		libxt-dev \
		libxt6 \
	&& apt-get clean


# Run all python installs
# Perform any cleanup of the install as needed
# Copy notebook config into ipython directory
# Make sure our user owns the directory
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh && \
	cp /tmp/ipython_notebook_config.py /home/condauser/.ipython/profile_default/ && \
	cp /tmp/matplotlib_nb_init.py /home/condauser/.ipython/profile_default/startup && \
	chown condauser:condauser /home/condauser -R

# Set persistent environment variables for python3 and python2 
ENV PY2PATH=/home/condauser/anaconda3/envs/python2/bin
ENV PY3PATH=/home/condauser/anaconda3/bin

# Install the python2 ipython kernel
RUN $PY2PATH/python $PY2PATH/ipython kernelspec install-self

RUN chmod +x /tmp/packageInstall.sh
RUN /tmp/packageInstall.sh

# Setup our environment for running the ipython notebook
EXPOSE 8888
USER condauser
ENV HOME=/home/condauser
ENV SHELL=/bin/bash
ENV USER=condauser
WORKDIR /home/condauser/notebooks

CMD $PY3PATH/ipython notebook