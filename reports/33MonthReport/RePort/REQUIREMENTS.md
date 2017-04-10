Requirements to use ReScience-submission Template

# On Ubuntu 14.04 x64

## Quick Cabal Method

Following  https://github.com/jgm/pandoc/blob/master/INSTALL.md#quick-cabal-method
```
$ sudo apt-get install haskell-platform
$ cabal update
$ cabal install pandoc-crossref
```
** it takes about  an hour to do the installation

add in .bashrc the following line
```
export PATH=$HOME/.cabal/bin:$PATH
```




##  Failed Installation
```
sudo dpkg -i pandoc-1.19.2.1-1-amd64.deb
```

but only has pandoc and
pandoc           pandoc-citeproc  
Therefore I unstillad it with
```
sudo dpkg --remove pandoc
```
