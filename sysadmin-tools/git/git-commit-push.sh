#!/bin/bash

PS3="Select the operation: "

echo "Hello hello... select the option to commitlint"

select opt in feat fix ci doc quit; do

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
        if [ "$PUSH" == y ] || [ "$PUSH" == yes ] || [ "$PUSH" == YES ]; then
            echo "Pushing origin $BRANCHNAME"
                git push origin $BRANCHNAME && exit 0
        elif [ "$PUSH" == n ] || [ "$PUSH" == no ] || [ "$PUSH" == NO ]; then
            echo "Canceling the push"
            exit 1
        else
            echo "Unknow option"
            exit 1
        fi
      ;;
    fix)
      read -p "Enter the branch name: " BRANCHNAME
                git checkout -b $BRANCHNAME
                git status
      read -p "Enter the code that you want commit: " CODECOMMIT
                git add $CODECOMMIT
      read -p "Enter the commit message: " COMMITMESSAGE
      read -p "Enter the number of the jira card: " JIRACARD
                git commit -am "fix: $COMMITMESSAGE ($JIRACARD)"
      read -p "Do you want to push (y/n): " PUSH
        if [ "$PUSH" == y ] || [ "$PUSH" == yes ] || [ "$PUSH" == YES ]; then
            echo "Pushing origin $BRANCHNAME"
                git push origin $BRANCHNAME && exit 0
        elif [ "$PUSH" == n ] || [ "$PUSH" == no ] || [ "$PUSH" == NO ]; then
            echo "Canceling the push"
            exit 1
        else
            echo "Unknow option"
            exit 1
        fi
      ;;
    ci)
      read -p "Enter the branch name: " BRANCHNAME
                git checkout -b $BRANCHNAME
                git status
      read -p "Enter the code that you want commit: " CODECOMMIT
                git add $CODECOMMIT
      read -p "Enter the commit message: " COMMITMESSAGE
      read -p "Enter the number of the jira card: " JIRACARD
                git commit -am "ci: $COMMITMESSAGE ($JIRACARD)"
      read -p "Do you want to push (y/n): " PUSH
        if [ "$PUSH" == y ] || [ "$PUSH" == yes ] || [ "$PUSH" == YES ]; then
            echo "Pushing origin $BRANCHNAME"
                git push origin $BRANCHNAME && exit 0
        elif [ "$PUSH" == n ] || [ "$PUSH" == no ] || [ "$PUSH" == NO ]; then
            echo "Canceling the push"
            exit 1
        else
            echo "Unknow option"
            exit 1
        fi
      ;;
    doc)
      read -p "Enter the branch name: " BRANCHNAME
                git checkout -b $BRANCHNAME
                git status
      read -p "Enter the code that you want commit: " CODECOMMIT
                git add $CODECOMMIT
      read -p "Enter the commit message: " COMMITMESSAGE
      read -p "Enter the number of the jira card: " JIRACARD
                git commit -am "doc: $COMMITMESSAGE ($JIRACARD)"
      read -p "Do you want to push (y/n): " PUSH
        if [ "$PUSH" == y ] || [ "$PUSH" == yes ] || [ "$PUSH" == YES ]; then
            echo "Pushing origin $BRANCHNAME"
                git push origin $BRANCHNAME && exit 0
        elif [ "$PUSH" == n ] || [ "$PUSH" == no ] || [ "$PUSH" == NO ]; then
            echo "Canceling the push"
            exit 1
        else
            echo "Unknow option"
            exit 1
        fi
      ;;
    quit)
      echo "Bye Bye..."
      break
      ;;
    *) 
      echo "Invalid option $REPLY - please select 1 to 5"
      ;;
  esac
done