#conda package install - Python 3
export PATH=~/anaconda3/bin:$PATH
/home/condauser/anaconda3/bin/conda update --yes --all
/home/condauser/anaconda3/bin/conda install --yes pyqt

#conda package install - Python 2
/home/condauser/anaconda3/envs/python2/bin/conda update --yes --all
/home/condauser/anaconda3/envs/python2/bin/conda install --yes pyqt
/home/condauser/anaconda3/envs/python2/bin/conda install --yes vtk