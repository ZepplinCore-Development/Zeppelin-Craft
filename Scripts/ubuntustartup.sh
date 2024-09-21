#!/bin/bash
sleep 5

gnome-terminal\
 --tab\
    --title="World Server" -- bash -c "cd; cd Zeppelin-Core; git reset --hard; git pull; chmod +x /Scripts/ubuntustartup.sh /Scripts/ubuntu_update_modules.sh; cd; cd azerothcore-wotlk/data/sql; rm -rf custom; cd; cp -r Zeppelin-Core/SQL/custom azerothcore-wotlk/data/sql; cd; azerothcore-wotlk/acore.sh run-worldserver; $SHELL"
gnome-terminal\
 --tab\
    --title="Auth Server" -- bash -c "cd; azerothcore-wotlk/acore.sh run-authserver; $SHELL"

sleep 15

gnome-terminal\
 --tab\
    --title="Registration Bot" -- bash -c "cd; cd registrationbot && npm start; $SHELL"
gnome-terminal\
 --tab\
    --title="Chat Bot" -- bash -c "cd; cd chatbot && ./run.sh; $SHELL"