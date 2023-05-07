#!/bin/bash
gnome-terminal\
	--tab\
		--title="World Server" -- bash -c "cd; cd Zeppelin-Core; git pull; cd; cd azerothcore/data/sql; rm -r custom; cd; cp -r Zeppelin-Core/SQL/custom azerothcore/data/sql; cd; azerothcore/acore.sh run-worldserver; $SHELL"
gnome-terminal\
	--tab\
		--title="Auth Server" -- bash -c "cd; azerothcore/acore.sh run-authserver; $SHELL"
gnome-terminal\
	--tab\
		--title="Registration Bot" -- bash -c "cd; cd registrationbot && npm start; $SHELL"
gnome-terminal\
	--tab\
		--title="Chat Bot" -- bash -c "cd; cd chatbot && ./run.sh; $SHELL"

