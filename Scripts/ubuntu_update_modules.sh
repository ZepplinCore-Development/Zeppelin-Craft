#!/bin/bash
gnome-terminal\
	--tab\
		--title="Module Updates" -- bash -c "cd; cd azerothcore-wotlk; cd modules;
		cd mod-reagent-bank-account; sudo git pull; cd ..;
		cd mod-autobalance; sudo git pull; cd ..;
		cd mod-accountbound; sudo git pull; cd ..;
		cd DungeonRespawn; sudo git pull; cd ..;
		cd multiple_specializations; sudo git pull; cd ..;
		cd mod-ah-bot; sudo git pull; cd ..;
		cd RaidTeleporter; sudo git pull; cd ..;
		cd mod-starter-guild; sudo git pull; cd ..;
		cd mod-skip-dk-starting-area; sudo git pull; cd ..;
		cd mod-individual-progression; sudo git pull; cd ..;
		cd mod-racial-trait-swap; sudo git pull; cd ..;
		cd mod-solo-lfg; sudo git pull; cd ..;
		cd ReusablePotion; sudo git pull; cd ..;$SHELL"


