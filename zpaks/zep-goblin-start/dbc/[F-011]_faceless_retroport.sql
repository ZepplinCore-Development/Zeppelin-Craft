-- F-011 Faceless of the Deep (38448) retroported model 3327 + display 31674

DELETE FROM creaturemodeldata WHERE id=3327;
INSERT INTO creaturemodeldata (id,flags,model_path,size_class,model_scale,blood_id,footprint_texture_id,footprint_texture_length,footprint_texture_width,footprint_particle_scale,foley_material_id,footstep_shake_size,death_thud_shake_size,sound_data,collision_width,collision_height,mount_height,geo_box_min_x,geo_box_min_y,geo_box_min_z,geo_box_max_x,geo_box_max_y,geo_box_max_z,world_effect_scale,attached_effect_scale,missile_collision_radius,missile_collision_push,missile_collision_raise) VALUES (3327,0,'CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2',1,1.0,0,0,0,0,0,0,0,0,0,1.0,2.5,0,-1,-1,-1,1,1,2,1.0,1.0,0,0,0);
DELETE FROM creaturedisplayinfo WHERE id=31674;
INSERT INTO creaturedisplayinfo (id,model_id,sound_id,extended_display_info_id,creature_model_scale,creature_model_alpha,texture_variation_1,texture_variation_2,texture_variation_3,portrait_texture_name,blood_level,blood_id,npc_sound_id,praticle_color_id,creature_geoset_data,obj_effect_package_id) VALUES (31674,3327,0,0,1.0,255,'FacelessoneAquatic1Green','','','',0,0,0,0,0,0);
