How to update ?
===============

Update the LaTeX class
----------------------

 * Download this file from FontAwesome repository: https://github.com/FortAwesome/Font-Awesome/raw/master/src/icons.yml
 * Run the following command:
```bash
# ruby tools/gensymbols.rb  path/to/icons.yml > fontawesome-symbols.sty
```
 * Edit `fontawesome.sty`, and update `\ProvidesPackage` regarding the correct version


Update the documentation
------------------------
 * Download this file from FontAwesome repository: https://github.com/FortAwesome/Font-Awesome/raw/master/src/icons.yml
 * Run the following command (`Y.Z` is the current fontawesome version):
```bash
# ruby tools/gendocsymbols.rb Y.Z path/to/icons.yml > doc/fontawesome-doc-symbols.tex
```
 * Edit doc/fontawesome-doc.tex with your release notes
 * Run the following command:
```bash
# make doc
```
