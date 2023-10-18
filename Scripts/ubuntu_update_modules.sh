#!/bin/bash
gnome-terminal\
	--tab\
		--title="Module Updates" -- bash -c "cd; cd azerothcore-wotlk; cd modules; cd DungeonRespawn; sudo git pull; cd ..; cd mod-ah-bot; sudo git pull; cd ..; cd mod-autobalance; sudo git pull; cd ..; cd mod-congrats-on-level; sudo git pull; cd ..; cd mod-individual-progression; sudo git pull; cd ..; cd mod-learn-spells; sudo git pull; cd ..; cd mod-racial-trait-swap; sudo git pull; cd ..; cd mod-reagent-bank-account; sudo git pull; cd ..; cd mod-skip-dk-starting-area; sudo git pull; cd ..; cd mod-solo-lfg; sudo git pull; cd ..; cd mod-starter-guild; sudo git pull; cd ..; cd ReusablePotion; sudo git pull; cd ..; cd StatBooster; sudo git pull; cd ..; cd StatBoosterReroller; sudo git pull; cd ..; cd RaidTeleporter; sudo git pull; cd;$SHELL"


