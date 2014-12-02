FROM ubuntu

RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN   apt-get update
RUN   DEBIAN_FRONTEND=noninteractive apt-get install -y rlwrap alien libaio1

ADD oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
ADD oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

RUN alien -i oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
RUN alien -i oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

RUN rm *.rpm

RUN echo "export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib" >> ~/.bashrc
RUN echo "export PATH=$PATH:/usr/lib/oracle/11.2/client64/bin" >> ~/.bashrc

CMD source /.bashrc; echo "sqlplus $CSTR"; rlwrap sqlplus $CSTR
