#!/bin/bash
gnome-terminal\
	--tab\
		--title="World Server" -- bash -c "cd; cd Zeppelin-Core; git pull; cd; cp -r Zeppelin-Core/custom azerothcore-wotlk/data/sql; cd; azerothcore-wotlk/acore.sh run-worldserver; $SHELL"
gnome-terminal\
	--tab\
		--title="Auth Server" -- bash -c "azerothcore-wotlk/acore.sh run-authserver; $SHELL"
gnome-terminal\
	--tab\
		--title="Registration Bot" -- bash -c "cd registrationbot && npm start; $SHELL"
gnome-terminal\
	--tab\
		--title="Chat Bot" -- bash -c "cd chatbot && ./run.sh; $SHELL"
