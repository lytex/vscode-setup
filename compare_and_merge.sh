#!/bin/bash
echo '' > .empty # git merge-file needs a common file
backup=$1

if [ -e $1 ]; then
    while [ -e $backup ]; do
        backup="$backup.old" # Add .old until the file doesn't exist to avoid overwriting
    done
    echo "file $1 exists. Copying to $backup and merging"
    cp $1 $backup
    git merge-file -L user -L '' -L vscode-setup $1.empty $2
    if (($? != 0)); then
        echo "MERGE CONFLICT Check file $1 or restore from $backup"
    fi
else
    cp $2 $1
fi
