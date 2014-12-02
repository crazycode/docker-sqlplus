docker-sqlplus
==============

A Docker container for running Oracle's sqlplus utility without having to install it on your host system.

Prerequisites:
--------------
* Docker must be installed on your host system see http://docker.io for details
* The following Oracle RPM files must be downloaded from the Oracle web site into the same directory as the Dockerfile: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
    * oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
    * oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

Building the container:
-----------------------
From the top level directory of this repo:

`docker build -t sqlplus .`

Running sqlplus
---------------
From the top level directory of this repo:

`./sqlplus {connectstring}`

**NOTE:** If you need custom DNS, you will need to edit the sqlplus shell script to pass `-dns={yourdnsIP}` to the docker run command. (put that *before* the sqlplus argument on that line)


Example run:
------------
```bash
./sqlplus username/password@db.mydomain.com:1521/SOMESCHEMA
sqlplus username/password@db.mydomain.com:1521/SOMESCHEMA

SQL*Plus: Release 11.2.0.4.0 Production on Sat Mar 8 15:51:59 2014

Copyright (c) 1982, 2013, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options

SQL>
```

