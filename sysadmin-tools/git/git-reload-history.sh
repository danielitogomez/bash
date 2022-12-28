#!/bin/bash

## --------------------------------------------------------------------------
## - [GitAutomation] : Script to reload git history.
## - [DevOps] : Dani Gómez (@danielitogomez)
## --------------------------------------------------------------------------

SCRIPT=`basename ${BASH_SOURCE[0]}`

# Set fonts for Help.
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

# Help function
function help () {
  echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
  echo -e "${REV}Basic usage:${NORM} ${REV}bash -x $SCRIPT${NORM}"\\n
  echo -e "${REV}Option 1${NORM}  -- Reload entire git history."\\n
  echo -e "${REV}Option 2${NORM}  -- Display this ${BOLD}help${NORM} message and ${REV}return to option menu${NORM}"\\n
  echo -e "${REV}Option 3${NORM}  -- ${REV}Exit${NORM} form script."\\n

  # Calling ops function
  ops

}

# Reload function
function reload_git_history () {
    read -p "Enter the name of temporal branch: " TEMP_BRANCH
        git checkout --orphan $TEMP_BRANCH
        git add -A
    read -p "Enter the commit message: " COMMITMESSAGE
        git commit -am "$COMMITMESSAGE"
    read -p "Enter the master or main branch name to deleted: " MASTERBRANCH
        git branch -D $MASTERBRANCH
    read -p "Enter the name of the branch you want to renamed: " RENAMEBRANCH
        git branch -m $RENAMEBRANCH
        git push -f origin $RENAMEBRANCH
}

# Ops function
function ops () {
    echo "
    What Option you want to do?

    1) Reload git history
    2) Help
    3) Exit

    Choose an option:  
    "
    read -r ans
        case $ans in
        1)
          reload_git_history
          echo "Realoding git history"
        ;;
        2)
          help
        ;;
        3)
          echo 'Exiting'
          exit 0
        ;;
        *)
          echo 'Wrong option'
          exit 1
        ;;
        esac
    }

# Call the function
ops