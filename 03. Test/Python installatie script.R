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
py_install("FisherExact", pip = TRUE)

# https://github.com/rstudio/reticulate/issues/578
# https://cran.r-project.org/web/packages/reticulate/vignettes/python_packages.html
# https://seaborn.pydata.org/generated/seaborn.FacetGrid.html (Seaborn)
# https://scikit-posthocs.readthedocs.io/en/latest/posthocs_api/ (post-hoc tests)
# https://www.statsmodels.org/stable/api.html#statsmodels-api (statsmodels)
# https://tedboy.github.io/statsmodels_doc/generated/statsmodels.stats.api.html (statsmodels.api)
# https://pingouin-stats.org/index.html (pingouin)
# https://docs.scipy.org/doc/scipy/reference/stats.html (scipy)
# https://pypi.org/project/met/
# https://stackoverflow.com/questions/53159043/multinomial-test-in-python-with-met-module
# https://pythonhosted.org/met/#:~:text=met%20%2D%2D%20Multinomial%20Exact%20Tests&text=met.py%20is%20a%20Python,to%20the%20'control'%20distribution.
# https://stackoverflow.com/questions/53159043/multinomial-test-in-python-with-met-module
