# Basics Debian Package

# Table of contents

* [Prepare](#prepare)
* [View MAN Page](#view-man-page)
* [Build Package](#build-package)
* [View Package Content](#view-package-content)
* [Extracting](#extracting)
* [Installing Package](#installing-package)
* [Remove Package](#remove-package)

# Prepare

Everything that is in the [src](src) directory is included in the package.

# View MAN Page

If you like to view the man page before you publish it execute the below command: 
~~~
man <path to man page>
~~~

The file name should match the naming scheme `<app-name>.<section>` where section is:

Section | Description
------- | -----------
1 | Executable shell commands
2 | System calls (functions provided by the kernel)
3 | Library calls (functions within program libraries)
4 | Special files (usually found in /dev)
5 | File formats and conventions eg /etc/passwd
6 | Games
7 | Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
8 | System administration commands (usually only for root)
9 | Kernel routines [Non standard]

# Build Package

Set `APP_NAME` and `APP_VERSION` in the [build.sh](build.sh) script and execute the script.

# View Package Content

View contents of a Debian package:
~~~
dpkg -c <file.deb>
~~~

# Extracting

Extract the content of the debian package.
~~~
dpkg-deb -xv <file.deb> </path/to/where/extract>
~~~

# Installing Package

~~~
sudo dpkg -i <path to deb file>
~~~

# Remove Package

~~~
dpkg -r <package name - defined in control>
~~~

If you are unsure, execute
~~~
grep " install " /var/log/dpkg.log | tail
~~~

There you should find the package name e.g.:
~~~
2021-11-13 11:59:40 install ggolbik-basic:all <none> 1.0-1
~~~