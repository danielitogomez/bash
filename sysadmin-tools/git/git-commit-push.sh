#!/bin/bash

## --------------------------------------------------------------------------
## - [GitAutomation] : Script to automate git with standards.
## - [DevOps] : Dani Gómez (@danielitogomez)
## --------------------------------------------------------------------------

# Functions

add_function () {
    read -p "Enter the branch name: " BRANCHNAME
                git checkout -b $BRANCHNAME
                git status
    read -p "Enter the code that you want commit: " CODECOMMIT
                git add $CODECOMMIT
    read -p "Enter the commit message: " COMMITMESSAGE
    read -p "Enter the number of the jira card: " JIRACARD
}

push_function () {
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
}

# Case logic

PS3="Select the operation: "

echo "Hello hello... select the option to commitlint"

select opt in feat fix ci docs style refactor perf test build chore revert quit; do

  case $opt in
    feat)
        add_function
                git commit -am "feat: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    fix)
        add_function
                git commit -am "fix: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    ci)
        add_function
                git commit -am "ci: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    docs)
        add_function
                git commit -am "docs: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    style)
        add_function
                git commit -am "style: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    refactor)
        add_function
                git commit -am "refactor: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    perf)
        add_function
                git commit -am "perf: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    test)
        add_function
                git commit -am "test: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    build)
        add_function
                git commit -am "build: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    chore)
        add_function
                git commit -am "chore: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    revert)
        add_function
                git commit -am "revert: $COMMITMESSAGE ($JIRACARD)"
        push_function
      ;;
    quit)
      echo "Bye Bye..."
      break
      ;;
    *) 
      echo "Invalid option $REPLY - please select 1 to 12"
      ;;
  esac
done