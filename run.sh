 #!/bin/bash         

export UID=$(id -u)
export GID=$(id -g)

export SECRETS_FILE=${PWD}"/config/appsettings.json"

if [ $# -eq 0 ]; then
    docker compose -p devpi -f ./docker-compose.yml up -d
elif [ "$1" == "down" ] ;then
    docker compose -p devpi -f ./docker-compose.yml down
fi