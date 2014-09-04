# To Install
# Enter the following
#
# mv -i example_bash_profile.sh ~/.bash_profile
#
# Then load a new terminal

echo "Bash Profile Loaded"

# Use icon
export PS1="\w 🍔  "

# Refresh
alias refresh="source ~/.bash_profile"
alias dbx="cd ~/Dropbox/"

# Create New Project and automatically set up directory.
new_project() {
    mkdir $1
    touch $1/Readme.md
    mkdir $1/Data
    mkdir $1/Data/Raw
    mkdir $1/Data/Processed
    mkdir $1/Scripts
    mkdir $1/Results
}


# Open man page in preview.
function pman() {
    man -t ${1} | open -f -a /Applications/Preview.app
}

# Extract any file
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}