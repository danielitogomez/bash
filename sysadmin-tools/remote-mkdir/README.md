## Bash script for create directory to remote server
Creating a directory to remote server

## Requirements
To have [bash shell](https://www.gnu.org/software/bash/). All kinds of Linux distros should be able to run it.<br/>
To have [Netcat tool](http://netcat.sourceforge.net/). To test that you are able to reach port 22 on the remote server.<br/>
To have a pair ssh private/public key. Review this [docu](https://www.ssh.com/academy/ssh/public-key-authentication).

## Steps
```
* git clone https://github.com/danielitogomez/bash.git
* cd $PWD/bash/sysadmin-tools/remote-mkdir
* ./remote-mkdir.sh
```