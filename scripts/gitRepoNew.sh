#!/bin/bash

NAME="niekwesterhof"
githubPage="https://github.com/"
repo=""
read -r -p "Name of repo: " repo

echo "# $repo" >> README.md
git init
git add README.md
git commit -m "First commit"
git branch -M main
hub create -p
git remote add origin "$githubPage$NAME/$repo"
git push -u origin main

touch .gitignore
echo ".git" >> .gitignore
echo ".gitignore" >> .gitignore
