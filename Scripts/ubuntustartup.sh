#!/bin/bash
sleep 5

gnome-terminal \
  --tab --title="World Server" -- bash -c "cd; cd Zeppelin-Core; git stash; git pull; git stash pop; cd; cd azerothcore-wotlk/data/sql; rm -rf custom; cd; cp -r Zeppelin-Core/SQL/custom azerothcore-wotlk/data/sql; cd; azerothcore-wotlk/acore.sh run-worldserver; $SHELL" \
  --tab --title="Auth Server" -- bash -c "cd; azerothcore-wotlk/acore.sh run-authserver; $SHELL" \
  --tab --title="Registration Bot" -- bash -c "cd; cd registrationbot && npm start; $SHELL" \
  --tab --title="Chat Bot" -- bash -c "cd; cd chatbot && ./run.sh; $SHELL"
