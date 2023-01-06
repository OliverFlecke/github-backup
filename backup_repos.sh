#!/usr/bin/env sh

# Usage: Call in a directory to backup all of your repositories on Github.
# This require you to have the github-cli tool installed on your machine and be 
# logged in to the account you want to backup repos from.
# Both public, private, and forked repos will be included.

echo "Backing up repos"

repos=$(gh repo list --limit 200 --json name,owner | jq '.[] | .name' | tr -d '"')

for repo in $repos;
do
	echo "Backing up: $repo";
	
	if [ -d "$repo" ]
	then
		echo "Repo already exists. Pulling..."

		cd $repo
		git pull
		cd ..
	else
		echo -n "Repo not found locally, cloning from Github... "
		gh repo clone $repo -- -q
		if [ $? -ne 0 ] 
		then
			echo "Failed to clone $repo"
		else
			echo "Cloning done"
		fi
	fi
done

