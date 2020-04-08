#!/usr/bin/env bash

if [[ $(command -v go) == "" ]];then
 
  echo "You don't have Go installed!"
  
  echo "Redirecting you to the Go installation page..."

  open https://golang.org/doc/install
  exit
  
fi


# variable initilisation
dirList=()
counter=0

# input prompts

read -p 'What is your github username? ' githubUser

read -p 'What is the name of your project ' projectName

read -p 'What is the name of your main file ' mainFile

read -p 'How many directories will this contain? ' dirCount

# selecting packages based on user input

while [ $dirCount -gt $counter ] 
do 
  counter=$(($counter + 1))

  read -p "Name of child package $counter " subPackageName
  
   if ! [[ "$subPackageName" =~ ^[A-Z] ]]; then
        echo "Captilizing package name $subPackageName!"
        subPackageName=`echo $subPackageName | awk '{print toupper(substr($0,0, 1))substr($0,2);}'`
    fi
    dirList+=($subPackageName)
done

# resetting counter

counter=0

# defining main package url

packageURL=github.com/$githubUser/$projectName

# generating main package file and go.mod file

# Main File name

mainGoFile="$mainFile.go"; 

mkdir $projectName; 

cd $projectName;

touch $mainGoFile; 

echo 'package main' >> $mainGoFile

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
