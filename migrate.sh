#!/bin/bash



printf "(              )                      (            \n"
printf " )\ )        ( /(      )       (       )\ )  *   )  \n"
printf "(()/( (   (  )\())  ( /(       )\ )   (()/(\` )  /(  \n"
printf " /(_)))\  )\((_)\   )\()) (   (()/(    /(_))( )(_)) \n"
printf "(_)) ((_)((_)_((_) (_))/  )\   /(_))_ (_)) (_(_())  \n"
printf "/ __|\ \ / /| \| | | |_  ((_) (_)) __||_ _||_   _|  \n"
printf "\__ \ \ V / | .\` | |  _|/ _ \   | (_ | | |   | |    \n"
printf "|___/  \_/  |_|\_|  \__|\___/    \___||___|  |_|    \n\n"
printf "How to use: https://github.com/pwilms/git-svn\n\n"


printf "Please pass new GIT REPO: git@foo....\n\n"
read GITREPO
IFS=: read -r GITSERVER GITREPONAME <<< "$GITREPO"
printf "Generating KEY for pushing to GIT\n\n\n"
rm -rf /root/.ssh/id_*
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
cat /root/.ssh/id_rsa.pub
printf "\n\nPlase copy the key above and provide write access to the repo ${GITREPONAME} and script tests auth to ${GITSERVER} <enter>\n\n"
read wait
ssh -T $GITSERVER
printf "\n\nPlease provide old svn path:\n"
read SVNREPO
svn co $SVNREPO /tmp/oldrepo
printf "\nNow we need to match the svn user to git user.\n"
printf "A vim will open with all known authors. Please provide the following format:\n\n"
printf "foo = foo bar <foo@bar.com>"
read wait
cd /tmp/oldrepo
svn log --quiet | grep "^r" | awk '{print $3}' | sort | uniq > /tmp/users.txt
vim /tmp/users.txt
mkdir -p /tmp/git_tmp
cd /tmp/git_tmp
git svn init $SVNREPO --no-metadata
git config svn.authorsfile /tmp/users.txt
git svn fetch
git clone /tmp/git_tmp/ /tmp/project
cd /tmp/project
git remote set-url origin $GITREPO
git push -u origin --all
printf "\n\nMigration is done! Thank you\n"
rm -rf /tmp/*
