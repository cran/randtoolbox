# randtoolbox: Toolbox for Pseudo and Quasi Random Number Generation and Random Generator Tests

[![CRAN_Release_Badge](https://www.r-pkg.org/badges/version-ago/randtoolbox)](https://cran.r-project.org/package=randtoolbox) [![CRAN Downloads](https://cranlogs.r-pkg.org/badges/randtoolbox)](https://cran.r-project.org/package=randtoolbox) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

`randtoolbox` Provides (1) pseudo random generators - general linear congruential generators, multiple recursive generators and generalized feedback shift register (SF-Mersenne Twister algorithm (<doi:10.1007/978-3-540-74496-2_36>) and WELL (<doi:10.1145/1132973.1132974>) generators); (2) quasi random generators - the Torus algorithm, the Sobol sequence, the Halton sequence (including the Van der Corput sequence) and (3) some generator tests - the gap test, the serial test, the poker test, see, e.g., Gentle (2003) <doi:10.1007/b97336>. 


## The package

The stable version of `randtoolbox` can be installed from CRAN using:

``` r
install.packages("randtoolbox")
```

Finally load the package in your current R session with the following R command:

``` r
library(randtoolbox)
```

## Documentation

The overall documentation is available at

``` r
help(randtoolbox)
```
