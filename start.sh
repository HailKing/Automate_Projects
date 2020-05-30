#!/bin/bash

creating(){
	# Put here the path to the Automating Projects folder
	automating_folder=""

	answer=$(curl -Is  http://www.google.com | head -n 1)
	if [ -z "$answer" ]
	then
		python -c 'print("\33[31mNo connection avaliable")'
		return 0
	fi

	current_directory=$PWD

	if [ "$1" == "-w" ]
	then
		work_mode=true
		repository="$2"
		status="$3"
	else
		work_mode=false
		repository="$1"
		status="$2"
	fi

	cd $path_to_projects_folder
	if [ -d "$repository" ]
	then
		echo "Repository already exists"
	else
		if [ -z "$status" ] || [ $status == "public" ]
		then
			# echo "Defining status as public"
			status=false
		else
			if [ $status == "private" ]
			then
				# echo "Defining status as private"
				status=true
			else
				echo "Repository status must be public or private"
				return 0
			fi
		fi

		cd $automating_folder
		source .env
		python3 connection.py $repository $token $status 
		if [ $? == 0 ]
		then 
			return 0
		fi

		cd $path_to_projects_folder
		
		echo "Creating repository on local machine with name $repository"
		mkdir $repository
		cd $repository

		git init
		git remote add origin https://github.com/$user/$repository.git
		echo "# Project $repository" >> README.md
		git add .
		git commit -m "Initial commit"
		# Basically this line is saying to the remote branch to follow the origin master of my local machine
		git push --set-upstream origin master
		
		if $work_mode
		then
			clear
			code .
		else
			cd $current_directory
		fi
		
	fi
}

