#!/bin/sh
#
# Dependencies: 
#   wget,tar,git
#
# Assumptions: 
#   1. Current directory is the working directory
#   2. Items in the dependencies have been installed
#   3. Remote Repo has been created
#
#### Definitions n Variables ####
#
git_comment="Project G"
#git_dir_repo=./
#
url_gitproject="git@gitlabee.plus65host.net:ecommerce-sites/test1.git"
url_gitignore="https://lsa-test-01.plus65host.net/f/gitignore1"
#
#### MAIN ####
#
# grab latest wordpress
#wget https://wordpress.org/latest.tar.gz
tar xvfzp latest.tar.gz
#
wget $url_gitignore --directory-prefix=wordpress/
mv wordpress/gitignore1 wordpress/.gitignore
git init wordpress/
cd wordpress/ && git add .
git commit -m "$git_comment" 
git remote add origin $url_gitproject
git branch -a
git push origin master
#
hostremote=lsa-wp-01.plus65host.net
ssh root@$hostremote 'mkdir /bk; cd /bk; wget https://wordpress.org/latest.tar.gz' 
