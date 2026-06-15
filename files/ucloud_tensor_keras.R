# Kører shell kommandoer fra R
system2("sudo", args = c("add-apt-repository", "-y", "ppa:deadsnakes/ppa"))

system2("sudo", args = c("apt-get", "update"))
system2("sudo", args = c("apt-get", "install", "-y", "python3.9", "python3.9-venv", "python3.9-dev"))

# Python setup
system2("python3.9", args = c("-m", "ensurepip", "--upgrade"))
system2("python3.9", args = c("-m", "pip", "install", "--upgrade", "pip"))
system2("python3.9", args = c("-m", "pip", "install", "numpy"))

# Opret og aktiver virtual environment
system2("python3.9", args = c("-m", "venv", "~/r-tensorflow"))

# For at aktivere virtual environment og installere packages
system2("bash", args = c("-c", "source ~/r-tensorflow/bin/activate && pip install numpy tensorflow keras spacy && python -m spacy download en_core_web_sm && deactivate"))

# R packages og setup
Sys.unsetenv('RETICULATE_PYTHON')
library(reticulate)
use_virtualenv('~/r-tensorflow', required = TRUE)
py_config()

install.packages('remotes')
remotes::install_github('rstudio/tensorflow', upgrade = 'always')
library(tensorflow)
install_tensorflow(envname = '~/r-tensorflow', restart_session = FALSE)

remotes::install_github('rstudio/keras')
library(keras3)
install_keras(envname = '~/r-tensorflow')

print("READY TO GO!")