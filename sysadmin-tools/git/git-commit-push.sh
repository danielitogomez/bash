#!/bin/bash

echo "Select the option for commit lint"

select opt in feat fix ci doc; do

  case $opt in
    feat)
      read -p "Enter the branch name: " BRANCHNAME
      git checkout -b $BRANCHNAME
      git status
      read -p "Enter the code that you want commit: " CODECOMMIT
      git add $CODECOMMIT
      read -p "Enter the commit message: " COMMITMESSAGE
      read -p "Enter the number of the jira card: " JIRACARD
      git commit -am "feat: $COMMITMESSAGE ($JIRACARD)"
      read -p "Do you want to push (y/n): " PUSH
      if [ $PUSH == y || $PUSH == yes || $PUSH == YES ]; then
        echo "Pushing origin $BRANCHNAME"
        git push origin $BRANCHNAME
      elif [ $PUSH == n || $PUSH == no || $PUSH == NO ]; then
        echo "Canceling the push"
        exit 1
      else
        echo "Unknow option"
        exit 1
      fi
      ;;
    fix)
      read -p "Enter the first number: " 
      read -p "Enter the second number: " n2
      echo "$n1 - $n2 = $(($n1-$n2))"
      ;;
    ci)
      read -p "Enter the first number: " n1
      read -p "Enter the second number: " n2
      echo "$n1 * $n2 = $(($n1*$n2))"
      ;;
    doc)
      read -p "Enter the first number: " n1
      read -p "Enter the second number: " n2
      echo "$n1 / $n2 = $(($n1/$n2))"
      ;;
    quit)
      break
      ;;
    *) 
      echo "Invalid option"
      ;;
  esac
done



#echo "First, doing git pull into master"
#
#
#echo "Enter your branch name"
#read BRANCHNAME
#
#git checkout -b "$BRANCHNAME"
#
#git add .
#
#echo "Enter the commit message:"
#read commitMessage
#
#git commit -m "$commitMessage"
#
#echo "Enter the name of the branch:"
#read branch
#
#git push origin $branch
#
#read