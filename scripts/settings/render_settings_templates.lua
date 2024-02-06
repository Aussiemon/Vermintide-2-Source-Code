-- chunkname: @scripts/settings/render_settings_templates.lua

ApexClothQuality = {
	off = {
		disable_apex_cloth = true,
	},
	low = {
		apex_lod_resource_budget = 0.5,
		disable_apex_cloth = false,
	},
	medium = {
		apex_lod_resource_budget = 1.5,
		disable_apex_cloth = false,
	},
	high = {
		apex_lod_resource_budget = 3,
		disable_apex_cloth = false,
	},
	extreme = {
		apex_lod_resource_budget = 5,
		disable_apex_cloth = false,
	},
}
ParticlesQuality = {
	lowest = {
		particles_capacity_multiplier = 0,
		particles_local_lighting = false,
		particles_receive_shadows = false,
		particles_simulation_lod = 1,
		particles_tessellation = false,
	},
	low = {
		particles_capacity_multiplier = 0.25,
		particles_local_lighting = false,
		particles_receive_shadows = false,
		particles_simulation_lod = 1,
		particles_tessellation = false,
	},
	medium = {
		particles_capacity_multiplier = 0.5,
		particles_local_lighting = true,
		particles_receive_shadows = false,
		particles_simulation_lod = 1,
		particles_tessellation = false,
	},
	high = {
		particles_capacity_multiplier = 0.75,
		particles_local_lighting = true,
		particles_receive_shadows = false,
		particles_simulation_lod = 0,
		particles_tessellation = true,
	},
	extreme = {
		particles_capacity_multiplier = 1,
		particles_local_lighting = true,
		particles_receive_shadows = true,
		particles_simulation_lod = 0,
		particles_tessellation = true,
	},
}
AmbientLightQuality = {
	low = {
		local_probes_enabled = false,
	},
	high = {
		local_probes_enabled = true,
	},
}
AmbientOcclusionQuality = {
	off = {
		ao_enabled = false,
		ao_high_quality = false,
		ao_secondary_enabled = false,
	},
	medium = {
		ao_enabled = true,
		ao_high_quality = false,
		ao_secondary_enabled = false,
	},
	high = {
		ao_enabled = true,
		ao_high_quality = false,
		ao_secondary_enabled = true,
	},
	extreme = {
		ao_enabled = true,
		ao_high_quality = true,
		ao_secondary_enabled = true,
	},
}
SunShadowQuality = {
	low = {
		sun_shadow_map_filter_quality = "low",
		sun_shadow_map_size = {
			1024,
			1024,
		},
	},
	medium = {
		sun_shadow_map_filter_quality = "medium",
		sun_shadow_map_size = {
			1024,
			1024,
		},
	},
	high = {
		sun_shadow_map_filter_quality = "high",
		sun_shadow_map_size = {
			2048,
			2048,
		},
	},
	extreme = {
		sun_shadow_map_filter_quality = "high",
		sun_shadow_map_size = {
			2048,
			2048,
		},
	},
}
LocalLightShadowQuality = {
	low = {
		local_lights_shadow_map_filter_quality = "low",
		local_lights_shadow_atlas_size = {
			2048,
			2048,
		},
	},
	medium = {
		local_lights_shadow_map_filter_quality = "medium",
		local_lights_shadow_atlas_size = {
			2048,
			2048,
		},
	},
	high = {
		local_lights_shadow_map_filter_quality = "high",
		local_lights_shadow_atlas_size = {
			2048,
			2048,
		},
	},
	extreme = {
		local_lights_shadow_map_filter_quality = "high",
		local_lights_shadow_atlas_size = {
			2048,
			2048,
		},
	},
}
VolumetricFogQuality = {
	lowest = {
		volumetric_extrapolation_high_quality = false,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_lighting_local_lights = false,
		volumetric_lighting_local_shadows = false,
		volumetric_reprojection_amount = 1,
		volumetric_volumes_enabled = false,
		volumetric_data_size = {
			64,
			48,
			96,
		},
	},
	low = {
		volumetric_extrapolation_high_quality = false,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_lighting_local_lights = false,
		volumetric_lighting_local_shadows = false,
		volumetric_reprojection_amount = 0.875,
		volumetric_volumes_enabled = true,
		volumetric_data_size = {
			80,
			64,
			96,
		},
	},
	medium = {
		volumetric_extrapolation_high_quality = true,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_lighting_local_lights = true,
		volumetric_lighting_local_shadows = false,
		volumetric_reprojection_amount = 0.625,
		volumetric_volumes_enabled = true,
		volumetric_data_size = {
			96,
			80,
			128,
		},
	},
	high = {
		volumetric_extrapolation_high_quality = true,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_lighting_local_lights = true,
		volumetric_lighting_local_shadows = true,
		volumetric_reprojection_amount = 0,
		volumetric_volumes_enabled = true,
		volumetric_data_size = {
			128,
			96,
			160,
		},
	},
	extreme = {
		volumetric_extrapolation_high_quality = true,
		volumetric_extrapolation_volumetric_shadows = true,
		volumetric_lighting_local_lights = true,
		volumetric_lighting_local_shadows = true,
		volumetric_reprojection_amount = -0.875,
		volumetric_volumes_enabled = true,
		volumetric_data_size = {
			144,
			112,
			196,
		},
	},
}
TextureQuality = {
	default_characters = script_data.settings.default_characters_texture_quality or "high",
	default_environment = script_data.settings.default_environment_texture_quality or "high",
	characters = {
		low = {
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_df",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_dfa",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_ma",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_nm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_df_1p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_ma_1p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_nm_1p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_df_3p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_ma_3p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_nm_3p",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_df",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_ma",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_mae",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_nm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_dfa",
			},
		},
		medium = {
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_df",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_dfa",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_ma",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_nm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_df_1p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_ma_1p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_nm_1p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_df_3p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_ma_3p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_nm_3p",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_df",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_ma",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_mae",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_nm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_dfa",
			},
		},
		high = {
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_df",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_dfa",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_ma",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_nm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_df_1p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_ma_1p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_nm_1p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_df_3p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_ma_3p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_nm_3p",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_df",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_ma",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_mae",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_nm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_dfa",
			},
		},
	},
	environment = {
		low = {
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_df",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_dfa",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_dfa1",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_gsm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_nm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_hm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_hma",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_df",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_dfa",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_nm",
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_ma",
			},
		},
		medium = {
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_df",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_dfa",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_dfa1",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_gsm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_nm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_hm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_hma",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_df",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_dfa",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_nm",
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_ma",
			},
		},
		high = {
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_df",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_dfa",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_dfa1",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_gsm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_nm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_hm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_hma",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_df",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_dfa",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_nm",
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_ma",
			},
		},
	},
}
GraphicsQuality = {
	lowest = {
		user_settings = {
			ambient_light_quality = "low",
			animation_lod_distance_multiplier = 0,
			ao_quality = "off",
			char_texture_quality = "low",
			env_texture_quality = "low",
			local_light_shadow_quality = "low",
			num_blood_decals = 0,
			particles_quality = "lowest",
			sun_shadow_quality = "low",
			use_high_quality_fur = false,
			use_physic_debris = false,
			volumetric_fog_quality = "lowest",
		},
		render_settings = {
			bloom_enabled = false,
			deferred_local_lights_cast_shadows = false,
			dof_enabled = false,
			forward_local_lights_cast_shadows = false,
			fxaa_enabled = false,
			lens_quality_enabled = false,
			light_shafts_enabled = false,
			lod_scatter_density = 0,
			low_res_transparency = true,
			max_shadow_casting_lights = 0,
			motion_blur_enabled = false,
			sharpen_enabled = false,
			skin_material_enabled = false,
			ssr_enabled = false,
			ssr_high_quality = false,
			sun_flare_enabled = false,
			sun_shadows = false,
			taa_enabled = false,
		},
	},
	low = {
		user_settings = {
			ambient_light_quality = "low",
			animation_lod_distance_multiplier = 0,
			ao_quality = "off",
			char_texture_quality = "low",
			env_texture_quality = "low",
			local_light_shadow_quality = "low",
			num_blood_decals = 10,
			particles_quality = "low",
			sun_shadow_quality = "low",
			use_high_quality_fur = false,
			use_physic_debris = false,
			volumetric_fog_quality = "low",
		},
		render_settings = {
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = false,
			dof_enabled = false,
			forward_local_lights_cast_shadows = false,
			fxaa_enabled = false,
			lens_quality_enabled = false,
			light_shafts_enabled = false,
			lod_scatter_density = 0.25,
			low_res_transparency = true,
			max_shadow_casting_lights = 0,
			motion_blur_enabled = false,
			sharpen_enabled = false,
			skin_material_enabled = false,
			ssr_enabled = false,
			ssr_high_quality = false,
			sun_flare_enabled = false,
			sun_shadows = true,
			taa_enabled = false,
		},
	},
	medium = {
		user_settings = {
			ambient_light_quality = "high",
			animation_lod_distance_multiplier = 0.5,
			ao_quality = "medium",
			char_texture_quality = "medium",
			env_texture_quality = "medium",
			local_light_shadow_quality = "medium",
			num_blood_decals = 25,
			particles_quality = "medium",
			sun_shadow_quality = "medium",
			use_high_quality_fur = false,
			use_physic_debris = true,
			volumetric_fog_quality = "medium",
		},
		render_settings = {
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			dof_enabled = false,
			forward_local_lights_cast_shadows = true,
			fxaa_enabled = true,
			lens_quality_enabled = false,
			light_shafts_enabled = true,
			lod_scatter_density = 0.5,
			low_res_transparency = true,
			max_shadow_casting_lights = 1,
			motion_blur_enabled = true,
			sharpen_enabled = false,
			skin_material_enabled = false,
			ssr_enabled = false,
			ssr_high_quality = false,
			sun_flare_enabled = true,
			sun_shadows = true,
			taa_enabled = false,
		},
	},
	high = {
		user_settings = {
			ambient_light_quality = "high",
			animation_lod_distance_multiplier = 1,
			ao_quality = "high",
			char_texture_quality = "high",
			env_texture_quality = "high",
			local_light_shadow_quality = "high",
			num_blood_decals = 50,
			particles_quality = "high",
			sun_shadow_quality = "high",
			use_high_quality_fur = true,
			use_physic_debris = true,
			volumetric_fog_quality = "high",
		},
		render_settings = {
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			dof_enabled = true,
			forward_local_lights_cast_shadows = true,
			fxaa_enabled = false,
			lens_quality_enabled = true,
			light_shafts_enabled = true,
			lod_scatter_density = 1,
			low_res_transparency = false,
			max_shadow_casting_lights = 2,
			motion_blur_enabled = true,
			sharpen_enabled = true,
			skin_material_enabled = true,
			ssr_enabled = true,
			ssr_high_quality = false,
			sun_flare_enabled = true,
			sun_shadows = true,
			taa_enabled = true,
		},
	},
	extreme = {
		user_settings = {
			ambient_light_quality = "high",
			animation_lod_distance_multiplier = 1,
			ao_quality = "extreme",
			char_texture_quality = "high",
			env_texture_quality = "high",
			local_light_shadow_quality = "extreme",
			num_blood_decals = 100,
			particles_quality = "extreme",
			sun_shadow_quality = "extreme",
			use_high_quality_fur = true,
			use_physic_debris = true,
			volumetric_fog_quality = "extreme",
		},
		render_settings = {
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			dof_enabled = true,
			forward_local_lights_cast_shadows = true,
			fxaa_enabled = false,
			lens_quality_enabled = true,
			light_shafts_enabled = true,
			lod_scatter_density = 1,
			low_res_transparency = false,
			max_shadow_casting_lights = 6,
			motion_blur_enabled = true,
			sharpen_enabled = true,
			skin_material_enabled = true,
			ssr_enabled = true,
			ssr_high_quality = false,
			sun_flare_enabled = true,
			sun_shadows = true,
			taa_enabled = true,
		},
	},
	custom = {
		is_custom = true,
		user_settings = {},
		render_settings = {},
	},
}
