#!/bin/bash
sleep 5

gnome-terminal \
  --tab --title="World Server" -- bash -c "cd; cd Zeppelin-Core; git reset --hard; git pull; chmod +x /home/justurn/Zeppelin-Core/Scripts/ubuntustartup.sh /home/justurn/Zeppelin-Core/Scripts/ubuntu_update_modules.sh; cd; cd azerothcore-wotlk/data/sql; rm -rf custom; cd; cp -r Zeppelin-Core/SQL/custom azerothcore-wotlk/data/sql; cd; azerothcore-wotlk/acore.sh run-worldserver; exec bash" \
  --tab --title="Auth Server" -- bash -c "cd; azerothcore-wotlk/acore.sh run-authserver; exec bash" \
  --tab --title="Registration Bot" -- bash -c "cd; cd registrationbot && npm start; exec bash" \
  --tab --title="Chat Bot" -- bash -c "cd; cd chatbot && ./run.sh; exec bash"
