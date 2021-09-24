#!/bin/bash
PREFIX="git@github.com:aaqc"
REPOS="software dashboard firmware app backend"

for REPO in $REPOS; do
	echo $PREFIX/$REPO
	git clone "$PREFIX/$REPO"
done

