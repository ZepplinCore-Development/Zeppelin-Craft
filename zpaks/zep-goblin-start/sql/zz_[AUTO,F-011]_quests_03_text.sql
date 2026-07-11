-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 quest turn-in text (offer_reward + request_items)

DELETE FROM quest_offer_reward WHERE ID=14001;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14001,4,0,0,0,0,0,0,0,'Oh, thank heavens that you survived, $n! I thought for sure that you''d drowned when I saw you go over the side!$B$B$B$BLook at all of these folks you saved!',0);
DELETE FROM quest_request_items WHERE ID=14001;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14001,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14014;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14014,4,0,0,0,0,0,0,0,'<Sassy breathes a sigh of relief when she sees all of the tools and bombs that you recovered.>$B$BI thought we were doomed for sure. But now we can start working on a way to get off of this island!',0);
DELETE FROM quest_request_items WHERE ID=14014;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14014,5,6,'Bomb-throwing monkeys?! The nerve!!!',0);

DELETE FROM quest_offer_reward WHERE ID=14019;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14019,4,0,0,0,0,0,0,0,'They launched up into the air when they ate the bananas?! That is hilarious!$B$BI think I''m going to take a bunch out there and feed them myself!',0);
DELETE FROM quest_request_items WHERE ID=14019;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14019,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14021;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14021,4,0,0,0,0,0,0,0,'We''ve hit the mother lode!!!$B$BNow, what''s all this about a pygmy witchdoctor in charge of the monkeys? Is he dead? Because if he''s dead, then legally I can stake my claim... not that I wasn''t going to do that anyway. By goblin law, all kaja''mite belongs to us!',0);
DELETE FROM quest_request_items WHERE ID=14021;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14021,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14031;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14031,4,0,0,0,0,0,0,0,'What are these?$B$B<Sassy examines the pictures while listening to your tale from the Kaja''mite cavern.>$B$BClearly that pygmy witchdoctor is from some new race never seen before. Maybe we should call them $N-ians?$B$BThey must be the ones that painted all of that stuff in the cavern. I''m not sure that I like what you''re describing.$B$BIt sounds to me like they''re paintings of them and us on an island with an exploding volcano!',0);
DELETE FROM quest_request_items WHERE ID=14031;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14031,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14233;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14233,4,0,0,0,0,0,0,0,'Orcs?! They were sunk and stranded too?  And now the Alliance are on the island? Do you think they''re going to kill us?$B$B<Sassy looks thoughtful.>$B$BI think it''s time for a little sitdown with these orcs.',0);
DELETE FROM quest_request_items WHERE ID=14233;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14233,5,6,'$N, find anything interesting in the cavern?',0);

DELETE FROM quest_offer_reward WHERE ID=14234;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14234,4,0,0,0,0,0,0,0,'<The orc makes a move to grab the field journal from you, but then stops herself, exhaling deeply.>$B$BI apologize. It has been a very rough couple of days for all of us.$B$BI am Aggra. All of us here are what remains of the crew of the Draka''s Fury.$B$BPerhaps we can work together. We have a common enemy in the Alliance. Their SI:7 assassins are all over this island and they''re not going to stop until we''re all dead.',0);
DELETE FROM quest_request_items WHERE ID=14234;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14234,5,6,'<The orc narrows her eyes at you.>$B$BYou must have been on the goblin slave ship that was sunk. What''s that you have in your hand?',0);

DELETE FROM quest_offer_reward WHERE ID=14235;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14235,4,0,0,0,0,0,0,0,'Goblin, can you fight?$B$BFor your sake, I hope so. Otherwise, there may be no breaking through this hell of killer plants.',0);
DELETE FROM quest_request_items WHERE ID=14235;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14235,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14236;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14236,4,0,0,0,0,0,0,0,'I saw it with my own eyes, and still I do not believe it!$B$BYou have our thanks and the debt of our lives, little goblin. I hope that soon we can repay you the honor.$B$BMay I ask a small favor of you while my scouts and I move on?',0);
DELETE FROM quest_request_items WHERE ID=14236;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14236,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14237;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14237,4,0,0,0,0,0,0,0,'Throm-Ka, $N. We have a problem.',0);
DELETE FROM quest_request_items WHERE ID=14237;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14237,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14238;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14238,4,0,0,0,0,0,0,0,'Well done, $N, well done. We''ll make an orc of you yet!$B$BTime to move on. We''d better hurry.',0);
DELETE FROM quest_request_items WHERE ID=14238;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14238,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14239;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14239,4,0,0,0,0,0,0,0,'It''s up to you now. Are you going to come back to life and be the $g hero : heroine; that your fellow survivors need you to be, or are you going to rest for eternity here?$B$BOnly you can decide.$B$BDon''t go into the Light, $N!',0);
DELETE FROM quest_request_items WHERE ID=14239;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14239,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14240;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14240,4,0,0,0,0,0,0,0,'Hello, little goblin. Bastia is fast, no?$B$BWe have something very important that needs doing. Can you help us?',0);
DELETE FROM quest_request_items WHERE ID=14240;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14240,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14241;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14241,4,0,0,0,0,0,0,0,'Hmm, where the heck is the ignition?$B$BIt''ll be a wonder if it flies without doing something weird, like turning into a chicken or shrinking down to the size of an ant.$B$BHey look, someone left their loose change in the ashtray! What else is in there?',0);
DELETE FROM quest_request_items WHERE ID=14241;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14241,5,6,'Hmm, looks like overly-complicated gnomish engineering with lots of unnecessary instrumentation and safety precautions.',0);

DELETE FROM quest_offer_reward WHERE ID=14242;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14242,4,0,0,0,0,0,0,0,'If not for you, I would surely be on my way back to Stormwind to be paraded as a trophy and a slave.$B$BThe Alliance dogs found me unconscious on the shore and put me in this magical cage. It was keeping me from connecting with the elements.$B$BNo longer!',0);
DELETE FROM quest_request_items WHERE ID=14242;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14242,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14243;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14243,4,0,0,0,0,0,0,0,'You have done what few others could have, $N. Our world owes you a debt larger than you can possibly understand.',0);
DELETE FROM quest_request_items WHERE ID=14243;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14243,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14244;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14244,4,0,0,0,0,0,0,0,'$N, I sure am glad you survived the trip... not everyone did!',0);
DELETE FROM quest_request_items WHERE ID=14244;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14244,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14245;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14245,4,0,0,0,0,0,0,0,'<cough, cough!>$B$BHey! Where''s the dock?! Someone stole the dock and the oil refinery from our town-in-a-box!$B$BWho would do such a thing?$B$BWhere''s the Trade Prince?',0);
DELETE FROM quest_request_items WHERE ID=14245;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14245,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14248;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14248,4,0,0,0,0,0,0,0,'Boss! Er, well, I guess you''re not the boss anymore, but still, good to see you!$B$BCan you believe it? We''ve got a cave full of intelligent killer monkeys mining kaja''mite!',0);
DELETE FROM quest_request_items WHERE ID=14248;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14248,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14303;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14303,4,0,0,0,0,0,0,0,'<Aggra gives you the eye as if she doesn''t quite believe what you are telling her.>$B$BI am not easily impressed, but if what you are telling me is true, then I have never before heard of such a thing.$B$BYou have my thanks, $N.',0);
DELETE FROM quest_request_items WHERE ID=14303;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14303,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14326;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14326,4,0,0,0,0,0,0,0,'My mission is too critical to let these meddlers continue to dog us. It''s up to you and I to put an end to this once and for all!',0);
DELETE FROM quest_request_items WHERE ID=14326;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14326,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14445;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14445,4,0,0,0,0,0,0,0,'Wow, oh wow! Is that who I think it is?$B$BYou rescued Thrall, Warchief of the Horde?!!!$B$B<Sassy $g gives you an appraising look : looks envious of you;.>$B$BWell, let''s see about getting over to that larger island. I sure as heck don''t want to swim the strait with all of those sharks down there.',0);
DELETE FROM quest_request_items WHERE ID=14445;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14445,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14473;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14473,4,0,0,0,0,0,0,0,'Let''s just hope we don''t have to deal with their mommy later. That would be very bad.',0);
DELETE FROM quest_request_items WHERE ID=14473;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14473,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=14474;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (14474,4,0,0,0,0,0,0,0,'Oh, thank heavens that you survived, $N! I thought for sure that you''d drowned when I saw you go over the side!$B$B<Sassy''s eyes fill up with tears as she hugs you.>$B$BLook at all of these folks you saved!',0);
DELETE FROM quest_request_items WHERE ID=14474;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (14474,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24671;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24671,4,0,0,0,0,0,0,0,'Success! Was there ever any doubt?$B$BGreely, fire up the poultryizer!',0);
DELETE FROM quest_request_items WHERE ID=24671;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24671,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24741;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24741,4,0,0,0,0,0,0,0,'Nice! Look at the size of those things!$B$BThere''s no way that Grapplehammer''s going to be able to top those!',0);
DELETE FROM quest_request_items WHERE ID=24741;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24741,5,6,'How many did you get? I can just taste the massive omelet we''re going to cook up now!',0);

DELETE FROM quest_offer_reward WHERE ID=24744;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24744,4,0,0,0,0,0,0,0,'Eureka! My genius saves the day yet again! Take that Bamm Megabomb!$B$BAnd now, to reap the benefits!',0);
DELETE FROM quest_request_items WHERE ID=24744;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24744,5,6,'Just think about the accolades that will rain down upon me... us, when the Biggest Egg Ever is returned!',0);

DELETE FROM quest_offer_reward WHERE ID=24816;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24816,4,0,0,0,0,0,0,0,'These will do very nicely! We''re going to combine the shark parts and the robotic remains of the Mechachicken into a submersible that should allow you to rid us of that nuisance, The Hammer!',0);
DELETE FROM quest_request_items WHERE ID=24816;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24816,5,6,'$N, take it easy on Grapplehammer. He''s a genius, but he''s got a fragile ego.',0);

DELETE FROM quest_offer_reward WHERE ID=24817;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24817,4,0,0,0,0,0,0,0,'Excellent work, my $g boy : girl;! The Town-In-A-Box is saved and the Bilgewater Cartel will be profitable once again thanks to my overwhelmingly unbelievable intellect and tinkering know-how.',0);
DELETE FROM quest_request_items WHERE ID=24817;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24817,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24856;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24856,4,0,0,0,0,0,0,0,'Boss, we gotta problem.',0);
DELETE FROM quest_request_items WHERE ID=24856;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24856,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24858;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24858,4,0,0,0,0,0,0,0,'I wish I could have seen the looks on their scaly faces when you blew up their banners and replaced them with our own.$B$BOn second thought, I don''t want to be close enough to see their snarls.',0);
DELETE FROM quest_request_items WHERE ID=24858;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24858,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24859;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24859,4,0,0,0,0,0,0,0,'We''re going to be filthy rich, I tell you! Well, if we can get off of this island, that is.',0);
DELETE FROM quest_request_items WHERE ID=24859;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24859,5,6,'Well? How many do you have for me? I think that a 95 to 5 split is more than generous.',0);

DELETE FROM quest_offer_reward WHERE ID=24860;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24860,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=24860;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24860,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24864;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24864,4,0,0,0,0,0,0,0,'Oh, they''re so cute! I wish that we could turn them into little plush toys and sell them for a gazillion macaroons!',0);
DELETE FROM quest_request_items WHERE ID=24864;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24864,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24868;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24868,4,0,0,0,0,0,0,0,'A faceless of the deep? What''s that? That does NOT sound like a naga!$B$BWell, you killed it, whatever it was. It doesn''t matter now. We have other fish to fry....',0);
DELETE FROM quest_request_items WHERE ID=24868;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24868,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24897;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24897,4,0,0,0,0,0,0,0,'$N? We''re saved!$B$BWho am I kidding? We''re all going to die!!!',0);
DELETE FROM quest_request_items WHERE ID=24897;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24897,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24901;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24901,4,0,0,0,0,0,0,0,'Okay, I think that''s good enough for now, but they took a bunch of the townsfolk captive.$B$BWe''re going to have to take the fight to them!',0);
DELETE FROM quest_request_items WHERE ID=24901;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24901,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24924;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24924,4,0,0,0,0,0,0,0,'$N? What are you doing wearing that pygmy helm? Looks like it''s about to fall apart.$B$BI''m glad that they sent you up here. I thought for sure they were going to send that jerk, Grapplehammer and his ego-enabling assistant.',0);
DELETE FROM quest_request_items WHERE ID=24924;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24924,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24925;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24925,4,0,0,0,0,0,0,0,'Great job, but that''s not even half of the hostages that they took from town.$B$BDarn it all! They must have taken the rest of the captives to their other villages up in the volcano!',0);
DELETE FROM quest_request_items WHERE ID=24925;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24925,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24929;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24929,4,0,0,0,0,0,0,0,'Nice work, $g bud : girlfriend;! Hope he wasn''t too tough.',0);
DELETE FROM quest_request_items WHERE ID=24929;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24929,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24935;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24935,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=24935;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24935,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24936;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24936,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=24936;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24936,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24937;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24937,4,0,0,0,0,0,0,0,'They turned some of our people into zombies? Tell me something I don''t know....',0);
DELETE FROM quest_request_items WHERE ID=24937;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24937,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24940;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24940,4,0,0,0,0,0,0,0,'My star player has arrived!',0);
DELETE FROM quest_request_items WHERE ID=24940;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24940,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24942;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24942,4,0,0,0,0,0,0,0,'You did it! No more zombies to worry about. Let''s pause a moment in silence for the stinky departed.$B$BOkay, done.',0);
DELETE FROM quest_request_items WHERE ID=24942;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24942,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24945;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24945,4,0,0,0,0,0,0,0,'I gotta tell you, that''s a load off of my mind. That is, I won''t have to worry about no new zombies coming after my brains!',0);
DELETE FROM quest_request_items WHERE ID=24945;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24945,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=24946;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24946,4,0,0,0,0,0,0,0,'This will do. In fact, it''s more than we need. I devised an ingenious idea for a weapon that the boots will be turned into once you get them to Hobart.$B$BHand the powder over and I''ll load it into the Super Booster Rocket Boots.',0);
DELETE FROM quest_request_items WHERE ID=24946;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24946,5,6,'Hmm, let me see how much you''ve got.',0);

DELETE FROM quest_offer_reward WHERE ID=24952;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24952,4,0,0,0,0,0,0,0,'There''s no time to waste, $G boy : girl;!$B$BWhat''s wrong with the actuator on the left boot?!',0);
DELETE FROM quest_request_items WHERE ID=24952;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24952,5,6,'Well there you are!',0);

DELETE FROM quest_offer_reward WHERE ID=24954;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24954,4,0,0,0,0,0,0,0,'Careful with those glands, $N, careful!$B$B<Grapplehammer''s eyes light up at the sight of the fiery organs.>$B$BAnd now to load them into the refashioned shredder boot. I''m certain that you''ll be surprised and amazed by my genius invention.',0);
DELETE FROM quest_request_items WHERE ID=24954;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24954,5,6,'No time like the present to be done with the simple task I put before you, $N. Wouldn''t you agree?',0);

DELETE FROM quest_offer_reward WHERE ID=24958;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (24958,4,0,0,0,0,0,0,0,'I managed to get everyone else safely back to town.$B$BJump in, we gotta get out of here before the volcano blows for good!!!',0);
DELETE FROM quest_request_items WHERE ID=24958;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (24958,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25023;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25023,4,0,0,0,0,0,0,0,'I told you we would meet again, $N.$B$B<The Warchief gives you an appraising look.>$B$BUnfortunate that it''s under such dire circumstances.',0);
DELETE FROM quest_request_items WHERE ID=25023;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25023,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25024;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25024,4,0,0,0,0,0,0,0,'I''ve not seen a finer display of $c prowess.',0);
DELETE FROM quest_request_items WHERE ID=25024;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25024,5,6,'There are yet more Alliance paratroopers that need to be dispatched if we''re to get about the business of escaping from this island, $N.',0);

DELETE FROM quest_offer_reward WHERE ID=25058;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25058,4,0,0,0,0,0,0,0,'Score one for the goblins! Stupid dwarves and gnomes.',0);
DELETE FROM quest_request_items WHERE ID=25058;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25058,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25066;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25066,4,0,0,0,0,0,0,0,'YES!',0);
DELETE FROM quest_request_items WHERE ID=25066;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25066,5,6,'What are you doing back here? Get up there and shoot them down!',0);

DELETE FROM quest_offer_reward WHERE ID=25093;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25093,4,0,0,0,0,0,0,0,'Thank you, $N. The spirits of the fallen can now be put to rest.',0);
DELETE FROM quest_request_items WHERE ID=25093;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25093,5,6,'Has justice been served?',0);

DELETE FROM quest_offer_reward WHERE ID=25098;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25098,4,0,0,0,0,0,0,0,'Once again you have helped us to overcome our mutual enemy, the Alliance.$B$BNow it is time for us to help you.',0);
DELETE FROM quest_request_items WHERE ID=25098;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25098,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25099;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25099,4,0,0,0,0,0,0,0,'Of course you can borrow Bastia. That is, if she''ll take you.$B$B<Kilag winks.>',0);
DELETE FROM quest_request_items WHERE ID=25099;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25099,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25100;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25100,4,0,0,0,0,0,0,0,'$N?! Nice kitty.$B$BLook we don''t have much time here. You might have noticed that the volcano is blowing?!',0);
DELETE FROM quest_request_items WHERE ID=25100;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25100,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25109;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25109,4,0,0,0,0,0,0,0,'<The assistant looks confused.>$B$BHuh... what? Who?',0);
DELETE FROM quest_request_items WHERE ID=25109;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25109,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25110;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25110,4,0,0,0,0,0,0,0,'<Assistant Greely spots the Kaja''Cola Zero-One in your hand and her eyes seem to come to life.>',0);
DELETE FROM quest_request_items WHERE ID=25110;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25110,5,6,'Huh?',0);

DELETE FROM quest_offer_reward WHERE ID=25122;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25122,4,0,0,0,0,0,0,0,'I hate the Trade Prince, but you can''t argue with the results of his methods. Kaja''Cola Zero-One is a huge improvement over regular old Kaja''Cola at half the calories and twice the ideas!',0);
DELETE FROM quest_request_items WHERE ID=25122;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25122,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25123;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25123,4,0,0,0,0,0,0,0,'Your soulstone has expired, Blastshadow!',0);
DELETE FROM quest_request_items WHERE ID=25123;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25123,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25124;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25124,4,0,0,0,0,0,0,0,'They had it coming. Those brutes were especially mean to us!',0);
DELETE FROM quest_request_items WHERE ID=25124;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25124,5,6,'Just a few more would be nice.',0);

DELETE FROM quest_offer_reward WHERE ID=25125;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25125,4,0,0,0,0,0,0,0,'Looks a little rickety....',0);
DELETE FROM quest_request_items WHERE ID=25125;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25125,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25184;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25184,4,0,0,0,0,0,0,0,'As we would say in the Tinker''s Union, out of the heat-applied metallic cooking container and into the oxydizing, energetic mixture of reacting gases and solids!',0);
DELETE FROM quest_request_items WHERE ID=25184;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25184,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25200;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25200,4,0,0,0,0,0,0,0,'I can''t say that I was ever much of a footbomb fan, but you''re giving me an appreciation for the game!',0);
DELETE FROM quest_request_items WHERE ID=25200;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25200,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25201;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25201,4,0,0,0,0,0,0,0,'Yeah, these will do nicely. You did good, kid. I''ll see to it that you get the best footbomb uniform ever made.$B$BIn the meantime, you''ve got other bombs to drop on the Trade Prince''s lackeys.',0);
DELETE FROM quest_request_items WHERE ID=25201;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25201,5,6,'Let''s see what you have there, $N.',0);

DELETE FROM quest_offer_reward WHERE ID=25202;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25202,4,0,0,0,0,0,0,0,'He got just what he deserved. There, there, don''t cry. You''ll find someone else that''ll treat you right.$B$BHere, let me take that... we wouldn''t want people to think that you''re crazy.',0);
DELETE FROM quest_request_items WHERE ID=25202;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25202,5,6,'What did you decide? Death or forgiveness?',0);

DELETE FROM quest_offer_reward WHERE ID=25203;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25203,4,0,0,0,0,0,0,0,'There''s no two ways about it... he got exactly what he deserved.',0);
DELETE FROM quest_request_items WHERE ID=25203;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25203,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25204;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25204,4,0,0,0,0,0,0,0,'All of the lights and indicators on the control panel are going crazy!',0);
DELETE FROM quest_request_items WHERE ID=25204;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25204,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25207;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25207,4,0,0,0,0,0,0,0,'I felt the heat from the explosions all the way over here!',0);
DELETE FROM quest_request_items WHERE ID=25207;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25207,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25213;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25213,4,0,0,0,0,0,0,0,'I was wondering where you were!$B$BDon''t worry, Hobart will get that footbomb uniform converted into the most Ultimate Footbomb Uniform ever!',0);
DELETE FROM quest_request_items WHERE ID=25213;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25213,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25214;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25214,4,0,0,0,0,0,0,0,'Oops. Well, what goes up must eventually come down.',0);
DELETE FROM quest_request_items WHERE ID=25214;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25214,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25225;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25225,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=25225;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25225,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25231;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25231,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=25231;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25231,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25243;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25243,4,0,0,0,0,0,0,0,'I''m sure she deserved it, $n. She should never have betrayed you like that.$B$BIt gives me the shivers to think that she might have kissed that monster, the Trade Prince!',0);
DELETE FROM quest_request_items WHERE ID=25243;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25243,5,6,'What did you decide to do, hon?',0);

DELETE FROM quest_offer_reward WHERE ID=25244;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25244,4,0,0,0,0,0,0,0,'Serves her right for stealing your man in the first place.',0);
DELETE FROM quest_request_items WHERE ID=25244;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25244,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25251;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25251,4,0,0,0,0,0,0,0,'You did it! You did it!$B$BWe''re saved, $N!',0);
DELETE FROM quest_request_items WHERE ID=25251;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25251,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25265;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25265,4,0,0,0,0,0,0,0,'Lok''tar! Victory, $N!',0);
DELETE FROM quest_request_items WHERE ID=25265;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25265,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=25266;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25266,4,0,0,0,0,0,0,0,'<The orc continues on in hushed tones.>$B$BI know who sent you. Did he give you something to deliver to me?',0);
DELETE FROM quest_request_items WHERE ID=25266;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25266,5,6,'What possible business could you have in Orgrimmar, goblin?',0);

DELETE FROM quest_offer_reward WHERE ID=25903;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (25903,4,0,0,0,0,0,0,0,'',0);
DELETE FROM quest_request_items WHERE ID=25903;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (25903,5,6,'',0);

DELETE FROM quest_offer_reward WHERE ID=27139;
INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (27139,4,0,0,0,0,0,0,0,'There you are, my $g boy : girl;. I have something very important for you to do!',0);
DELETE FROM quest_request_items WHERE ID=27139;
INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (27139,5,6,'',0);

