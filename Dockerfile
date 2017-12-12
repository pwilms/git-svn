FROM ubuntu

RUN apt-get update && apt-get install -y subversion git git-svn vim \
    && echo 'alias svnauthors="svn log --quiet | grep "^r" | awk '{print $3}' | sort | uniq"' >> ~/.bashrc
