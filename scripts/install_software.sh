#!bin/bash

# This script install the required software!

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew tap homebrew/science

# Sequence Analysis
brew install --devel samtools
brew install seqtk
brew install bwa
brew install igv

# wget
brew install wget

# Cask
brew install caskroom/cask/brew-cask

# Atom, Mou
brew cask install atom --appdir=/Applications
brew cask install mou --appdir=/Applications

# ql markdown
brew cask install qlmarkdown

# R + Rstudio
brew install R
brew cask install rstudio --appdir=/Applications
