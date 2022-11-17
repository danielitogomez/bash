#!/bin/bash

## --------------------------------------------------------------------------------------------
## - [kubelogs] : Script to output all logs from a namespace.
## - [DevOps] : Dani Gómez (@danielitogomez)
## - [CHANGELOG] : version 1.0.0 Initial script.
## --------------------------------------------------------------------------------------------

# Variables
namespace=$1

# Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`

# Set fonts for Help.
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

# Help function
function help {
  echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
  echo -e "${REV}Basic usage:${NORM} ${REV}bash -x $SCRIPT${NORM} ${REV}namespace"\\n
  echo -e "${REV}Option 1${NORM}  -- Output all logs of the namespace in console and a namespace-logs-pods.txt"\\n
  echo -e "${REV}Option 2${NORM}  -- Display this ${BOLD}help${NORM} message and ${REV}return to option menu${NORM}"\\n
  echo -e "${REV}Option 3${NORM}  -- ${REV}Exit${NORM} form script."\\n
  Operations
}

function logs () {

for i in $(kubectl get pods -n $namespace --no-headers | awk '{print $1}'); do 
        kubectl logs $i -n $namespace | tee "$namespace-logs-pods".txt
done

}

# Function Select Operation

function Operations () {
echo "
What Option you want to do?
1) logs
2) Help
3) Exit
Choose an option:  
"
read -r ans
    case $ans in
    1)
      logs
      echo "Exporting logs from namespace $1..."
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

Operations