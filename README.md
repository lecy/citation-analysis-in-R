# Citation Network Analyzer
Citation Network Analyzer (*citenet*) is a program for generating and analyzing
compact networks of citation relationships between academic publications.

The full suite consists of:
* a Python application for retrieving a set of academic publications from Google
Scholar, and storing them into a SQLite database.
* a R package containing a series of functions and tools for analysis,
modification and plotting of a set of academic publications and their relationships.

This repository contains the *citenet* R module.

## Requirements

This module depends on the following packages, available at CRAN:
* R (>= 2.11.0)
* [RSQLite](http://cran.r-project.org/web/packages/RSQLite/index.html)
* [igraph](http://cran.r-project.org/web/packages/igraph/index.html)
* [network](http://cran.r-project.org/web/packages/network/index.html)
* [sna](http://cran.r-project.org/web/packages/sna/index.html)

## Installation

For convenience, a source package is provided for each release. After
downloading the release (for example, ```citenet_0.3-5.tar.gz```, it can be
installed from the R command line:
```R
> install.packages(c("RSQLite", "sna", "igraph", "network"))
> install.packages("citenet_0.3-5.tar.gz")
```
Additional instructions for building the source package can be found at
[citenet/inst/INSTALL](citenet/inst/INSTALL).

## Additional notes

The original name of this package was **CNA**, but since version 0.3-5 it has
been renamed to *citenet* in order to prevent conflicts with the CRAN package
[*CNA - A Package for Coincidence Analysis*]
(http://cran.r-project.org/package=cna).
As such, both the documentation and the R code might still contain references to
*CNA*. Please be aware that, in all cases, they refer to this package.

## Changelog
* 0.3-5 (2015-05-28) - Initial public release

## License

This software is licensed under the GPL2 license.

```
citenet - Citation Network Analyzer
Copyright (C) 2015 Jesse Lecy <jdlecy@gmail.com>, with contributions from
Diego Moreda <diego.plan9@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```
