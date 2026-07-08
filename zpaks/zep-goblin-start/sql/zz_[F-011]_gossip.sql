-- [F-011] gossip_menu/option + npc_text (NPC gossip) remapped to fresh blocks. migrate_gossip.py.

DELETE FROM npc_text WHERE ID BETWEEN 500000 AND 500145;
INSERT INTO npc_text (ID,text0_0,text0_1,BroadcastTextID0,lang0,Probability0,em0_0,em0_1,em0_2,em0_3,em0_4,em0_5,text1_0,text1_1,BroadcastTextID1,lang1,Probability1,em1_0,em1_1,em1_2,em1_3,em1_4,em1_5,text2_0,text2_1,BroadcastTextID2,lang2,Probability2,em2_0,em2_1,em2_2,em2_3,em2_4,em2_5,text3_0,text3_1,BroadcastTextID3,lang3,Probability3,em3_0,em3_1,em3_2,em3_3,em3_4,em3_5,text4_0,text4_1,BroadcastTextID4,lang4,Probability4,em4_0,em4_1,em4_2,em4_3,em4_4,em4_5,text5_0,text5_1,BroadcastTextID5,lang5,Probability5,em5_0,em5_1,em5_2,em5_3,em5_4,em5_5,text6_0,text6_1,BroadcastTextID6,lang6,Probability6,em6_0,em6_1,em6_2,em6_3,em6_4,em6_5,text7_0,text7_1,BroadcastTextID7,lang7,Probability7,em7_0,em7_1,em7_2,em7_3,em7_4,em7_5,VerifiedBuild) VALUES
  (500002,'Gerk, Burr, Dargath: all gone... It''s just MacKellar and I left out here. I hope you''ve brought some good news.','',0,0,1,0,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500000,'','It is not yet your time. I shall aid your journey back to the realm of the living... for a price.',0,0,100,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500001,'Rest your weary bones for a spell.','Rest your weary bones for a spell.',0,1,100,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500098,'For now we cannot return to Kalimdor. Only Chawg is going back with you.  Another ship is coming to take the rest of us on to our destination.$B$BThe greatest adventure is yet ahead of you, $N. Our paths will cross again, and when they do, the fate of the world will be in your hands!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500115,'You did it! We''re saved!','You did it! We''re saved!',0,0,1,0,4,0,0,0,0,'Are we really finally going to Azshara? Is there a volcano there, too?','Are we really finally going to Azshara? Is there a volcano there, too?',0,0,1,0,6,0,0,0,0,'How can I ever thank you, $N?','How can I ever thank you, $N?',0,0,1,0,6,0,0,0,0,'I''d keep my eyes and ears open if I were you. There''s a rumor going around that you caused both Mount Kajaro and the Lost Isles volcanoes to explode.$B$BCrazy, I know. But people will gossip about anything and love to tear down their heroes, especially if there''s a chance for profit and promotion.','I''d keep my eyes and ears open if I were you. There''s a rumor going around that you caused both Mount Kajaro and the Lost Isles volcanoes to explode.$B$BCrazy, I know. But people will gossip about anything and love to tear down their heroes, especially if there''s a chance for profit and promotion.',0,0,1,0,25,0,0,0,0,'Let''s leave dock before the volcano destroys us all!','Let''s leave dock before the volcano destroys us all!',0,0,1,0,5,0,0,0,0,'Ready to go when you are, $g sir : ma''am;!','Ready to go when you are, $g sir : ma''am;!',0,0,1,0,66,0,0,0,0,'I don''t know. I think I''m going to miss this place. We had some pretty good times here.','I don''t know. I think I''m going to miss this place. We had some pretty good times here.',0,0,1,0,6,0,0,0,0,'I have an idea... this time let''s not wander through a naval battle between the Alliance and the Horde.$B$BI''m just saying.','I have an idea... this time let''s not wander through a naval battle between the Alliance and the Horde.$B$BI''m just saying.',0,0,1,0,1,0,0,0,0,0),
  (500110,'How dare they transform our fellow beings into zombies and turn them against us ?!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500114,'I''m not talking to you right now. If I were you, I wouldn''t count on getting a raise this year, $N.','',0,0,1,0,25,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500107,'I just wanted to say thanks, $N.$B$BI''m sure glad that the doc here was able to shock you back to life or we''d all be dead by now, or worse!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500100,'','What a mess! How am I going to be able to turn that?$B$BAnd really ... goblin zombies? !!',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500120,'','Looks like this is it, boss-$g man : lady;. It''s been a real honor. I''m sure we''ll see each other again real soon.',0,0,1,0,1,0,6,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500141,'','Looks like it''s time to say goodbye, $gpatron:patronne;. It was a real honor. I''m sure we''ll meet again very soon.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500072,'','$N, you gotta get in there and save our people!',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500078,'','Just when I thought it couldn''t get any worse....',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500076,'We''re in a pretty tight pickle here, $N.','',0,0,1,0,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500079,'This Town-In-A-Box is a remarkable feat of engineering!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500077,'','I definitely did NOT sign up for this! Pygmies, zombies... Hobart better give me a huge raise!',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500081,'','I''m so glad that you asked, $N!$B$BNo one ever asks how stuff works. It''s just here, gimme that, I''m gonna blow stuff up. Or, don''t bore me with the details, just let me point and shoot. Or, worse yet, who cares how it works, is it a bigger explosion than last time?$B$BI swear sometimes, I could just scream, you know? It''s like I''m always doing all of Hobart''s work for him, but I never get any of the credit! I have got to be the most underappreciated, overworked, and underpaid tinkers assistant ever!$B$BWait, what did you ask about?',0,0,1,0,1,0,5,0,6,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500082,'Yes, yes, that''s all very interesting, but as you can see here, we''re in a fight for our lives, and these pygmies are the least of our problems compared to what''s inside that cave!$B$BWhere''s my worthless assistant when I need her the most? Probably off being lazy somewhere and complaining that no one asks her how her day is going....','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500083,'Your friends were all taken prisoner by Trade Prince Gallywix while the volcano was exploding.$B$BWe are going to have to deal with the Alliance quickly if we''re to rescue them and get off of this island.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500085,'','The blood of the fallen cries out for justice.',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500084,'','You really have to do something for these pygmies, $NÂ !',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500086,'Thrall Hall, $N! Here to help kill some misguided dwarves and gnomes?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500087,'','You can approach the zombies without being spotted?$B$BThey do not feel your brains when you are too close?$B$BHalf of the people here have nothing to fear, then.',0,0,1,0,11,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500125,'<Quality you can depend upon until the explosive end!>$B$B<Insert moolah for profession training and vending services.>','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500131,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$B$G Papa : Mama;...?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$B$G Papa : Mama;...?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BWhat does "$c" mean? Are you the goblin $g patriarch : matriarch;?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BThey call you $N. Is this your unique signifier, or is it an honorary title?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BGreetings. I recently emerged from an egg. You?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BIs it true that you cook your meat? Curious.','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BYou lack a helmet. Does this diminish your intellectual capacities?','',0,0,1,0,0,0,0,0,0,'<To your astonishment, the Raptor hatchling is able to communicate with you.>$B$BThe ends of your fingers are dull and round. Is this why you carry around other implements for use in combat?$B$BHow interesting.','',0,0,1,0,0,0,0,0,0,0),
  (500007,'','You don''t have to be a priest to tithe. Your coin is just as welcome, $g sir : ma''am;.',0,0,1,0,274,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500010,'','$G Mr. : Ms.; $N, so very good to see you.$B$BI hope that you are enjoying the Kaja''Cola marketing campaign. We''re planning a massive set of explosions for the next phase of the campaign. That always goes over well with our target demographic.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500026,'Hey there, $g Mr. : Ms.; $N. I can''t train you in the ways of magic, but all of this finger-waggling means that I can give a mean neck massage.','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500012,'Hey there, boss-$g man : lady;. This batch of troll slaves has got to be the worst yet!$B$BLucky for us that the kaja''mite doesn''t seem to be making their soft brains any smarter, eh?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500028,'Excellent travail, $gM.:Mme; $N. Continuez comme Ã§a.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500031,'','You can see me? How can you see me, boss?$B$BI''m going to have to work on that.',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500023,'$N? $G Sir : Ma''am;, you''re not a hunter, you''re a $c.','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500055,'Warrior-Matic NX-01 is currently offline.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500021,'Thanks again for the help with these lazy cretins, boss-$g man : lady;.$B$BIf you ask me, we shouldn''t have been so lenient with the trolls when we freed ourselves from being their slaves.','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500122,'Heya, $g dude : toots;! The word is that you''re gunning for the Trade Prince''s job.$B$BThat true?','',0,0,1,0,1,0,0,0,0,'I''d like to punch that Chip right in the kisser! I''d also like to kiss that Candy right in the kisser, too!','',0,0,1,0,15,0,0,0,0,'Did someone say, party?','',0,0,1,0,6,0,0,0,0,'This Kaja''Cola thing''s got me thinking. Do we really want the competition to have ideas?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500058,'No team''s ever come back from this far behind!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500014,'Welcome to First Bank of Kezan, a wholly-owned subsidiary of the Bilgewater Traders & Merchants Bank Of The South Seas.$B$BWhat can I do for you today?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500016,'Look what I have to work with. Szabo can perform miracles?$B$B<Szabo sighs>$B$BYes, yes. Szabo thinks he can do something with you.','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500017,'','I gots all kinds of brands of shades. Yous name it, I sell it!',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500015,'Yo! You look like a $g man : woman; of discerning tastes.$B$BWhat can I do you for?','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500121,'YOU!$B$BYou think you can just waltz in here and take my spot? Think again, $g boy : girl;!$B$BI''ve heard the whispering in the boardroom. The people you''ve surrounded yourself with at headquarters are all boot-licking sycophants who will do anything to get ahead. I should know... I hired all of them.$B$BYour meteoric rise to power is a fluke, and I''m fully prepared to knock you down a gear or two! Watch your step, $N. Who knows when you''re going to need me on your side?','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500133,'','Boss, we gotta get you a bazillion macaroons by any means possible!',0,0,1,273,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500127,'','It looks like this is the end, but I''ll be brave if you will, $N.',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500128,'<Gobber acts tough, but you can tell that deep down, he''s scared.>','',0,0,1,0,11,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500126,'Hey, $g man : lady;, are we gonna get through this okay?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500059,'Volcano rocks! Get your volcano rocks here!','',0,0,1,0,0,0,0,0,0,'Volcano rocks for sale! Hot off the mountain! You want ''em, I got ''em!','',0,0,1,0,0,0,0,0,0,'Volcano rocks - new low price! You''re gonna love my rocks.','',0,0,1,0,0,0,0,0,0,'Get your volcano rocks here! ...Great for cats!','',0,0,1,0,0,0,0,0,0,'Take home a piece of the Cataclysm! Volcano rocks for sale - hot, Hot, HOT!','',0,0,1,0,0,0,0,0,0,'Papers to weigh? Doors to stop? Windows to break? bam, Bam, BAM! Volcano rocks.','',0,0,1,0,0,0,0,0,0,'Volcano rocks. Million and one uses. Lava, java, sauna, banana....','',0,0,1,0,0,0,0,0,0,'Volcano rocks! Limited time offer! Papers of authenticity and everything!','',0,0,1,0,0,0,0,0,0,0),
  (500130,'','A mook?! I don''t speak to brutes. How dare you!',0,0,1,0,14,0,0,0,0,'','What are we calling you things these days? Brutes? Hobgoblins?$B$BI can''t keep it straight. Get out of here.',0,0,1,0,6,0,0,0,0,'','You''re big and strong. But you need a bath. Go jump in the pool.',0,0,1,0,11,0,0,0,0,'','Oh no you did not just talk to me!',0,0,1,0,274,0,0,0,0,'','What smells around here? Oh, that''d be you.$B$BBeat it!',0,0,1,0,6,0,0,0,0,'','What''s your name?$B$BI guess it''s a good thing you brutes can''t talk. Otherwise, I''d have to tell the Trade Prince how you annoyed me.$B$BNow scram!',0,0,1,0,25,0,0,0,0,'','Touch me one more time and I''ll make sure that they send you to the Undermine!',0,0,1,0,15,0,0,0,0,'','Oh, you''re just disgusting! Why is it always the ugly ones that try to pickup on me?!',0,0,1,0,274,0,0,0,0,0),
  (500006,'Can you believe these monkeys, $N?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500003,'These monkeys are a real pain!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500073,'Get your head in the game, $N!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500030,'','Shipwrecked on an island infested with bomb-throwing monkeys? What''s next... is there a volcano that''s going to blow?!',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500022,'','Marooned! Blasted to bits by the Alliance and stranded on some island in the middle of who-knows-where?!$B$BBusiness as usual, right, $N?',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500048,'Hey there, $N. I know, it''s not much, but the trade prince''s wreck is home for now.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500057,'$N, my $g boy : girl;!$B$BWant me to teach you any of my thermal palms healing techniques?$B$BNo? How about bandages? Do you want to learn about bandages?','',0,0,1,0,1,0,6,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500040,'<Gobber grunts.>$B$BMe banker now!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500039,'','Oh, $N, we''re marooned!',0,0,1,0,0,0,0,0,0,'','I miss Kezan. Will we ever see Bilgewater Port again, $N?',0,0,1,0,0,0,0,0,0,'','Sit with me a while. We can roast crabs over the fire and sing songs.',0,0,1,0,0,0,0,0,0,'','I put this all on you, but what are you doing to get us off of this island?',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500038,'$N, sit on down. The fire''s warm and the monkeys don''t seem to like it.','',0,0,1,0,0,0,0,0,0,'Who would''ve thought we''d wind up here after everything we''ve been through?','',0,0,1,0,0,0,0,0,0,'Hey, look guys, it''s $N!','',0,0,1,0,0,0,0,0,0,'Looks like we''re in a pretty tight jam. Think you can get us out of here?','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500009,'Warrior-Matic NX-01 is currently offline.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500008,'','I''m surprised that a $c like you could even see me, $N. I''m stealth on a stick!',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500024,'It''s just horrible. I think they''re all dead.$B$BHow will I get the kaja''mite out of there now?','',0,0,1,0,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500034,'What?! You think I''m made out of miners?$B$BHow bad can it be in there?','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500032,'I think that we might have angered them.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500033,'<Kilag motions you to keep your voice down.>','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500089,'$NÂ ! Can you help me take care of Bubble? It still weaves a fishy thing!','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500090,'These little things are poisoning me!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500091,'','Zombies, whether goblins or not, are an abomination in the eyes of the Light. Moreover, they do not represent any interest.$B$BPas still, in any case.',0,0,1,0,274,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500088,'These zombies are so slow that you can shoot them like pigeons!','',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500035,'Get the keys and then get to that gyrochoppa!','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500036,'Bleh! Clearly built by gnomes.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500037,'A goblin? I must be seeing things. Throm-Ka and thank you, little one!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500041,'Lok''tar ogar, $N !','',0,0,1,0,15,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500045,'We owe you a debt that will be hard to repay, $N.','',0,0,1,0,2,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500074,'Heya, kid. Great job out there!$B$BSee you on the other side.','',0,0,1,0,397,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500047,'','Oh, $N, you''ve saved us again! Thank you for getting rid of those evil humans before they could get us!',0,0,1,0,17,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500046,'Hey, $g bro : lady;. Rocket ride! Yeah!','',0,0,1,0,4,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500052,'Good job, $N! Isn''t this all very exciting? I wonder what the next island will be like?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500049,'Out of the frying pan and into the fire, eh $N?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500054,'','Hey there, $N. I for one am glad to be away from those damned monkeys!',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500053,'','Sounds like you''ve had quite the adventure, $N. There must have been plenty of moolah on those Alliance creeps.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500080,'What are we doing up here? Shouldn''t we be trying to find a way off of this island?!!!','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500135,'Like the good old days, huh, $NÂ ?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500140,'','All the others are there, downstairs!',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500139,'I know you had the stuff to save the green skin, $NÂ !$B$BEt now, we get out of here before I have to kill Bubble and Finger.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500143,'','Deploying an urban setting in the middle of the wild. I love it!',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500067,'This place seems nice enough, I suppose. Needs a little elbow grease.$B$BYou looking for a job, $N?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500060,'My genius cannot be contained within a box!$B$BWait, this isn''t Azshara?! What is this place? That''s a dormant volcano!$B$BI have half a mind to go join the Trade Prince! The other half of my mind is considering the possible weaponization of the clucker eggs!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500075,'All this talk about food is making me hungry!','',0,0,1,0,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500061,'','When we were packed into the Town-In-A-Box, they told us we''d be deployed somewhere in Azshara. Is this Azshara?$B$BI ask you: who prepares a Town-In-A-Box and doesn''t supply it with enough food to live on?! One measly Poultryizer?!$B$BWe all know how the "Micro" Mechachicken worked out.',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500062,'I''m glad you''re out here with us, $N. It''s not easy getting stuff from naga!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500064,'Heya, $N. I''m sure glad that you''re here. This is turning into a mess.','',0,0,1,0,3,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500063,'','I came over here to see if we could open up trade with these naga. Their reply wasn''t very nice.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500065,'Nice, the City-in-a-Box deployment, $N.','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500071,'Warrior-Matic NX-01 destroy!','',0,0,1,0,33,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500069,'','These pygmies are cutting into profits!',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500070,'','You''ve got the moves, $N. Use them!',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500123,'How can I keep a clean inn with all of this going on? Are you going to take care of this pygmy problem?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500136,'Hi, $N. You are going there ?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500103,'','Vous Ãªtes $gun vrai hÃ©ros:une vraie hÃ©roÃ¯ne;, $NÂ ! L''idole du cartel Baille-Fonds.$B$BLe cours de nos actions va crever le plafond, et je vais Ãªtre augmentÃ©eÂ !',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500124,'Goblin zombies?! What''s next... the volcano exploding?','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500144,'','Can you sneak up on zombies? Don''t they smell your brains when you get close?$B$BHalf the people around here have nothing to worry about then.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500142,'','Zombies, goblin or not, are an abomination in the eyes of the Light. Besides, there''s no profit in them.$B$BNot yet anyway.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500092,'The mine cart is prepped and ready to go.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500093,'','The coach is there? Well, he''ll have a plan',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500095,'','And to say that I thought it could not be worse ...',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500097,'Honestly, how do these people keep getting captured? It''s massive incompetence, I tell you!$B$BIt almost makes me ashamed to be a goblin.$B$BSpeaking of shame, where''s that lazy assistant of mine? No doubt she''s just sitting around somewhere doing nothing.$B$BOh the burdens that come with genius. I suppose I''ll just have to think us all out of this mess by myself.','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500094,'Don''t know how long we''re gonna be able to hold them off, $g bud : lady;. Hope you have a plan!','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500102,'This right here is what you''d call bad for business!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500096,'Everything has been leading to this, $N. You must not fail, or all is lost and we will die with this island.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500119,'You have the heart of a giant, $N. It has been an honor!','',0,0,1,0,66,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500116,'','May the Earth Mother watch over you, $N. Thank you for your help.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500117,'The song of your life will be sung by the mighty, $N. Until we meet again.','',0,0,1,0,2,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500118,'I have other business that must be done in Azshara, so I will join you on your journey, $N.','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500106,'I knew you had it in you all along, $N.$B$BNow, do you think there''ll be a position for me in Azshara? Do they have trolls there?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500099,'We''re Orgrimmar bound, $g bud : girlie;, and then on to our new home in Azshara. See you there!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500105,'You did it, my $g boy : girl;, you did it!$B$BNow, let''s get to Azshara so that I can set up my new practice. This has been a long vacation and I have bills to pay!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500101,'','Oh goodness, you did it, $N, you really did it!$B$BNow, by my calculations, if we do not get this bucket sailing very very soon, there is the increasing likelihood of one of those giant volcano rocks shooting through the air and smashing the yacht to smithereens.$B$BShall we?',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500109,'You did a superb job, $N. Top notch!$B$BNow, of course, you couldn''t have done it without my tinkering genius, which I''m sure you''ll put in your company report, but you really pulled it off, despite the bumbling of my assistant here.','',0,0,1,0,273,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500104,'You got the stuff, kid! You got the ball into the endzone and you detonated it for the win!$B$BNow let''s get out of here. I''m thinking that the new team might need to be called the $N Explosion!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500112,'','Are you going in there? I refuse to go back!',0,0,1,0,274,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500113,'','It must be the last cool spot on the island ... right next to the volcano!',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500013,'Beat it, pal, before I give you the ol'' Chip Endale fist to the face!','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500129,'','Yeah? Whadya want?',0,0,1,0,6,0,0,0,0,'','I don''t talk to no $g scrub : trash;!',0,0,1,0,274,0,0,0,0,'','You''re not quite in my league, honey.',0,0,1,0,25,0,0,0,0,'','I didn''t talk to you back in school and I''m sure not going to start now.',0,0,1,0,1,0,0,0,0,'','That''s an interesting... "outfit" you''re wearing.',0,0,1,0,11,0,0,0,0,'','Yes. I''d love a refill. Fetch one and be quick about it.',0,0,1,0,1,0,0,0,0,'','This is the Trade Prince''s party, sweetie. Invite only!',0,0,1,0,396,0,0,0,0,'','$N, right? Word of advice: don''t let the Trade Prince catch you around here. He knows you''re after his job.$B$BEveryone knows.',0,0,1,0,6,0,0,0,0,0),
  (500056,'Warrior-Matic NX-01 online.$B$BPlease insert coins for training.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500004,'What? $N, you''re not a warlock.$B$BThere''s nothing that I can teach a $c like you, $g sir : ma''am;.','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500011,'','Hi, babe! How do I look?',0,0,1,0,4,0,0,0,0,'','I missed you so much! Where have you been?$B$BAre you going to answer me, or just stand there?',0,0,1,0,6,0,0,0,0,'','Do you like my outfit?  It''s for the party. I charged it to your account.',0,0,1,0,6,0,0,0,0,'','There was another guy just hitting on me. Oh, the nerve!$B$BWill you beat him up for me, sweetie? Thanks. Love ya!',0,0,1,0,5,0,0,0,0,'','I can''t wait for the day when you rise to the top. Just think, I''ll be able to call myself Mrs. Trade Prince$B$BNot to mention buy all that stuff I''ve always wanted!!!',0,0,1,0,1,0,0,0,0,'','Be careful out there. I heard that there are Southsea pirates in the bay.$B$BHmm, maybe I should go check for myself...',0,0,1,0,1,0,0,0,0,'','Can we go on a nice, romantic picnic on top of Mount Kajaro?$B$BMake sure you pickup my favorite champagne!',0,0,1,0,6,0,0,0,0,'','You''ve got a miscievious look in your eye. What have you been up to, babe?$B$BWell?',0,0,1,0,6,0,0,0,0,0),
  (500027,'What a wonderful day for some training in the mystical arts. Wouldn''t you agree, $G Mr. : Ms.; $N?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500005,'I do not know about you, $N, but for me, I do not count stuck on this island all my life! $B $B If only I had stayed at the academy to learn how to use teleportation magic ...','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500042,'','No offense, my brother, but my boyfriend is Benji and I work for the merchant prince now. $B $B Bouge you want? You''re hiding the horizon.',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500043,'Not stop there.','',0,0,1,0,274,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500051,'I saw Mechumide make the crossing. I prefer to start a slow drop, but I still do not know the spell. $B $B You come to learn, $N?','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500066,'A little help?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500068,'City-in-Box. Are we not the greatest DIY world?','',0,0,1,0,5,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500134,'What can I do for you, $N? You need training?','',0,0,1,0,6,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500138,'And if we paid Bulle just before taking the sea I want, and you beat up!','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500132,'','Do not worry about Hobart, boss. It creaks a little, that''s all. $B $B The Cataclysm could not have come at worse time for him. He was so close to success with micro-microcapoulets.',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500019,'<You can not understand what Slimer said with all the food that is stuffed into her mouth. But you think he''s trying to say thank you.>','',0,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500020,'','And that $g man:woman best friend my best friend! Come dance with us, $N!',0,0,1,0,4,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500018,'Great, this festival, $N. Thank you for the disco ball!','',0,0,1,0,4,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500111,'I can not believe that Bubble and Finger are still squeezing. It''s the pressure. We need you more than ever, $N.','',0,0,1,0,25,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500029,'I see such a bright future for you, my $g boy : girl;! What shall I teach you today?','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500025,'I can''t offer you any training, $N, but I sure could use your help against these damn monkeys!','',0,0,1,25,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500044,'<The trade prince lowers his voice to barely a whisper.>$B$BDon''t think for a moment that I''ve forgotten how much I despise you, $N, rescue or not.$B$BDon''t worry your $g simple : pretty; head. I''ll get my revenge soon enough, mark my words!$B$BYou''ll fare far worse than being my slave. There''ll be no escape for you this time.','',0,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500050,'I''ve been patient up to this point, but if they don''t get that rocket sling working soon, I''m going to shadow bolt someone!','',0,0,1,5,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500137,'A Town-In-A-Box. Nice!','',0,0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0),
  (500108,'Three cheers for $N!!!$B$BI really cannot wait to setup my own little bed and breakfast in Azshara. What do you think it''s like there?','',0,0,1,4,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0);

DELETE FROM gossip_menu WHERE MenuID BETWEEN 510000 AND 510096;
INSERT INTO gossip_menu (MenuID,TextID) VALUES
  (510000,500000),
  (510001,500001),
  (510002,500002),
  (510003,500003),
  (510004,500025),
  (510005,500005),
  (510006,500006),
  (510007,500030),
  (510008,500008),
  (510009,500009),
  (510010,500010),
  (510011,500011),
  (510012,500013),
  (510013,500012),
  (510013,500021),
  (510014,500014),
  (510015,500015),
  (510016,500016),
  (510017,500017),
  (510018,500018),
  (510019,500019),
  (510020,500020),
  (510021,500022),
  (510022,500023),
  (510023,500024),
  (510023,500034),
  (510024,500004),
  (510025,500026),
  (510025,500027),
  (510026,500028),
  (510026,500029),
  (510027,500007),
  (510028,500031),
  (510029,500032),
  (510030,500033),
  (510032,500035),
  (510033,500036),
  (510034,500037),
  (510035,500038),
  (510036,500039),
  (510037,500040),
  (510038,500041),
  (510039,500042),
  (510040,500043),
  (510041,500044),
  (510042,500045),
  (510044,500046),
  (510045,500047),
  (510046,500048),
  (510047,500049),
  (510048,500050),
  (510049,500051),
  (510050,500052),
  (510051,500053),
  (510052,500054),
  (510053,500055),
  (510053,500056),
  (510054,500057),
  (510054,500105),
  (510055,500058),
  (510056,500059),
  (510057,500060),
  (510057,500082),
  (510057,500097),
  (510057,500109),
  (510058,500061),
  (510058,500077),
  (510058,500081),
  (510058,500093),
  (510058,500101),
  (510059,500062),
  (510059,500102),
  (510060,500063),
  (510060,500100),
  (510060,500103),
  (510061,500064),
  (510061,500094),
  (510061,500099),
  (510062,500134),
  (510063,500067),
  (510063,500123),
  (510063,500124),
  (510064,500069),
  (510064,500091),
  (510064,500112),
  (510064,500142),
  (510065,500071),
  (510066,500072),
  (510067,500073),
  (510067,500074),
  (510067,500075),
  (510067,500076),
  (510067,500104),
  (510068,500079),
  (510068,500080),
  (510068,500106),
  (510069,500083),
  (510069,500098),
  (510070,500085),
  (510070,500116),
  (510071,500086),
  (510071,500117),
  (510072,500092),
  (510073,500096),
  (510073,500118),
  (510074,500120),
  (510075,500107),
  (510076,500108),
  (510077,500114),
  (510078,500115),
  (510079,500119),
  (510080,500121),
  (510081,500122),
  (510082,500125),
  (510084,500126),
  (510085,500127),
  (510086,500128),
  (510087,500129),
  (510087,500130),
  (510088,500131),
  (510089,500132),
  (510090,500133),
  (510091,500065),
  (510091,500088),
  (510091,500135),
  (510091,500136),
  (510092,500066),
  (510092,500089),
  (510092,500110),
  (510092,500137),
  (510092,500138),
  (510093,500068),
  (510093,500090),
  (510093,500111),
  (510093,500139),
  (510094,500078),
  (510094,500084),
  (510094,500095),
  (510094,500120),
  (510094,500140),
  (510094,500141),
  (510095,500070),
  (510095,500087),
  (510095,500113),
  (510095,500143),
  (510095,500144);

DELETE FROM gossip_menu_option WHERE MenuID BETWEEN 510000 AND 510096;
INSERT INTO gossip_menu_option (MenuID,OptionID,OptionIcon,OptionText,OptionBroadcastTextID,OptionType,OptionNpcFlag,ActionMenuID,ActionPoiID,BoxCoded,BoxMoney,BoxText,BoxBroadcastTextID) VALUES
  (510046,0,0,'Faites de cette auberge votre foyer.',0,8,65537,0,0,0,0,'',0),
  (510001,0,0,'Trick or Treat!',0,1,1,0,0,0,0,'',0),
  (510014,0,6,'Banque',0,9,131072,0,0,0,0,'',0),
  (510059,0,0,'I would like to buy from you.',0,3,643,0,0,0,0,'',0),
  (510062,0,0,'Je suis intÃ©ressÃ© par une formation de mage.',0,5,16,0,0,0,0,'',0),
  (510056,0,0,'Vinny, il faut que j''aie un authentique souvenir du cataclysmeÂ !',0,1,1,0,0,0,0,'',0),
  (510023,1,0,'Er, Dampwich, I need another miner....',0,1,1,0,0,0,0,'',0),
  (510004,0,3,'I am interested in warlock training.',0,5,16,0,0,0,0,'',0),
  (510033,0,0,'Let me fly back to Vengeance Wake!',0,1,1,0,0,0,0,'',0),
  (510046,1,0,'Que puis-je faire dans une aubergeÂ ?',0,1,65537,0,0,0,0,'',0),
  (510024,0,3,'I am interested in warlock training.',0,5,16,0,0,0,0,'',0),
  (510037,0,6,'Gobeur, j''ai besoin de regarder dans mon sac.',0,9,131073,0,0,0,0,'',0),
  (510015,0,0,'Set me up with the phattest, shiniest bling you got!',0,1,1,0,0,0,0,'',0),
  (510016,0,0,'Szabo, I need a hip, new outfit for the party I''m throwing!',0,1,1,0,0,0,0,'',0),
  (510026,0,3,'Teach me the ways of the spirits.',0,5,16,0,0,0,0,'',0),
  (510007,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510001,1,5,'Make this inn your home.',0,8,65536,0,0,0,0,'',0),
  (510001,3,0,'What can I do at an inn?',0,1,1,0,0,0,0,'',0),
  (510001,2,1,'Let me browse your goods.',0,3,128,0,0,0,0,'',0),
  (510000,0,4,'Return me to life.',0,6,16384,0,0,0,0,'',0),
  (510053,0,3,'I require warrior training.',0,5,16,0,0,0,0,'',0),
  (510054,0,0,'EntraÃ®nez-moi.',0,5,81,0,0,0,0,'',0),
  (510049,0,0,'Je suis intÃ©ressÃ© par une formation de mage.',0,5,16,0,0,0,0,'',0),
  (510050,0,3,'Teach me the ways of the spirits.',0,5,16,0,0,0,0,'',0),
  (510006,0,3,'Teach me the ways of the spirits.',0,5,16,0,0,0,0,'',0),
  (510025,0,3,'I am interested in mage training.',0,5,16,0,0,0,0,'',0),
  (510063,0,5,'Make this inn your home.',0,8,65536,0,0,0,0,'',0),
  (510063,1,0,'What can I do at an inn?',0,1,1,0,0,0,0,'',0),
  (510073,0,1,'I would like to buy from you.',0,3,128,0,0,0,0,'',0),
  (510074,0,0,'Sassy, let''s set sail for Orgrimmar before the island blows for good!',0,1,3,0,0,0,0,'',0),
  (510082,0,0,'AccÃ©der au distributeur de professions',0,3,4307,0,0,0,0,'',0),
  (510082,1,0,'J''aimerais acheter des connaissances dans un mÃ©tier principal.',0,1,4307,0,0,0,0,'',0),
  (510082,2,0,'J''aimerais acheter des connaissances dans un mÃ©tier secondaire.',0,1,4307,0,0,0,0,'',0),
  (510094,0,0,'Get me up into the skies, Sassy!',0,1,1,0,0,0,0,'',0),
  (510093,0,3,'Teach me the ways of the spirits.',0,5,16,0,0,0,0,'',0),
  (510002,0,1,'Can you repair my gear?',0,3,128,0,0,0,0,'',0),
  (510062,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510004,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510024,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510026,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510006,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510053,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510049,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510050,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510005,0,0,'I am interested in a mage training.',0,5,16,0,0,0,0,'',0),
  (510025,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510093,2,0,'I wish to know about Dual Talent Specialization.',0,1,1,0,0,0,0,'',0),
  (510062,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510004,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510024,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510026,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510007,0,3,'I am interested in a priest training.',0,5,16,0,0,0,0,'',0),
  (510053,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510049,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510050,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510005,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510025,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510093,1,3,'I wish to unlearn my talents.',0,16,16,0,0,0,0,'',0),
  (510090,0,0,'Okay, Sassy, I''m ready to go.',0,1,1,0,0,0,0,'',0),
  (510017,0,0,'I need some cool shades. What will two stacks of macaroons get me?',0,1,1,0,0,0,0,'',0),
  (510023,0,0,'Refresh my memory on the whole Kaja''mite thing.',0,1,3,0,0,0,0,'',0),
  (510030,0,0,'Kilag, I... uh, somehow... er, lost my scout.',0,1,1,0,0,0,0,'',0);

UPDATE creature_template SET gossip_menu_id=510000 WHERE entry IN (39660,6491);
UPDATE creature_template SET gossip_menu_id=510001 WHERE entry IN (36501);
UPDATE creature_template SET gossip_menu_id=510002 WHERE entry IN (36464);
UPDATE creature_template SET gossip_menu_id=510003 WHERE entry IN (35758);
UPDATE creature_template SET gossip_menu_id=510004 WHERE entry IN (35778);
UPDATE creature_template SET gossip_menu_id=510005 WHERE entry IN (35780);
UPDATE creature_template SET gossip_menu_id=510006 WHERE entry IN (35786);
UPDATE creature_template SET gossip_menu_id=510007 WHERE entry IN (35805);
UPDATE creature_template SET gossip_menu_id=510008 WHERE entry IN (35806);
UPDATE creature_template SET gossip_menu_id=510009 WHERE entry IN (36525,35807);
UPDATE creature_template SET gossip_menu_id=510010 WHERE entry IN (34874);
UPDATE creature_template SET gossip_menu_id=510011 WHERE entry IN (35053);
UPDATE creature_template SET gossip_menu_id=510012 WHERE entry IN (35054);
UPDATE creature_template SET gossip_menu_id=510013 WHERE entry IN (34872);
UPDATE creature_template SET gossip_menu_id=510014 WHERE entry IN (35120);
UPDATE creature_template SET gossip_menu_id=510015 WHERE entry IN (35126);
UPDATE creature_template SET gossip_menu_id=510016 WHERE entry IN (35128);
UPDATE creature_template SET gossip_menu_id=510017 WHERE entry IN (35130);
UPDATE creature_template SET gossip_menu_id=510018 WHERE entry IN (35207);
UPDATE creature_template SET gossip_menu_id=510019 WHERE entry IN (35209);
UPDATE creature_template SET gossip_menu_id=510020 WHERE entry IN (35210);
UPDATE creature_template SET gossip_menu_id=510021 WHERE entry IN (35650);
UPDATE creature_template SET gossip_menu_id=510022 WHERE entry IN (34673);
UPDATE creature_template SET gossip_menu_id=510023 WHERE entry IN (35769);
UPDATE creature_template SET gossip_menu_id=510024 WHERE entry IN (34696);
UPDATE creature_template SET gossip_menu_id=510025 WHERE entry IN (34689);
UPDATE creature_template SET gossip_menu_id=510026 WHERE entry IN (34695);
UPDATE creature_template SET gossip_menu_id=510027 WHERE entry IN (34692);
UPDATE creature_template SET gossip_menu_id=510028 WHERE entry IN (34693);
UPDATE creature_template SET gossip_menu_id=510029 WHERE entry IN (35893);
UPDATE creature_template SET gossip_menu_id=510030 WHERE entry IN (35917);
UPDATE creature_template SET gossip_menu_id=510031 WHERE entry IN (36115);
UPDATE creature_template SET gossip_menu_id=510032 WHERE entry IN (36117);
UPDATE creature_template SET gossip_menu_id=510033 WHERE entry IN (36127);
UPDATE creature_template SET gossip_menu_id=510034 WHERE entry IN (36145);
UPDATE creature_template SET gossip_menu_id=510035 WHERE entry IN (36180);
UPDATE creature_template SET gossip_menu_id=510036 WHERE entry IN (36184);
UPDATE creature_template SET gossip_menu_id=510037 WHERE entry IN (38746,36463,36186);
UPDATE creature_template SET gossip_menu_id=510038 WHERE entry IN (36161);
UPDATE creature_template SET gossip_menu_id=510039 WHERE entry IN (36404);
UPDATE creature_template SET gossip_menu_id=510040 WHERE entry IN (36406);
UPDATE creature_template SET gossip_menu_id=510041 WHERE entry IN (36403);
UPDATE creature_template SET gossip_menu_id=510042 WHERE entry IN (36417);
UPDATE creature_template SET gossip_menu_id=510043 WHERE entry IN (36418);
UPDATE creature_template SET gossip_menu_id=510044 WHERE entry IN (36428);
UPDATE creature_template SET gossip_menu_id=510045 WHERE entry IN (36429);
UPDATE creature_template SET gossip_menu_id=510046 WHERE entry IN (36496);
UPDATE creature_template SET gossip_menu_id=510047 WHERE entry IN (36518);
UPDATE creature_template SET gossip_menu_id=510048 WHERE entry IN (36519);
UPDATE creature_template SET gossip_menu_id=510049 WHERE entry IN (36520);
UPDATE creature_template SET gossip_menu_id=510050 WHERE entry IN (36521);
UPDATE creature_template SET gossip_menu_id=510051 WHERE entry IN (36523);
UPDATE creature_template SET gossip_menu_id=510052 WHERE entry IN (36524);
UPDATE creature_template SET gossip_menu_id=510053 WHERE entry IN (34697);
UPDATE creature_template SET gossip_menu_id=510054 WHERE entry IN (36615,366150);
UPDATE creature_template SET gossip_menu_id=510055 WHERE entry IN (37106);
UPDATE creature_template SET gossip_menu_id=510056 WHERE entry IN (37500);
UPDATE creature_template SET gossip_menu_id=510057 WHERE entry IN (38120);
UPDATE creature_template SET gossip_menu_id=510058 WHERE entry IN (38124);
UPDATE creature_template SET gossip_menu_id=510059 WHERE entry IN (38381);
UPDATE creature_template SET gossip_menu_id=510060 WHERE entry IN (38432);
UPDATE creature_template SET gossip_menu_id=510061 WHERE entry IN (38441);
UPDATE creature_template SET gossip_menu_id=510062 WHERE entry IN (38514);
UPDATE creature_template SET gossip_menu_id=510063 WHERE entry IN (42473);
UPDATE creature_template SET gossip_menu_id=510064 WHERE entry IN (38516);
UPDATE creature_template SET gossip_menu_id=510065 WHERE entry IN (38518);
UPDATE creature_template SET gossip_menu_id=510066 WHERE entry IN (38647);
UPDATE creature_template SET gossip_menu_id=510067 WHERE entry IN (38738);
UPDATE creature_template SET gossip_menu_id=510068 WHERE entry IN (36471);
UPDATE creature_template SET gossip_menu_id=510069 WHERE entry IN (38935);
UPDATE creature_template SET gossip_menu_id=510070 WHERE entry IN (39065);
UPDATE creature_template SET gossip_menu_id=510071 WHERE entry IN (39066);
UPDATE creature_template SET gossip_menu_id=510072 WHERE entry IN (39341);
UPDATE creature_template SET gossip_menu_id=510073 WHERE entry IN (39063);
UPDATE creature_template SET gossip_menu_id=510074 WHERE entry IN (383870);
UPDATE creature_template SET gossip_menu_id=510075 WHERE entry IN (36600);
UPDATE creature_template SET gossip_menu_id=510076 WHERE entry IN (38510);
UPDATE creature_template SET gossip_menu_id=510077 WHERE entry IN (39615);
UPDATE creature_template SET gossip_menu_id=510078 WHERE entry IN (38745,38409);
UPDATE creature_template SET gossip_menu_id=510079 WHERE entry IN (39067);
UPDATE creature_template SET gossip_menu_id=510080 WHERE entry IN (35222);
UPDATE creature_template SET gossip_menu_id=510081 WHERE entry IN (34957);
UPDATE creature_template SET gossip_menu_id=510082 WHERE entry IN (45286);
UPDATE creature_template SET gossip_menu_id=510083 WHERE entry IN (48494);
UPDATE creature_template SET gossip_menu_id=510084 WHERE entry IN (37709);
UPDATE creature_template SET gossip_menu_id=510085 WHERE entry IN (37708);
UPDATE creature_template SET gossip_menu_id=510086 WHERE entry IN (37710);
UPDATE creature_template SET gossip_menu_id=510087 WHERE entry IN (48961,48949);
UPDATE creature_template SET gossip_menu_id=510088 WHERE entry IN (49150);
UPDATE creature_template SET gossip_menu_id=510089 WHERE entry IN (48496);
UPDATE creature_template SET gossip_menu_id=510090 WHERE entry IN (34668);
UPDATE creature_template SET gossip_menu_id=510091 WHERE entry IN (38122);
UPDATE creature_template SET gossip_menu_id=510092 WHERE entry IN (38513);
UPDATE creature_template SET gossip_menu_id=510093 WHERE entry IN (38515);
UPDATE creature_template SET gossip_menu_id=510094 WHERE entry IN (38387);
UPDATE creature_template SET gossip_menu_id=510095 WHERE entry IN (38517);
