## NetAdmin Tool Convert CIDR to Netmask
Using bash script we can apply logic for convert CIDR to Netmask and using Docker we can run this script into a container.

## Requirements
To have docker installed on your computer.

## How to use?
* Using bash script
```
$ git clone https://github.com/danielitogomez/bash.git
$ cd $PWD/bash/netadmin-tools/CIDR2netmask
$ sh -x CIDR-to-netmask.sh {ip/cidr}
```

* Using Docker
```
$ git clone https://github.com/danielitogomez/bash.git
$ cd $PWD/bash/netadmin-tools/CIDR2netmask
$ sh -x docker_buid_run.sh {ip/cidr}
```

* Using Docker && Make
```
$ git clone https://github.com/danielitogomez/bash.git
$ cd $PWD/bash/netadmin-tools/CIDR2netmask
$ make all arg1=ip/cidr
```
