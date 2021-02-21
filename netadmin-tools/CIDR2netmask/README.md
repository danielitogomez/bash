## NetAdmin Tool Convert CIDR to Netmask
Using bash script we can apply logic for convert CIDR to Netmask and using Docker we can run this script independently of our Operating System.

## Requirements
To have docker installed on your computer.

## How to use?
* Using bash script
```
$ git clone
$ sh -x CIDR-to-netmask.sh {ip/cidr}
```

* Using Docker
```
$ git clone
$ sh -x docker_buid_run.sh {ip/cidr}
```

* Using Docker && Make
```
$ git clone
$ make all arg1=ip/cidr
```
