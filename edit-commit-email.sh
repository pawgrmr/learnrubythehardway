#!/bin/sh

git filter-branch --env-filter '

OLD_NAME="Manasi Salvi"
CORRECT_NAME="wickinot"
CORRECT_EMAIL="27719504+wickinot@users.noreply.github.com"

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi 
' -f --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'

#PULL REQUEST ONE
# rewrite code to make changes to name and email in one pass
# open new branch
# make changes
# make pull request (to automaton ) to merge changes 

#PULL REQUEST TWO
#prompts:
#what is the old name
#what is the new name (CHANGE CODE ABOVE FROM 'CORRECT' NAME OR EMAIL TO 'NEW' as well)
#what is the old email
#what is the new email


git filter-branch --env-filter '

OLD_EMAIL="INSERT OLD EMAIL HERE"
OLD_NAME="INSERT OLD NAME HERE"
NEW_NAME="binman"
NEW_EMAIL="9065232+binman@users.noreply.github.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" || "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" || "$GIT_AUTHOR_NAME" = "$OLD_NAME"]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' -f --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'
