#!/bin/bash

creating(){
	# Put here the path to the Automating Projects folder
	automating_folder=""

	current_directory=$PWD

	cd
	cd $automating_folder
	python3 connection.py $1 $token $status 
	if [ $? == 0 ]
	then 
		return 0
	fi
	source .env

	cd $path_to_projects_folder
	if [ -d "$1" ]
	then
		echo "Repository already exists"
	else
		if [ -z "$2" ] || [ $2 == "public" ]
		then
			# echo "Defining status as public"
			status=false
		else
			if [ $2 == "private" ]
			then
				# echo "Defining status as private"
				status=true
			else
				echo "Repository status must be public or private"
				return 0
			fi
		fi
		
		echo "Creating repository on local machine with name $1"
		mkdir $1
		cd $1

		git init
		git remote add origin https://github.com/$user/$1.git
		echo "# Project $1" >> README.md
		git add .
		git commit -m "Initial commit"
		git push --set-upstream origin master
		
		gnome-terminal
		code .
	fi
	
	cd $current_directory
	return 1
}

