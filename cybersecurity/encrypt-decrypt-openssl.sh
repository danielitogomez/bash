#!/bin/bash

## ------------------------------------------------------------------------------------
## - [encrypt/decrypt automation] : Script to automate encrypt and decrypt with openssl.
## - [DevOps] : Dani Gómez (@danielitogomez)
## ------------------------------------------------------------------------------------

# Variables
INPUT_FILE="$PWD/testing.txt"
ENC_FILE="$PWD/testing.enc"
DEC_FILE="$PWD/testing.dec"

# Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`

# Set fonts for Help.
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

# Help function
function help {
  echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
  echo -e "${REV}Basic usage:${NORM} ${REV}bash -x $SCRIPT${NORM} 'keep in mind that you need the input $INPUT_FILE'"\\n
  echo -e "${REV}Option 1${NORM}  -- Encrypt a input file that you need to set."\\n
  echo -e "${REV}Option 2${NORM}  -- Decrypt a encrypt file."\\n
  echo -e "${REV}Option 3${NORM}  -- Display this ${BOLD}help${NORM} message and ${REV}return to option menu${NORM}"\\n
  echo -e "${REV}Option 4${NORM}  -- ${REV}Exit${NORM} form script."\\n
  Operations
}

function verify_openssl {
  which openssl &> /dev/null
  [ $? -ne 0 ]  && echo "openssl is not installed." && exit 1
}

# Logic function to encrypt and decrypt

function encryptData () {
  verify_openssl
  openssl enc -in $INPUT_FILE -out $ENC_FILE -e -aes256 -pbkdf2
}

function decryptData () {
  verify_openssl
  openssl enc -in $ENC_FILE -out $DEC_FILE -d -aes256 -pbkdf2
}

# Function Select Operation

function Operations () {
echo "
What Option you want to do?
1) Start Encryption
2) Start Decryption
3) Help
4) Exit
Choose an option:  
"
read -r ans
    case $ans in
    1)
      encryptData
      echo 'Encrypting ...'
    ;;
    2)
      decryptData
      echo 'Decrypting ...'
    ;;
    3)
      help
    ;;
    4)
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