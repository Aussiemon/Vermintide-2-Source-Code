ApexClothQuality = {
	off = {
		disable_apex_cloth = true
	},
	low = {
		disable_apex_cloth = false,
		apex_lod_resource_budget = 0.5
	},
	medium = {
		disable_apex_cloth = false,
		apex_lod_resource_budget = 1.5
	},
	high = {
		disable_apex_cloth = false,
		apex_lod_resource_budget = 3
	},
	extreme = {
		disable_apex_cloth = false,
		apex_lod_resource_budget = 5
	}
}
ParticlesQuality = {
	lowest = {
		particles_local_lighting = false,
		particles_tessellation = false,
		particles_capacity_multiplier = 0,
		particles_receive_shadows = false,
		particles_simulation_lod = 1
	},
	low = {
		particles_local_lighting = false,
		particles_tessellation = false,
		particles_capacity_multiplier = 0.25,
		particles_receive_shadows = false,
		particles_simulation_lod = 1
	},
	medium = {
		particles_local_lighting = true,
		particles_tessellation = false,
		particles_capacity_multiplier = 0.5,
		particles_receive_shadows = false,
		particles_simulation_lod = 1
	},
	high = {
		particles_local_lighting = true,
		particles_tessellation = true,
		particles_capacity_multiplier = 0.75,
		particles_receive_shadows = false,
		particles_simulation_lod = 0
	},
	extreme = {
		particles_local_lighting = true,
		particles_tessellation = true,
		particles_capacity_multiplier = 1,
		particles_receive_shadows = true,
		particles_simulation_lod = 0
	}
}
AmbientLightQuality = {
	low = {
		local_probes_enabled = false
	},
	high = {
		local_probes_enabled = true
	}
}
AmbientOcclusionQuality = {
	off = {
		ao_secondary_enabled = false,
		ao_high_quality = false,
		ao_enabled = false
	},
	medium = {
		ao_secondary_enabled = false,
		ao_high_quality = false,
		ao_enabled = true
	},
	high = {
		ao_secondary_enabled = true,
		ao_high_quality = false,
		ao_enabled = true
	},
	extreme = {
		ao_secondary_enabled = true,
		ao_high_quality = true,
		ao_enabled = true
	}
}
SunShadowQuality = {
	low = {
		sun_shadow_map_filter_quality = "low",
		sun_shadow_map_size = {
			1024,
			1024
		}
	},
	medium = {
		sun_shadow_map_filter_quality = "medium",
		sun_shadow_map_size = {
			1024,
			1024
		}
	},
	high = {
		sun_shadow_map_filter_quality = "high",
		sun_shadow_map_size = {
			2048,
			2048
		}
	},
	extreme = {
		sun_shadow_map_filter_quality = "high",
		sun_shadow_map_size = {
			2048,
			2048
		}
	}
}
LocalLightShadowQuality = {
	low = {
		local_lights_shadow_map_filter_quality = "low",
		local_lights_shadow_atlas_size = {
			2048,
			2048
		}
	},
	medium = {
		local_lights_shadow_map_filter_quality = "medium",
		local_lights_shadow_atlas_size = {
			2048,
			2048
		}
	},
	high = {
		local_lights_shadow_map_filter_quality = "high",
		local_lights_shadow_atlas_size = {
			2048,
			2048
		}
	},
	extreme = {
		local_lights_shadow_map_filter_quality = "high",
		local_lights_shadow_atlas_size = {
			2048,
			2048
		}
	}
}
VolumetricFogQuality = {
	lowest = {
		volumetric_extrapolation_high_quality = false,
		volumetric_lighting_local_shadows = false,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_volumes_enabled = false,
		volumetric_reprojection_amount = 1,
		volumetric_lighting_local_lights = false,
		volumetric_data_size = {
			64,
			48,
			96
		}
	},
	low = {
		volumetric_extrapolation_high_quality = false,
		volumetric_lighting_local_shadows = false,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_volumes_enabled = true,
		volumetric_reprojection_amount = 0.875,
		volumetric_lighting_local_lights = false,
		volumetric_data_size = {
			80,
			64,
			96
		}
	},
	medium = {
		volumetric_extrapolation_high_quality = true,
		volumetric_lighting_local_shadows = false,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_volumes_enabled = true,
		volumetric_reprojection_amount = 0.625,
		volumetric_lighting_local_lights = true,
		volumetric_data_size = {
			96,
			80,
			128
		}
	},
	high = {
		volumetric_extrapolation_high_quality = true,
		volumetric_lighting_local_shadows = true,
		volumetric_extrapolation_volumetric_shadows = false,
		volumetric_volumes_enabled = true,
		volumetric_reprojection_amount = 0,
		volumetric_lighting_local_lights = true,
		volumetric_data_size = {
			128,
			96,
			160
		}
	},
	extreme = {
		volumetric_extrapolation_high_quality = true,
		volumetric_lighting_local_shadows = true,
		volumetric_extrapolation_volumetric_shadows = true,
		volumetric_volumes_enabled = true,
		volumetric_reprojection_amount = -0.875,
		volumetric_lighting_local_lights = true,
		volumetric_data_size = {
			144,
			112,
			196
		}
	}
}
TextureQuality = {
	default_characters = script_data.settings.default_characters_texture_quality or "high",
	default_environment = script_data.settings.default_environment_texture_quality or "high",
	characters = {
		low = {
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_df"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_dfa"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_ma"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_nm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_df_1p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_ma_1p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/character_nm_1p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_df_3p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_ma_3p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_nm_3p"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_df"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_ma"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_mae"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_nm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/weapon_dfa"
			}
		},
		medium = {
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_df"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_dfa"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_ma"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_nm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_df_1p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_ma_1p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/character_nm_1p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_df_3p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_ma_3p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_nm_3p"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_df"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_ma"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_mae"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_nm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/weapon_dfa"
			}
		},
		high = {
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_df"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_dfa"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_ma"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_nm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_df_1p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_ma_1p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/character_nm_1p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_df_3p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_ma_3p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_nm_3p"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_df"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_ma"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_mae"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_nm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/weapon_dfa"
			}
		}
	},
	environment = {
		low = {
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_df"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_dfa"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_dfa1"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_gsm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_nm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_hm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_hma"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_df"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_dfa"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_nm"
			},
			{
				mip_level = 2,
				texture_setting = "texture_categories/environment_streamable_ma"
			}
		},
		medium = {
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_df"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_dfa"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_dfa1"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_gsm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_nm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_hm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_hma"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_df"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_dfa"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_nm"
			},
			{
				mip_level = 1,
				texture_setting = "texture_categories/environment_streamable_ma"
			}
		},
		high = {
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_df"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_dfa"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_dfa1"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_gsm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_nm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_hm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_hma"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_df"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_dfa"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_nm"
			},
			{
				mip_level = 0,
				texture_setting = "texture_categories/environment_streamable_ma"
			}
		}
	}
}
GraphicsQuality = {
	lowest = {
		user_settings = {
			particles_quality = "lowest",
			use_physic_debris = false,
			use_high_quality_fur = false,
			local_light_shadow_quality = "low",
			volumetric_fog_quality = "lowest",
			num_blood_decals = 0,
			animation_lod_distance_multiplier = 0,
			ao_quality = "off",
			char_texture_quality = "low",
			ambient_light_quality = "low",
			sun_shadow_quality = "low",
			env_texture_quality = "low"
		},
		render_settings = {
			light_shafts_enabled = false,
			lens_quality_enabled = false,
			sharpen_enabled = false,
			fxaa_enabled = false,
			skin_material_enabled = false,
			forward_local_lights_cast_shadows = false,
			sun_shadows = false,
			sun_flare_enabled = false,
			dof_enabled = false,
			ssr_enabled = false,
			bloom_enabled = false,
			deferred_local_lights_cast_shadows = false,
			taa_enabled = false,
			ssr_high_quality = false,
			low_res_transparency = true,
			max_shadow_casting_lights = 0,
			lod_scatter_density = 0,
			motion_blur_enabled = false
		}
	},
	low = {
		user_settings = {
			particles_quality = "low",
			use_physic_debris = false,
			use_high_quality_fur = false,
			local_light_shadow_quality = "low",
			volumetric_fog_quality = "low",
			num_blood_decals = 10,
			animation_lod_distance_multiplier = 0,
			ao_quality = "off",
			char_texture_quality = "low",
			ambient_light_quality = "low",
			sun_shadow_quality = "low",
			env_texture_quality = "low"
		},
		render_settings = {
			light_shafts_enabled = false,
			lens_quality_enabled = false,
			sharpen_enabled = false,
			fxaa_enabled = false,
			skin_material_enabled = false,
			forward_local_lights_cast_shadows = false,
			sun_shadows = true,
			sun_flare_enabled = false,
			dof_enabled = false,
			ssr_enabled = false,
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = false,
			taa_enabled = false,
			ssr_high_quality = false,
			low_res_transparency = true,
			max_shadow_casting_lights = 0,
			lod_scatter_density = 0.25,
			motion_blur_enabled = false
		}
	},
	medium = {
		user_settings = {
			particles_quality = "medium",
			use_physic_debris = true,
			use_high_quality_fur = false,
			local_light_shadow_quality = "medium",
			volumetric_fog_quality = "medium",
			num_blood_decals = 25,
			animation_lod_distance_multiplier = 0.5,
			ao_quality = "medium",
			char_texture_quality = "medium",
			ambient_light_quality = "high",
			sun_shadow_quality = "medium",
			env_texture_quality = "medium"
		},
		render_settings = {
			light_shafts_enabled = true,
			lens_quality_enabled = false,
			sharpen_enabled = false,
			fxaa_enabled = true,
			skin_material_enabled = false,
			forward_local_lights_cast_shadows = true,
			sun_shadows = true,
			sun_flare_enabled = true,
			dof_enabled = false,
			ssr_enabled = false,
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			taa_enabled = false,
			ssr_high_quality = false,
			low_res_transparency = true,
			max_shadow_casting_lights = 1,
			lod_scatter_density = 0.5,
			motion_blur_enabled = true
		}
	},
	high = {
		user_settings = {
			particles_quality = "high",
			use_physic_debris = true,
			use_high_quality_fur = true,
			local_light_shadow_quality = "high",
			volumetric_fog_quality = "high",
			num_blood_decals = 50,
			animation_lod_distance_multiplier = 1,
			ao_quality = "high",
			char_texture_quality = "high",
			ambient_light_quality = "high",
			sun_shadow_quality = "high",
			env_texture_quality = "high"
		},
		render_settings = {
			light_shafts_enabled = true,
			lens_quality_enabled = true,
			sharpen_enabled = true,
			fxaa_enabled = false,
			skin_material_enabled = true,
			forward_local_lights_cast_shadows = true,
			sun_shadows = true,
			sun_flare_enabled = true,
			dof_enabled = true,
			ssr_enabled = true,
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			taa_enabled = true,
			ssr_high_quality = false,
			low_res_transparency = false,
			max_shadow_casting_lights = 2,
			lod_scatter_density = 1,
			motion_blur_enabled = true
		}
	},
	extreme = {
		user_settings = {
			particles_quality = "extreme",
			use_physic_debris = true,
			use_high_quality_fur = true,
			local_light_shadow_quality = "extreme",
			volumetric_fog_quality = "extreme",
			num_blood_decals = 100,
			animation_lod_distance_multiplier = 1,
			ao_quality = "extreme",
			char_texture_quality = "high",
			ambient_light_quality = "high",
			sun_shadow_quality = "extreme",
			env_texture_quality = "high"
		},
		render_settings = {
			light_shafts_enabled = true,
			lens_quality_enabled = true,
			sharpen_enabled = true,
			fxaa_enabled = false,
			skin_material_enabled = true,
			forward_local_lights_cast_shadows = true,
			sun_shadows = true,
			sun_flare_enabled = true,
			dof_enabled = true,
			ssr_enabled = true,
			bloom_enabled = true,
			deferred_local_lights_cast_shadows = true,
			taa_enabled = true,
			ssr_high_quality = false,
			low_res_transparency = false,
			max_shadow_casting_lights = 6,
			lod_scatter_density = 1,
			motion_blur_enabled = true
		}
	},
	custom = {
		is_custom = true,
		user_settings = {},
		render_settings = {}
	}
}
