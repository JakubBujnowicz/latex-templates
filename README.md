# latex-templates

Configurable LaTeX templates prepared for different kinds of documents.
Templates can be found in the main directory in `*_template.tex` files.

Currently implemented class templates:

1. `article`.

Planned:

1. `beamer`.


## Structure
The structure of the document is separated into various directories.
Details about each one can be found in the corresponding `README.md` files
inside.

A general overview:

* `config`: files with used packages for a given document type, definitions
of constants, configuration settings, commands and environments.
* `bibliography`: stores `.bib` file(s) with bibliography entries.
* `sections`: stores `.tex` files with parts of the document.
* `figures`: stores files with figures.
* `tables`: stores `.tex` files with LaTeX tables.
* `Rcode`: useful R code.
* `scripts`: executable scripts, often base on files within `Rcode`.


