# KeePassX 2.0 Dockerfile
Creates a [KeePassX 2.0](https://www.keepassx.org) binary deb distribution artifact, suitable for installation under Ubuntu (tested with 16.04LTS) and possibly Debian/variants.

Docker image uses [Ubuntu 16.04LTS](https://hub.docker.com/_/ubuntu/) as base with deb package produced using [checkinstall](http://asic-linux.com.mx/~izto/checkinstall/).

## Usage
With Docker installed and working on host system:

```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extracted from container

$ ls -l keepassx_2.0.2-1_amd64.deb
-rw-r--r-- 1 root root 459998 Apr 27 17:01 keepassx_2.0.2-1_amd64.deb

$ sudo dpkg -i keepassx_2.0.2-1_amd64.deb
# installing package to host system...

# KeePassX requires libgcrypt.so.20, lets install
$ sudo apt-get install libgcrypt20
$ keepassx
```

Done.
