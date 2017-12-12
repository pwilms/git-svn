# git-svn

Dockerimage to move svn trunk to git repo with history and propper authors


## Preps:

- need docker
- need git to migrate to a server (tested with gitlab, should work with any)


## How to proceed:

- create a test repo
- run docker run -it pwilms/git-svn migrate.sh
- the script guides you through the following steps:

1. enter new git repo url (ssh)
2. you have to copy the public ssh key to your repo as deployment key with write access 
3. script will check the access
4. enter old svn url to the trunk of the project
4.1 you may have to enter valid credentials for checkout the svn
5. the script will export all users of svn in a text file and opens a vim you need to format the names:
   exported:
   ```
   doe 
   ``` 

   formatted:
   ```
   doe = john doe <john@doe.example.com>
   ```
6.  close with   ```:wq```    :laughing:
7. old repo is checkout with git svn and matches the users :pray:
8. a clean copy will be checkout from local migration repo 
9. repo is pushed automatically against your new git repo
10. DONE!  :tada::tada::tada::tada:




## Todo:

- clean migrate script
- sanity checks
