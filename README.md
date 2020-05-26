# Automate_Projects

### Purpose: Automate the creation of repositories in my personal Linux machine and in Github and practice the creation of Shell Scripts

### Usage:

Type in terminal the command 'create **name of the repository** _mode of the repository_'

### Setting environment:

#### For this you need to be using a Linux distro
 
1. You will need to create an alias to the command in the .bashrc file like:
```bash
alias create='source path to the start.sh file; creating'
```
This is necessary to use the script in the terminal and save the alias permanently.
It's interesting to see that if you create a script with only a function and run it you will be able to refer to the function as a command and that's why first the alias run the **start.sh** file and then use the function

2. You also need to go to the **start.sh** and set _automating_folder_ to the path where the folder of Automate_Project is store. This is necessary fot the script to know where to look for the environment variables.

3. In the end you need to set up in the file .env in order to make the requests. Like:
```bash
path_to_projects_folder="Path that you store your projects and where you want the script to create the repository"
token="The token the Github API will generate for you"
user="Your user in Github"
```
