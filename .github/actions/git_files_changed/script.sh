#!/usr/bin/env sh
#
# Copyright (c) 2021 Oracle and/or its affiliates.
#

if [ ${INPUT_DETECT_NUM_COMMITS_BACK} = 'true' ]
then
  NUM_COMMITS_BACK=`git status | grep "Your branch is" | sed -En "s/Your branch is ahead of .* by ([0-9]+) commit.*/\1/p"`
else
  NUM_COMMITS_BACK=$NUM_COMMITS_BACK
fi
echo "Git status:\n`git status`"
echo "Looking back at the previous ${NUM_COMMITS_BACK} commits"

echo "all_files_changed: `git diff --name-only HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=all_files_changed::`git diff --name-only HEAD~$NUM_COMMITS_BACK..HEAD`"

echo "added_files: `git diff --name-only --diff-filter=A HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=added_files::`git diff --name-only --diff-filter=A HEAD~$NUM_COMMITS_BACK..HEAD`"

echo "copied_files: `git diff --name-only --diff-filter=C HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=copied_files::`git diff --name-only --diff-filter=C HEAD~$NUM_COMMITS_BACK..HEAD`"

echo "deleted_files: `git diff --name-only --diff-filter=D HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=deleted_files::`git diff --name-only --diff-filter=D HEAD~$NUM_COMMITS_BACK..HEAD`"

echo "modified_files: `git diff --name-only --diff-filter=M HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=modified_files::`git diff --name-only --diff-filter=M HEAD~$NUM_COMMITS_BACK..HEAD`"

echo "renamed_files: `git diff --name-only --diff-filter=R HEAD~$NUM_COMMITS_BACK..HEAD`"
echo "::set-output name=renamed_files::`git diff --name-only --diff-filter=R HEAD~$NUM_COMMITS_BACK..HEAD`"