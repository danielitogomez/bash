#!/bin/bash

set -e

export IP_CIDR="$1"

#Variables

function set_variables {
export cidr_32=255.255.255.255
export cidr_31=255.255.255.254
export cidr_30=255.255.255.252
export cidr_29=255.255.255.248
export cidr_28=255.255.255.240
export cidr_27=255.255.255.224
export cidr_26=255.255.255.192
export cidr_25=255.255.255.128
export cidr_24=255.255.255.0
export cidr_23=255.255.254.0
export cidr_22=255.255.252.0
export cidr_21=255.255.248.0
export cidr_20=255.255.240.0
export cidr_19=255.255.224.0
export cidr_18=255.255.192.0
export cidr_17=255.255.128.0
export cidr_16=255.255.0.0
export cidr_15=255.254.0.0
export cidr_14=255.252.0.0
export cidr_13=255.248.0.0
export cidr_12=255.240.0.0
export cidr_11=255.224.0.0
export cidr_10=255.192.0.0
export cidr_9=255.128.0.0
export cidr_8=255.0.0.0
export cidr_7=254.0.0.0
export cidr_6=252.0.0.0
export cidr_5=248.0.0.0
export cidr_4=240.0.0.0
export cidr_3=224.0.0.0
export cidr_2=192.0.0.0
export cidr_1=128.0.0.0
}

#Function to detect CIDR

function cidr_detect {
export IP=$(echo $IP_CIDR | cut -d"/" -f1)
export CIDR=$(echo $IP_CIDR | cut -d"/" -f2)
export TESTING_CIDR=$(echo $CIDR | grep "\.")
	if [[ "$TESTING_CIDR" != "" ]]; then
	    echo "Value not valid"
	    exit 1
	fi
	if [[ "$CIDR" -gt "32" ]] || [[ "$CIDR" -lt "1" ]] || [[ "$CIDR" == "" ]]
	then
		echo "Value not valid"
		exit 1
	fi
}

#Function to convert CIDR /32 to 255.255.255.255

function print_subnet {
echo "echo $IP/\$cidr"_$CIDR | bash

}

#Function's call

set_variables
cidr_detect
print_subnet