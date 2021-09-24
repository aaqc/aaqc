#!/bin/bash
REPOS="software dashboard firmware app backend"

for REPO in $REPOS; do
	cd $REPO
	git fetch -A
	git pull
	cd -
done

