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
py_install("pingouin")
py_install("seaborn")
py_install("scikit-posthocs", pip = TRUE)

# https://github.com/rstudio/reticulate/issues/578
# https://cran.r-project.org/web/packages/reticulate/vignettes/python_packages.html
# https://seaborn.pydata.org/generated/seaborn.FacetGrid.html (Seaborn)
# https://scikit-posthocs.readthedocs.io/en/latest/posthocs_api/ (post-hoc tests)
# https://www.statsmodels.org/stable/api.html#statsmodels-api (statsmodels)
# https://tedboy.github.io/statsmodels_doc/generated/statsmodels.stats.api.html (statsmodels.api)
# https://pingouin-stats.org/index.html (pingouin)
# https://docs.scipy.org/doc/scipy/reference/stats.html (scipy)

# OUD
#py_install("statsmodels.api")
#conda_create("r-reticulate")
#conda_install("statsmodels.api")
#conda_remove("statsmodels")

#use_python('C:\Users\egn225\Anaconda3\python.exe', required = T)

#Sys.setenv(RETICULATE_PYTHON = 'C:/Users/egn225/Anaconda3')
