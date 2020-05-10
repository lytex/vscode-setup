#!/bin/bash
echo '' > .empty # git merge-file needs a common file
if [ -e $1 ]; then
    echo "file $1 exists. Copying to $1.old and merging"
    cp $1 $1.old
    git merge-file -L user -L '' -L vscode-setup $1 .empty $2
else
    cp $2 $1
fi
