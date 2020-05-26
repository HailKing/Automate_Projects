#!/bin/bash

creating(){
	# Put here the path to the Automating Projects folder
	automating_folder=""

	cd
	cd $automating_folder
	source .env

	cd $path_to_projects_folder
	if [ -d "$1" ]
	then
		echo "Repository already exists"
	else
		epository=$1
		status=$2
		current_directory=$PWD
		echo "Creating folder in path_to_projects_folder"
		mkdir $1
		cd $1
		if [ -z "$status" ]
		then
			echo "Defining status as public"
			status=false
		else
			echo "Defining status as private"
			status=true
		fi

		git init

		response=$(curl -H "Authorization: token $token" --data '{"name": "'"${1}"'", "auto_init":false, "private": '$status'}'  https://api.github.com/user/repos)

		git remote add origin https://github.com/$user/$1.git
		echo "# Project $1" >> README.md
		git add .
		git commit -m "Initial commit"
		git push --set-upstream origin master
	fi

	cd $current_directory
}

