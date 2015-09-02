#!/bin/bash
remoteHost=https://bitbucket.org
remoteDir=[Repository directory]
remoteRepos=[Repository project]
tempDir="temp"
localDir="www"

echo "Enter username of Bitbucket and press [ENTER]:"
read remoteUser
echo "Enter password of Git user and press [ENTER]:"
read -s remotePass

cloneCmd="git clone $remoteUser:$remotePass@$remoteHost/$remoteDir"
cloneCmd=$cloneCmd"/$remoteRepos $tempDir"
echo -e "Cloning: \n"
$cloneCmd

if [ "$?" = "0" ]; then
   rmGitCmd="rm -rf "$tempDir"/.git*"
   $rmGitCmd
   rm -rf $localDir"/*" $localDir"/.ht*"
   cp -r $tempDir"/." $localDir
   rm -rf $tempDir
   echo -e "Complete"
else
   echo -e "Can not access to Bitbucket"
   exit 1
fi
