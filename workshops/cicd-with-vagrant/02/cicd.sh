#!/bin/bash
cat << EOF

  _____              ____              _            __ _               _____ _____     _______ _____  
 |  __ \            / __ \            | |          / _| |             / ____|_   _|   / / ____|  __ \ 
 | |  | | _____   _| |  | |_ __  ___  | |     ___ | |_| |_   ______  | |      | |    / / |    | |  | |
 | |  | |/ _ \ \ / / |  | | '_ \/ __| | |    / _ \|  _| __| |______| | |      | |   / /| |    | |  | |
 | |__| |  __/\ V /| |__| | |_) \__ \ | |___| (_) | | | |_           | |____ _| |_ / / | |____| |__| |
 |_____/ \___| \_/  \____/| .__/|___/ |______\___/|_|  \__|           \_____|_____/_/   \_____|_____/ 
                          | |                                                                         
                          |_|                                                                         
EOF

export VIRTUALENV_ALWAYS_COPY=1

# Options
CICD="true"
GIT_URL="https://github.com/devopsloft/devopsloft"


if [[ "${CICD}" == "true" ]]; then
    echo -e "\e[92mStarting CI CD Tasks..\e[0m\n"

    echo -e "**********"
    echo -e "** CODE **"
    echo -e "**********\n"
    git clone "${GIT_URL}"

    echo -e "\e[101mDo You want to delete The ENV?\e[0m\n"
    echo -e "Press y for true"
    read -r INPUT
    if [[ "$INPUT" == "y" ]]; then
        echo "Stopping the app"
        sudo fuser -n tcp -k 5000
        sudo docker stop app
        sudo docker rm app
        sudo docker rmi devopsloft/app
        echo "Deleting Project Files"
        rm -rf devopsloft
    fi
fi