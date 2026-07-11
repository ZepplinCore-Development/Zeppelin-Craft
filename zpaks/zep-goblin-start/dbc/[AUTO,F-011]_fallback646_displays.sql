-- F-011 import real displays for creatures that fell back to ghoul display 646

DELETE FROM creaturedisplayinfo WHERE id=29680;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (29680,831,0,19671,1.2000000476837158,255,'','','','',1,0,0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=30702;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (30702,3124,0,0,0.5,255,'FuelRobotEmpty','','','',0,0,0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=30997;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (30997,2674,0,0,15.0,255,'','','','',0,0,0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=31477;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (31477,831,0,19671,3.0,255,'','','','',1,0,0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=32118;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (32118,3384,0,0,1.0,255,'PygmyWarriorSkin_C_01','','','',0,0,0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=36372;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (36372,2674,0,0,1.0,255,'','','','',0,0,0,0,0,0);

DELETE FROM creaturedisplayinfoextra WHERE id=19671;
INSERT INTO creaturedisplayinfoextra (id,race,gender,skin_color,face_type,hair_style,hair_color,facial_hair,helm_id,shoulders_id,shirt_id,chest_id,belt_id,legs_id,boots_id,wrists_id,gloves_id,tabard_id,cape_id,can_equip,texture) VALUES (19671,9,0,4,4,5,1,0,62495,36640,60412,60413,60341,59823,25459,0,60414,0,0,0,'CreatureDisplayExtra-19671.blp');
