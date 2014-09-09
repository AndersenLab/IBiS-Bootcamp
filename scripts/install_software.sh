#!bin/bash

# This script install the required software!

# Install Homebrew, if you haven't as a part of the lecture
#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#brew tap homebrew/science

# Cask
#brew install caskroom/cask/brew-cask

# Sequence Analysis
brew install --devel samtools
brew install bcftools
brew install bwa
brew install igv

# wget
brew install wget

# Atom
brew cask install atom --appdir=/Applications

# ql markdown
brew cask install qlmarkdown

# R + Rstudio
#brew install R
brew cask install rstudio --appdir=/Applications
