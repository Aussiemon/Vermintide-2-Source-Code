return {
	template = "core/stingray_renderer/environments/outdoor.shading_environment_template",
	settings = {
		menu = {
			variable_weights = {
				dof_focal_far_scale = 1,
				skydome_intensity = 0,
				skydome_fog_height_falloff = 0,
				skydome_u_offset = 0,
				outline_enabled = 1,
				sun_enabled = 0,
				outline_inner_params = 0,
				wind_amount = 0,
				sun_shadows_enabled = 0,
				motion_blur_amount = 0,
				secondary_sun_direction = 0,
				fog_color = 0,
				ssm_center = 0,
				skydome_cloud_speed_scale = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 1,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				global_lens_dirt_map = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 1,
				skydome_map = 0,
				vignette_color = 0,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				global_specular_map = 0,
				global_diffuse_map = 0,
				exposure = 0,
				ssm_near_far = 0,
				lens_quality_properties = 0,
				volumetric_extinction = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				dof_enabled = 1,
				sun_direction = 0,
				dof_focal_distance = 1,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 1,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 1,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 1,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 3,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 3,
				color_grading_map = "environment/textures/color_grading_ingame_menu",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 1,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 2.246052631579,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 5,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 3,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 1,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					0.01,
					1.9,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					3.512,
					4.688,
					0.615
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					0,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		wound_2 = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_wound_2",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_slayer = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 1,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 54.870219441756,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 0,
				color_grading_map = "environment/textures/color_grading_skill_slayer",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 0,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 30,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 0.705,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					3.417,
					4.6,
					0.859
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					0.555,
					0.188,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_shade = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_shade",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		default = {
			variable_weights = {
				outline_outer_params = 1,
				color_grading_map = 1,
				exposure = 1,
				skydome_intensity = 1,
				outline_inner_params = 1
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					20,
					0.139
				}
			},
			variables = {
				global_lens_dirt_map = "units/textures/g/generic_texture_grey",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 158.54,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 24.39,
				color_grading_map = "environment/textures/color_grading_identity",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "units/textures/g/generic_texture_grey",
				motion_blur_enabled = 1,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "environment/textures/moods_diffuse_cubemap",
				exposure = 0.2,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "units/textures/g/generic_texture_grey",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 0,
				global_specular_map = "environment/textures/moods_specular_cubemap",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 0.4,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 0.273,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 1,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					-0.722628794866,
					0.55745649889663,
					-0.40871735547737
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					-0.29576294600103,
					0.09858764866701,
					-0.95016038398951
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					3,
					1.8,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					0.125,
					0.125,
					0.125
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0.6,
					[2.0] = 0.25
				},
				vignette_scale_falloff_opacity = {
					5,
					5,
					0.5
				},
				sun_shadow_slice_depth_ranges = {
					0,
					0.93268792631474,
					0.93268792631474,
					2.5215378772032,
					2.5215378772032,
					6.5779527672696,
					6.5779527672696,
					19.9139
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					0,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					0,
					0,
					0
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0.088,
					[2.0] = -2.93
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.040441176470588,
					0.047707612456747,
					0.0625
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		knocked_down = {
			variable_weights = {
				dof_focal_far_scale = 1,
				skydome_intensity = 0,
				skydome_fog_height_falloff = 0,
				motion_blur_amount = 0,
				outline_enabled = 1,
				sun_enabled = 0,
				outline_inner_params = 0,
				skydome_tint_color = 0,
				sun_shadows_enabled = 0,
				ssm_center = 0,
				secondary_sun_direction = 0,
				fog_color = 0,
				global_lens_dirt_map = 0,
				dof_enabled = 1,
				sun_shadow_map_bias = 0,
				dof_focal_region = 1,
				volumetric_ambient_multiplier = 0,
				color_grading_map = 1,
				skydome_cloud_speed_scale = 0,
				emissive_particle_intensity = 0,
				ssm_enabled = 0,
				dof_focal_region_end = 1,
				skydome_map = 0,
				vignette_color = 0,
				secondary_sun_color = 0,
				ssm_constant_update_enabled = 0,
				global_specular_map = 0,
				global_diffuse_map = 0,
				exposure = 0,
				ssm_near_far = 0,
				lens_quality_properties = 0,
				volumetric_extinction = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				fog_enabled = 1,
				wind_amount = 0,
				sun_direction = 0,
				dof_focal_distance = 1,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 1,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 1,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_u_offset = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 1,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 10,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 15,
				color_grading_map = "environment/textures/color_grading_knocked_down",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 1,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 1,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 5,
				global_specular_map = "",
				tone_mapping_enabled = 0,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 0.288,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					0.01,
					1.525,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					3.643,
					5.509,
					0.095
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					0,
					0
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0.199,
					[2.0] = -0.75
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					1.4241164438748,
					0.94382619221505,
					0.94382619221505
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		heal_medikit = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 0,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 0,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 1,
				global_specular_map = 0,
				lens_quality_properties = 1,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 0,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 1,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_identity",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.25,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 1,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					0,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_ranger = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_ranger",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		bleeding_out = {
			variable_weights = {
				dof_focal_far_scale = 0,
				skydome_intensity = 0,
				skydome_fog_height_falloff = 0,
				skydome_u_offset = 0,
				outline_enabled = 1,
				sun_enabled = 0,
				outline_inner_params = 0,
				dof_enabled = 0,
				sun_shadows_enabled = 0,
				ssm_center = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				secondary_sun_direction = 0,
				vignette_enabled = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				volumetric_ambient_multiplier = 0,
				emissive_particle_intensity = 0,
				skydome_cloud_speed_scale = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				motion_blur_amount = 0,
				global_specular_map = 0,
				global_diffuse_map = 0,
				exposure = 0,
				ssm_near_far = 0,
				lens_quality_properties = 0,
				volumetric_extinction = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 0,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_bleeding_out",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1.5,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 1,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 4,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					0.01,
					1.8,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					1.185,
					2.305,
					1
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0,
					1.990717618533,
					0.70260621830576
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		heal_trait = {
			variable_weights = {
				dof_focal_far_scale = 0,
				skydome_intensity = 0,
				skydome_fog_height_falloff = 0,
				skydome_u_offset = 0,
				outline_enabled = 1,
				sun_enabled = 0,
				outline_inner_params = 0,
				dof_enabled = 0,
				sun_shadows_enabled = 0,
				ssm_center = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				secondary_sun_direction = 0,
				vignette_enabled = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 0,
				volumetric_ambient_multiplier = 0,
				emissive_particle_intensity = 0,
				skydome_cloud_speed_scale = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 0,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				motion_blur_amount = 0,
				global_specular_map = 0,
				global_diffuse_map = 0,
				exposure = 1,
				ssm_near_far = 0,
				lens_quality_properties = 0,
				volumetric_extinction = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 1,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_identity",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.25,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					2,
					1.5,
					0.801
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					0,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		wounded = {
			variable_weights = {
				dof_focal_far_scale = 0,
				skydome_intensity = 0,
				skydome_fog_height_falloff = 0,
				skydome_u_offset = 0,
				outline_enabled = 1,
				sun_enabled = 0,
				outline_inner_params = 0,
				dof_enabled = 0,
				sun_shadows_enabled = 0,
				ssm_center = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				secondary_sun_direction = 0,
				vignette_enabled = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				volumetric_ambient_multiplier = 0,
				emissive_particle_intensity = 0,
				skydome_cloud_speed_scale = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 0,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				motion_blur_amount = 0,
				global_specular_map = 0,
				global_diffuse_map = 0,
				exposure = 0,
				ssm_near_far = 0,
				lens_quality_properties = 0,
				volumetric_extinction = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 1,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_wounded",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 4,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					0.01,
					1.8,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					1.185,
					2.305,
					1
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_huntsman_stealth = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_local_light_multiplier = 1,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				eye_adaptation_use_new = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_huntsman_stealth",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				sun_flare_fade_time = 0.1,
				ssr_enabled = 0,
				motion_blur_enabled = 0,
				skydome_intensity = 1.0959296482412,
				sun_enabled = 1,
				dof_enabled = 0,
				global_diffuse_map = "",
				exposure = 0.85,
				tone_mapping_enabled = 1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				global_specular_map = "",
				ambient_tint_top_enabled = 0,
				dof_focal_distance = 10,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				volumetric_extinction = 0,
				temp_sun_flare_radial_alignment = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				global_roughness_multiplier = 1,
				volumetric_reprojection_boost = 0,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				dof_focal_near_scale = 1,
				global_probe_rgbm_encoded = 1,
				outline_enabled = 1,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_amount = 0,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				skydome_u_offset = 0,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_lighting_enabled = 1,
				dof_focal_far_scale = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				ambient_global_tint = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				vignette_color = {
					1,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		wound_1 = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_wound_1",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		wound_0 = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_wound_0",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_huntsman = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_extinction = 0,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				ambient_tint_top_enabled = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_hunter",
				sharpen_amount = 0.2,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				motion_blur_enabled = 0,
				temp_sun_flare_radial_alignment = 0,
				sun_enabled = 1,
				dof_enabled = 0,
				outline_enabled = 1,
				global_diffuse_map = "",
				exposure = 0.85,
				sun_flare_fade_time = 0.1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				eye_adaptation_use_new = 0,
				dof_focal_distance = 10,
				global_specular_map = "",
				tone_mapping_enabled = 1,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				skydome_intensity = 1.0959296482412,
				ssr_enabled = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				dof_focal_far_scale = 1,
				dof_focal_near_scale = 1,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				skydome_u_offset = 0,
				fullscreen_blur_amount = 0,
				global_probe_rgbm_encoded = 1,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_local_light_multiplier = 1,
				global_roughness_multiplier = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_color = {
					1,
					0,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		},
		skill_huntsman_surge = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_local_light_multiplier = 1,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				eye_adaptation_use_new = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_huntsman_surge",
				sharpen_amount = 0.0935,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				sun_flare_fade_time = 0.1,
				ssr_enabled = 0,
				motion_blur_enabled = 0,
				skydome_intensity = 1.0959296482412,
				sun_enabled = 1,
				dof_enabled = 0,
				global_diffuse_map = "",
				exposure = 0.85,
				tone_mapping_enabled = 1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				global_specular_map = "",
				ambient_tint_top_enabled = 1,
				dof_focal_distance = 10,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				volumetric_extinction = 0,
				temp_sun_flare_radial_alignment = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				global_roughness_multiplier = 1,
				volumetric_reprojection_boost = 0,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				dof_focal_near_scale = 1,
				global_probe_rgbm_encoded = 1,
				outline_enabled = 1,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_amount = 0,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 0.997,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				skydome_u_offset = 0,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_lighting_enabled = 1,
				dof_focal_far_scale = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					0.88802946069876,
					0.58505470351918,
					0
				},
				ambient_global_tint = {
					0.90984573724657,
					0.97483471847846,
					0.95113285473507
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				vignette_color = {
					1,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					0.87543252595156,
					0.82191704281957,
					0.78960580772101
				}
			}
		},
		skill_zealot = {
			variable_weights = {
				dof_focal_far_scale = 0,
				motion_blur_amount = 0,
				skydome_fog_height_falloff = 0,
				ssm_near_far = 0,
				volumetric_extinction = 0,
				outline_enabled = 1,
				outline_inner_params = 0,
				ssm_center = 0,
				sun_shadows_enabled = 0,
				dof_enabled = 0,
				global_lens_dirt_map = 0,
				fog_color = 0,
				skydome_cloud_speed_scale = 0,
				secondary_sun_direction = 0,
				sun_shadow_map_bias = 0,
				dof_focal_region = 0,
				ssm_constant_update_enabled = 0,
				color_grading_map = 1,
				vignette_enabled = 0,
				emissive_particle_intensity = 0,
				volumetric_ambient_multiplier = 0,
				dof_focal_region_end = 0,
				skydome_map = 0,
				vignette_color = 1,
				secondary_sun_color = 0,
				ssm_enabled = 0,
				skydome_u_offset = 0,
				sun_enabled = 0,
				global_diffuse_map = 0,
				exposure = 0,
				global_specular_map = 0,
				lens_quality_properties = 0,
				skydome_intensity = 0,
				ssr_enabled = 0,
				bloom_enabled = 0,
				ssr_ray_bending_enabled = 0,
				sun_color = 0,
				eye_intensity = 0,
				bloom_tint = 0,
				motion_blur_enabled = 0,
				ssr_surface_thickness_threshold = 0,
				ssm_shadow_map_bias = 0,
				vignette_scale_falloff_opacity = 0,
				lens_quality_enabled = 0,
				fog_enabled = 0,
				wind_amount = 0,
				ambient_tint = 1,
				sun_direction = 0,
				dof_focal_distance = 0,
				ssm_radius = 0,
				bloom_threshold_offset_falloff = 0,
				volumetric_global_light_multiplier = 0,
				fog1_settings = 0,
				fog0_settings = 0,
				outline_outer_params = 0,
				volumetric_distance = 0,
				eye_adaptation_speed_min_max = 0,
				dof_focal_region_start = 0,
				volumetric_phase = 0,
				sun_shadow_slice_depth_ranges = 0,
				skydome_tint_color = 0,
				ssr_screen_edge_threshold = 0,
				offscreen_target_projection = 0,
				dof_focal_near_scale = 0,
				eye_adaptation_enabled = 0,
				bloom_lens_dirt_amount = 0,
				secondary_sun_enabled = 0,
				skydome_cloud_map = 0,
				volumetric_local_light_multiplier = 0,
				global_roughness_multiplier = 0,
				local_shadow_map_bias = 0,
				ssm_rotation = 0
			},
			editor_variables = {
				sun_shadow_slice_depth_ranges = {
					0,
					80,
					0.4
				}
			},
			variables = {
				global_lens_dirt_map = "environment/textures/lensdirt",
				volumetric_local_light_multiplier = 1,
				volumetric_ambient_multiplier = 1,
				dof_focal_region_end = 5,
				volumetric_shadow_type = 0,
				light_shafts_enabled = 0,
				vignette_enabled = 1,
				sun_flare_enabled = 0,
				eye_adaptation_use_new = 0,
				ssm_constant_update_enabled = 0,
				dof_focal_region = 5,
				color_grading_map = "environment/textures/color_grading_skill_zealot",
				sharpen_amount = 5,
				emissive_particle_intensity = 1,
				sun_flare_star_map = "",
				temp_sun_flare_star_alignment = 0,
				skydome_map = "",
				sun_flare_fade_time = 0.1,
				ssr_enabled = 0,
				motion_blur_enabled = 0,
				skydome_intensity = 1.0959296482412,
				sun_enabled = 1,
				dof_enabled = 0,
				global_diffuse_map = "",
				exposure = 0.85,
				tone_mapping_enabled = 1,
				fog_debug = 0,
				skydome_cloud_map = "environment/textures/cloud_noclouds",
				global_specular_map = "",
				ambient_tint_top_enabled = 0,
				dof_focal_distance = 10,
				skydome_flow_tiling = 0,
				light_shafts_weigth = 0.5,
				volumetric_extinction = 0,
				temp_sun_flare_radial_alignment = 0,
				bloom_enabled = 1,
				ssr_ray_bending_enabled = 0,
				motion_blur_amount = 2,
				dof_focal_region_start = 5,
				sun_shadows_enabled = 1,
				eye_intensity = 1,
				sharpen_enabled = 1,
				global_roughness_multiplier = 1,
				volumetric_reprojection_boost = 0,
				volumetric_esm_constant = 5,
				skydome_flow_speed = 0,
				dof_focal_near_scale = 1,
				global_probe_rgbm_encoded = 1,
				outline_enabled = 1,
				bloom_lens_dirt_amount = 1,
				fullscreen_blur_amount = 0,
				lens_quality_enabled = 0,
				emissive_intensity = 1,
				fog_enabled = 1,
				ssm_enabled = 0,
				ssm_radius = 200,
				volumetric_global_light_multiplier = 1,
				temp_sun_flare_streaks_alignment = 0,
				volumetric_distance = 64,
				ambient_specular_intensity = 1,
				sun_flare_stripe_map = "",
				volumetric_phase = 0.4,
				skydome_u_offset = 0,
				ssr_screen_edge_threshold = 0.05,
				offscreen_target_projection = 0,
				sun_flare_streaks_map = "",
				eye_adaptation_enabled = 0,
				fullscreen_blur_enabled = 0,
				secondary_sun_enabled = 0,
				temp_sun_flare_stripe_alignment = 0,
				volumetric_lighting_enabled = 1,
				dof_focal_far_scale = 1,
				color_grading_enabled = 0,
				sun_flare_radial_map = "",
				ssm_rotation = 0,
				secondary_sun_direction = {
					0,
					0,
					-1
				},
				skydome_flow_direction = {
					1,
					0,
					0
				},
				local_shadow_map_bias = {
					0.0001,
					0.015,
					50
				},
				sun_direction = {
					0,
					0,
					-1
				},
				outline_inner_params = {
					[1.0] = 0.25,
					[2.0] = 0.45
				},
				bloom_threshold_offset_falloff = {
					1,
					1.6,
					1
				},
				ssm_near_far = {
					[1.0] = 0,
					[2.0] = 0
				},
				outline_outer_params = {
					[1.0] = 0,
					[2.0] = 0.2
				},
				secondary_sun_color = {
					1,
					1,
					1
				},
				ambient_tint_top = {
					1,
					1,
					1
				},
				ambient_global_tint = {
					1,
					1,
					1
				},
				sun_color = {
					1,
					1,
					1
				},
				wind_amount = {
					0,
					0,
					0
				},
				vignette_color = {
					1,
					0,
					0
				},
				light_shafts_settings = {
					[1.0] = 0.01,
					[2.0] = 1
				},
				skydome_cloud_speed_scale = {
					[1.0] = 0,
					[2.0] = 1
				},
				sun_shadow_slice_depth_ranges = {
					0,
					8.2590977538167,
					8.2590977538167,
					17.637056274848,
					17.637056274848,
					32.965447423407,
					32.965447423407,
					79.94
				},
				ssr_surface_thickness_threshold = {
					[1.0] = 0.001,
					[2.0] = 5
				},
				vignette_scale_falloff_opacity = {
					2.509,
					2.5,
					0
				},
				eye_adaptation_speed_min_max = {
					1,
					0.01,
					30
				},
				ssm_center = {
					0,
					0,
					0
				},
				bloom_tint = {
					1,
					1,
					1
				},
				sun_shadow_map_bias = {
					0.0001,
					0.001,
					50
				},
				lens_quality_properties = {
					0,
					0,
					0
				},
				skydome_fog_height_falloff = {
					[1.0] = 0,
					[2.0] = -50
				},
				sun_flare_weights = {
					0.3,
					0.5,
					0.1,
					0.4
				},
				sun_flare_scales = {
					0.7,
					0.25,
					0.7,
					0.35
				},
				sun_flare_fade_angle = {
					0,
					0,
					0,
					0
				},
				ssm_shadow_map_bias = {
					0.0005,
					0.0001,
					20
				},
				skydome_tint_color = {
					1,
					1,
					1
				},
				fog0_settings = {
					0,
					-100,
					500
				},
				fog1_settings = {
					0,
					-100,
					30
				},
				fog_color = {
					0.6,
					0.6,
					0.6
				},
				ambient_tint = {
					1,
					1,
					1
				}
			}
		}
	}
}
