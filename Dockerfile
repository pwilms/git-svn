FROM ubuntu

RUN apt-get update && apt-get install -y subversion git git-svn vim 
COPY migrate.sh /
