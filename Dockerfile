FROM ubuntu

apt-get update && apt-get install -y subversion git git-svn vim 
RUN echo 'alias svnauthors="svn log --quiet | grep "^r" | awk '{print $3}' | sort | uniq"' >> ~/.bashrc
