#conda package install - Python 3
export PATH=~/anaconda3/bin:$PATH
conda update --yes --all
conda install --yes pyqt

#conda package install - Python 2
export PATH=~/anaconda3/envs:$PATH
source activate python2
conda update --yes --all
conda install --yes pyqt
conda install --yes vtk