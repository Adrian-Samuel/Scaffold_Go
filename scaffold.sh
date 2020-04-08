#!/usr/bin/env bash

# variable initilisation
dirList=()
counter=0

# input prompts

read -p 'What is your github username? ' githubUser

read -p 'What is the name of your project ' projectName

read -p 'How many directories will this contain? ' dirCount

# selecting packages based on user input

while [ $dirCount -gt $counter ] 
do 
  counter=$(($counter + 1))
  read -p "Name of sub package $counter " subPackageName
  dirList+=($subPackageName)
 
done

# resetting counter

counter=0

# defining main package url

packageURL=github.com/$githubUser/$projectName

# generating main package file and go.mod file

mkdir $projectName; 

cd $projectName;

touch main.go; 

echo 'package main' >> main.go

go mod init $packageURL

# generating sub packages, main file and install them

while [ ${#dirList[@]} -gt $counter ]
do
  localPackageName=${dirList[$counter]}
  
  mkdir $localPackageName
  
  cd $localPackageName
  
  echo "package $localPackageName" >> "$localPackageName.go"
  
  cd ..
  
  go install $packageURL/$localPackageName
  
  counter=$(($counter + 1))
done

echo "Go scaffolding finished! Enjoy Building!"