```{r test-r, engine='R'}
library(knitr)
set.seed(123)
rnorm(5)
```

Does **knitr** work with Python? Use the chunk option `engine='python'`:
  
  ```{r test-python, engine='python'}
x = 'hello, python world!'
print(x)
print(x.split(' '))
```

Or use the syntax ```` ```{python} ````:
  
  ```{python}
x = 'hello, python world!'
print(x.split(' '))
```

If all the chunks below are python chunks, we can set the engine globally:
  
  ```{r setup, include=FALSE}
opts_chunk$set(engine = 'python')
```

## Chunk Options

You can use some chunk options like `eval`, `echo` and `results`. For example, `eval=FALSE` (do not evaluate code):
  
  ```{r test-eval, eval=FALSE, ref.label='test-python'}
```

or `echo=FALSE` (hide source code):
  
  ```{r test-echo, echo=FALSE, ref.label='test-python'}
```

or `results='hide'`:
  
  ```{r test-hide, results='hide', ref.label='test-python'}
```

or `results='asis'`:
  
  ```{r test-asis, results='asis'}
print '**Write** _something_ in `Markdown` from `Python`!'
```

You can also cache the computation:
  
  ```{r test-cache, cache=TRUE}
import time
# pretend this is a time-consuming task...
time.sleep(10)
print(1+1)
```

## Strict Markdown

You can use strict markdown (i.e. indent by 4 spaces) by setting `render_markdown(TRUE)`.

```{r strict-markdown, engine='R'}
render_markdown(TRUE)
```

Now see how the output is changed:
  
  ```{r test-py-again, ref.label='test-python'}
```
© 2019 GitHub, Inc.