#!/bin/bash
REPOS="software dashboard firmware app backend"

for REPO in $REPOS; do
	cd $REPO
	git fetch --all
	git pull
	cd -
done

