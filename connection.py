import requests, sys
from termcolor import colored, cprint

def create_repository():
    repo_name = str(sys.argv[1])
    token = str(sys.argv[2])
    status = str(sys.argv[3])

    headers = {
        'Authorization': 'token ' + token
    }

    data = '{"name": "'f"{repo_name}"'", "auto_init":false, "private": 'f"{status}"'}'

    print("Creating repository on Github")

    response = requests.post('https://api.github.com/user/repos', headers=headers, data=data)

    if 200 <= response.status_code < 300:
        cprint("Repository successfully created", 'green')
        sys.exit(1)
    else:
        cprint("Fail to create repository", 'red')
        sys.exit(0)

if __name__ == "__main__":
    create_repository()
