library(reticulate)
reticulate::install_miniconda()
py_config()
use_python("C:/Users/egn225/AppData/Local/r-miniconda/envs/r-reticulate/python.exe")

# test waar Python staat op pc
py_config()
py_discover_config()

# install packages
py_install("pandas")
py_install("matplotlib")
py_install("scipy")
py_install("statsmodels")
py_install("statsmodels.api")




# OUD
#py_install("statsmodels.api")
#conda_create("r-reticulate")
#conda_install("statsmodels.api")
#conda_remove("statsmodels")

#use_python('C:\Users\egn225\Anaconda3\python.exe', required = T)

#Sys.setenv(RETICULATE_PYTHON = 'C:/Users/egn225/Anaconda3')
