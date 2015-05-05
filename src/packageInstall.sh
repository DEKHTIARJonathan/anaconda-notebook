#!/bin/bash

# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
PY2PATH=$PREFIX/envs/python2/bin

# python 3
CONDA3=$PY3PATH/conda
PIP3=$PY3PATH/pip

# python 2
CONDA2=$PY2PATH/conda
PIP2=$PY2PATH/pip

cd $HOME

#conda package install - Python 3
export PATH=~/anaconda3/bin:$PATH
$CONDA3 update --yes --all
$CONDA3 install --yes pyqt
$CONDA3 install --yes jsonschema

#conda package install - Python 2
source activate python2
$CONDA2 update --yes --all
$CONDA2 install --yes pyqt
$CONDA2 install --yes vtk
$CONDA2 install --yes jsonschema