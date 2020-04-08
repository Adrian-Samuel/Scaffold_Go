# Go Scaffolding Script

## Purpose

A general purpose script to generate a Go Package with relevant sub packages using Go modules

## Installation

```bash

# Step 1 - Navigate to user directory
cd $HOME

# Step 2 - Clone repository
git clone git@github.com:Adrian-Samuel/Scaffold_Go.git

# Step 3 - Navigate into direcotry
cd Scaffold_Go

# Step 4 - Give file execution permissions
chmod +x scaffold.sh

# Step 5 - Open bash profile
nano ~/.bash_profile

# Step 6- Setup alias to run command
alias gostart=~/go_scaffold/scaffold.sh 

# Step 7 - Exit and save changes to bash profile
ctrl + x # to exit nano
Y # to save changes

# Step 8 - Make changes to bash profile global
source ~/.bash_profile

```

## Run CLI
```
gostart
```

