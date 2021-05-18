#!/usr/bin/env sh
#
# Copyright (c) 2021 Oracle and/or its affiliates.
#

echo `ls -lah /github/workspace`

echo "Looking back at the previous ${INPUT_NUMBER_COMMITS_BACK} commits"
echo "::set-output name=all_files_changed::`git diff --name-only HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"
echo "::set-output name=added_files::`git diff --name-only --diff-filter=A HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"
echo "::set-output name=copied_files::`git diff --name-only --diff-filter=C HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"
echo "::set-output name=deleted_files::`git diff --name-only --diff-filter=D HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"
echo "::set-output name=modified_files::`git diff --name-only --diff-filter=M HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"
echo "::set-output name=renamed_files::`git diff --name-only --diff-filter=R HEAD~$INPUT_NUMBER_COMMITS_BACK..HEAD`"