FROM ubuntu

RUN apt-get update && apt-get install -y subversion git git-svn vim 
RUN  echo "    ServerAliveInterval 15" >> /etc/ssh/ssh_config
RUN  echo "    ServerAliveCountMax 60" >> /etc/ssh/ssh_config
COPY migrate.sh /usr/bin/migrate
