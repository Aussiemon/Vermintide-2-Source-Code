local video_settings_definition = {
	{
		text = "settings_view_header_display",
		widget_type = "title"
	},
	{
		setup = "cb_fullscreen_setup",
		saved_value = "cb_fullscreen_saved_value",
		callback = "cb_fullscreen",
		tooltip_text = "tooltip_screen_mode",
		widget_type = "drop_down"
	},
	{
		setup = "cb_resolutions_setup",
		name = "resolutions",
		saved_value = "cb_resolutions_saved_value",
		callback = "cb_resolutions",
		ignore_upper_case = true,
		tooltip_text = "tooltip_resolutions",
		widget_type = "drop_down"
	},
	{
		setup = "cb_minimize_on_alt_tab_setup",
		name = "minimize_on_alt_tab",
		saved_value = "cb_minimize_on_alt_tab_saved_value",
		callback = "cb_minimize_on_alt_tab",
		tooltip_text = "tooltip_minimize_on_alt_tab",
		widget_type = "stepper"
	},
	{
		setup = "cb_fov_setup",
		saved_value = "cb_fov_saved_value",
		callback = "cb_fov",
		tooltip_text = "tooltip_fov",
		widget_type = "slider"
	},
	{
		setup = "cb_vsync_setup",
		saved_value = "cb_vsync_saved_value",
		callback = "cb_vsync",
		tooltip_text = "tooltip_vsync",
		widget_type = "stepper"
	},
	{
		setup = "cb_lock_framerate_setup",
		saved_value = "cb_lock_framerate_saved_value",
		callback = "cb_lock_framerate",
		tooltip_text = "tooltip_lock_framerate",
		widget_type = "stepper"
	},
	{
		setup = "cb_max_stacking_frames_setup",
		saved_value = "cb_max_stacking_frames_saved_value",
		callback = "cb_max_stacking_frames",
		tooltip_text = "tooltip_max_stacking_frames",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamma_setup",
		saved_value = "cb_gamma_saved_value",
		callback = "cb_gamma",
		tooltip_text = "tooltip_gamma",
		widget_type = "slider",
		slider_image = {
			slider_image = "gamma_settings_image_02",
			size = {
				420,
				50
			}
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_overall_quality",
		widget_type = "title"
	},
	{
		setup = "cb_graphics_quality_setup",
		name = "graphics_quality_settings",
		saved_value = "cb_graphics_quality_saved_value",
		callback = "cb_graphics_quality",
		tooltip_text = "tooltip_graphics_quality",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_textures",
		widget_type = "title"
	},
	{
		setup = "cb_char_texture_quality_setup",
		saved_value = "cb_char_texture_quality_saved_value",
		callback = "cb_char_texture_quality",
		tooltip_text = "tooltip_char_texture_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_env_texture_quality_setup",
		saved_value = "cb_env_texture_quality_saved_value",
		callback = "cb_env_texture_quality",
		tooltip_text = "tooltip_env_texture_quality",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_particles",
		widget_type = "title"
	},
	{
		setup = "cb_particles_quality_setup",
		saved_value = "cb_particles_quality_saved_value",
		callback = "cb_particles_quality",
		tooltip_text = "tooltip_particle_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_particles_resolution_setup",
		saved_value = "cb_particles_resolution_saved_value",
		callback = "cb_particles_resolution",
		tooltip_text = "tooltip_low_resolution_transparency",
		widget_type = "stepper"
	},
	{
		setup = "cb_scatter_density_setup",
		saved_value = "cb_scatter_density_saved_value",
		callback = "cb_scatter_density",
		tooltip_text = "tooltip_scatter_density",
		widget_type = "stepper"
	},
	{
		setup = "cb_blood_decals_setup",
		saved_value = "cb_blood_decals_saved_value",
		callback = "cb_blood_decals",
		tooltip_text = "tooltip_blood_decals",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_lighting",
		widget_type = "title"
	},
	{
		setup = "cb_local_light_shadow_quality_setup",
		saved_value = "cb_local_light_shadow_quality_saved_value",
		callback = "cb_local_light_shadow_quality",
		tooltip_text = "tooltip_local_light_shadows",
		widget_type = "stepper"
	},
	{
		setup = "cb_sun_shadows_setup",
		saved_value = "cb_sun_shadows_saved_value",
		callback = "cb_sun_shadows",
		tooltip_text = "tooltip_sun_shadows",
		widget_type = "stepper"
	},
	{
		setup = "cb_maximum_shadow_casting_lights_setup",
		saved_value = "cb_maximum_shadow_casting_lights_saved_value",
		callback = "cb_maximum_shadow_casting_lights",
		tooltip_text = "tooltip_max_local_light_shadows",
		widget_type = "slider"
	},
	{
		setup = "cb_volumetric_fog_quality_setup",
		saved_value = "cb_volumetric_fog_quality_saved_value",
		callback = "cb_volumetric_fog_quality",
		tooltip_text = "tooltip_volumetric_fog_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_ambient_light_quality_setup",
		saved_value = "cb_ambient_light_quality_saved_value",
		callback = "cb_ambient_light_quality",
		tooltip_text = "tooltip_ambient_light_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_auto_exposure_speed_setup",
		saved_value = "cb_auto_exposure_speed_saved_value",
		callback = "cb_auto_exposure_speed",
		tooltip_text = "tooltip_auto_exposure",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_post_processing",
		widget_type = "title"
	},
	{
		setup = "cb_anti_aliasing_setup",
		saved_value = "cb_anti_aliasing_saved_value",
		callback = "cb_anti_aliasing",
		tooltip_text = "tooltip_anti_aliasing",
		widget_type = "drop_down"
	},
	{
		setup = "cb_sharpen_setup",
		saved_value = "cb_sharpen_saved_value",
		callback = "cb_sharpen",
		tooltip_text = "tooltip_sharpen",
		widget_type = "stepper"
	},
	{
		setup = "cb_ssao_setup",
		saved_value = "cb_ssao_saved_value",
		callback = "cb_ssao",
		tooltip_text = "tooltip_ssao",
		widget_type = "stepper"
	},
	{
		setup = "cb_bloom_setup",
		saved_value = "cb_bloom_saved_value",
		callback = "cb_bloom",
		tooltip_text = "tooltip_bloom",
		widget_type = "stepper"
	},
	{
		setup = "cb_skin_shading_setup",
		saved_value = "cb_skin_shading_saved_value",
		callback = "cb_skin_shading",
		tooltip_text = "tooltip_skin_shading",
		widget_type = "stepper"
	},
	{
		setup = "cb_dof_setup",
		saved_value = "cb_dof_saved_value",
		callback = "cb_dof",
		tooltip_text = "tooltip_dof",
		widget_type = "stepper"
	},
	{
		setup = "cb_ssr_setup",
		saved_value = "cb_ssr_saved_value",
		callback = "cb_ssr",
		tooltip_text = "tooltip_ssr",
		widget_type = "stepper"
	},
	{
		setup = "cb_light_shafts_setup",
		saved_value = "cb_light_shafts_saved_value",
		callback = "cb_light_shafts",
		tooltip_text = "tooltip_light_shafts",
		widget_type = "stepper"
	},
	{
		setup = "cb_sun_flare_setup",
		saved_value = "cb_sun_flare_saved_value",
		callback = "cb_sun_flare",
		tooltip_text = "tooltip_sun_flare",
		widget_type = "stepper"
	},
	{
		setup = "cb_lens_quality_setup",
		saved_value = "cb_lens_quality_saved_value",
		callback = "cb_lens_quality",
		tooltip_text = "tooltip_lens_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_motion_blur_setup",
		saved_value = "cb_motion_blur_saved_value",
		callback = "cb_motion_blur",
		tooltip_text = "tooltip_motion_blur",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_other",
		widget_type = "title"
	},
	{
		setup = "cb_physic_debris_setup",
		saved_value = "cb_physic_debris_saved_value",
		callback = "cb_physic_debris",
		tooltip_text = "tooltip_physics_debris",
		widget_type = "stepper"
	},
	{
		setup = "cb_animation_lod_distance_setup",
		saved_value = "cb_animation_lod_distance_saved_value",
		callback = "cb_animation_lod_distance",
		tooltip_text = "tooltip_animation_lod_distance",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	}
}
local subtitles_background_color_preview = Colors.get_color_table_with_alpha("black", UISettings.subtitles_background_alpha)
local audio_settings_definition = {
	{
		text = "settings_view_header_game_sound",
		widget_type = "title"
	},
	{
		setup = "cb_master_volume_setup",
		saved_value = "cb_master_volume_saved_value",
		callback = "cb_master_volume",
		tooltip_text = "tooltip_master_volume",
		widget_type = "slider"
	},
	{
		setup = "cb_music_bus_volume_setup",
		saved_value = "cb_music_bus_volume_saved_value",
		callback = "cb_music_bus_volume",
		tooltip_text = "tooltip_music_volume",
		widget_type = "slider"
	},
	{
		setting_name = "mute_in_background",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_voice_communication",
		widget_type = "title"
	},
	{
		setup = "cb_voip_enabled_setup",
		saved_value = "cb_voip_enabled_saved_value",
		callback = "cb_voip_enabled",
		tooltip_text = "tooltip_voip_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_voip_push_to_talk_setup",
		saved_value = "cb_voip_push_to_talk_saved_value",
		callback = "cb_voip_push_to_talk",
		tooltip_text = "tooltip_voip_push_to_talk",
		widget_type = "stepper"
	},
	{
		setup = "cb_voip_bus_volume_setup",
		saved_value = "cb_voip_bus_volume_saved_value",
		callback = "cb_voip_bus_volume",
		tooltip_text = "tooltip_voip_volume",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_other",
		widget_type = "title"
	},
	{
		setup = "cb_sound_panning_rule_setup",
		saved_value = "cb_sound_panning_rule_saved_value",
		callback = "cb_sound_panning_rule",
		tooltip_text = "tooltip_panning_rule",
		widget_type = "stepper"
	},
	{
		setup = "cb_sound_quality_setup",
		saved_value = "cb_sound_quality_saved_value",
		callback = "cb_sound_quality",
		tooltip_text = "tooltip_sound_quality",
		widget_type = "stepper"
	},
	{
		setup = "cb_dynamic_range_sound_setup",
		saved_value = "cb_dynamic_range_sound_saved_value",
		callback = "cb_dynamic_range_sound",
		tooltip_text = "tooltip_dynamic_range_sound",
		widget_type = "stepper"
	},
	{
		setting_name = "sound_channel_configuration",
		widget_type = "stepper",
		value_set_function = function (content, style, value)
			Wwise.set_bus_config("ingame_mastering_channel", value)
		end,
		options = {
			{
				text = Localize("menu_settings_auto"),
				value = Wwise.AK_SPEAKER_SETUP_AUTO
			},
			{
				text = Localize("menu_settings_mono"),
				value = Wwise.AK_SPEAKER_SETUP_MONO
			},
			{
				text = Localize("menu_settings_stereo"),
				value = Wwise.AK_SPEAKER_SETUP_STEREO
			},
			{
				text = Localize("menu_settings_surround_5_1"),
				value = Wwise.AK_SPEAKER_SETUP_5POINT1
			},
			{
				text = Localize("menu_settings_surround_7_1"),
				value = Wwise.AK_SPEAKER_SETUP_7POINT1
			}
		}
	},
	{
		setup = "cb_subtitles_setup",
		saved_value = "cb_subtitles_saved_value",
		callback = "cb_subtitles",
		tooltip_text = "tooltip_subtitles",
		widget_type = "stepper"
	},
	{
		setting_name = "subtitles_background_opacity",
		widget_type = "slider",
		value_set_function = function (content, style, value)
			subtitles_background_color_preview[1] = 2.55 * value
		end,
		value_saved_function = function (content, style, value)
			subtitles_background_color_preview[1] = 2.55 * value
		end,
		options = {
			decimals = 0,
			min = 0,
			max = 100
		}
	},
	{
		setting_name = "subtitles_font_size",
		widget_type = "slider",
		value_set_function = function (content, style, value)
			style.slider_image_text.font_size = value
		end,
		value_saved_function = function (content, style, value)
			style.slider_image_text.font_size = value
			style.slider_image.color = subtitles_background_color_preview
		end,
		slider_image = {
			slider_image = "rect_masked",
			size = {
				420,
				50
			},
			color = subtitles_background_color_preview
		},
		slider_image_text = {
			text = string.format("%s: %s", Localize("subtitle_name_witch_hunter"), Localize("pwh_activate_ability_zealot_03")),
			font_size = UISettings.subtitles_font_size,
			color = Colors.get_table("white")
		},
		options = {
			decimals = 0,
			min = 16,
			max = 32
		}
	}
}
local gameplay_settings_definition = {
	{
		text = "settings_view_header_input",
		widget_type = "title"
	},
	{
		setup = "cb_mouse_look_sensitivity_setup",
		saved_value = "cb_mouse_look_sensitivity_saved_value",
		callback = "cb_mouse_look_sensitivity",
		tooltip_text = "tooltip_mouselook_sensitivity",
		widget_type = "slider"
	},
	{
		setup = "cb_mouse_look_invert_y_setup",
		saved_value = "cb_mouse_look_invert_y_saved_value",
		callback = "cb_mouse_look_invert_y",
		tooltip_text = "tooltip_mouselook_invert_y",
		widget_type = "stepper"
	},
	{
		setup = "cb_weapon_scroll_type_setup",
		saved_value = "cb_weapon_scroll_type_saved_value",
		callback = "cb_weapon_scroll_type",
		tooltip_text = "tooltip_weapon_scroll_type",
		widget_type = "stepper"
	},
	{
		setup = "cb_double_tap_dodge_setup",
		saved_value = "cb_double_tap_dodge_saved_value",
		callback = "cb_double_tap_dodge",
		tooltip_text = "tooltip_double_tap_dodge",
		widget_type = "stepper"
	},
	{
		setup = "cb_toggle_crouch_setup",
		saved_value = "cb_toggle_crouch_saved_value",
		callback = "cb_toggle_crouch",
		tooltip_text = "tooltip_toggle_crouch",
		widget_type = "stepper"
	},
	{
		setup = "cb_input_buffer_setup",
		saved_value = "cb_input_buffer_saved_value",
		setting_name = "input_buffer",
		callback = "cb_input_buffer",
		tooltip_text = "tooltip_input_buffer",
		widget_type = "slider"
	},
	{
		setup = "cb_priority_input_buffer_setup",
		saved_value = "cb_priority_input_buffer_saved_value",
		setting_name = "priority_input_buffer",
		callback = "cb_priority_input_buffer",
		tooltip_text = "tooltip_priority_input_buffer",
		widget_type = "slider"
	},
	{
		setting_name = "give_on_defend",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setting_name = "social_wheel_delay",
		widget_type = "slider",
		options = {
			decimals = 2,
			min = 0.01,
			max = 0.5
		}
	},
	{
		setting_name = "social_wheel_gamepad_layout",
		widget_type = "stepper",
		options = {
			{
				value = "auto",
				text = Localize("menu_settings_auto")
			},
			{
				value = "always",
				text = Localize("menu_settings_always")
			},
			{
				value = "never",
				text = Localize("menu_settings_never")
			}
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_visual_effects",
		widget_type = "title"
	},
	{
		setting_name = "head_bob",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setting_name = "camera_shake",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setup = "cb_player_outlines_setup",
		saved_value = "cb_player_outlines_saved_value",
		callback = "cb_player_outlines",
		tooltip_text = "tooltip_outlines",
		widget_type = "stepper"
	},
	{
		setup = "cb_blood_enabled_setup",
		saved_value = "cb_blood_enabled_saved_value",
		callback = "cb_blood_enabled",
		tooltip_text = "tooltip_blood_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_screen_blood_enabled_setup",
		saved_value = "cb_screen_blood_enabled_saved_value",
		callback = "cb_screen_blood_enabled",
		tooltip_text = "tooltip_screen_blood_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_dismemberment_enabled_setup",
		saved_value = "cb_dismemberment_enabled_saved_value",
		callback = "cb_dismemberment_enabled",
		tooltip_text = "tooltip_dismemberment_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_ragdoll_enabled_setup",
		saved_value = "cb_ragdoll_enabled_saved_value",
		callback = "cb_ragdoll_enabled",
		tooltip_text = "tooltip_ragdoll_enabled",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_interface",
		widget_type = "title"
	},
	{
		setup = "cb_hud_custom_scale_setup",
		saved_value = "cb_hud_custom_scale_saved_value",
		callback = "cb_hud_custom_scale",
		tooltip_text = "tooltip_hud_custom_scale",
		widget_type = "stepper"
	},
	{
		setup = "cb_hud_scale_setup",
		callback_on_release = true,
		saved_value = "cb_hud_scale_saved_value",
		callback = "cb_hud_scale",
		name = "hud_scale",
		tooltip_text = "tooltip_hud_scale",
		widget_type = "slider"
	},
	{
		setup = "cb_hud_clamp_ui_scaling_setup",
		saved_value = "cb_hud_clamp_ui_scaling_saved_value",
		callback = "cb_hud_clamp_ui_scaling",
		tooltip_text = "tooltip_hud_clamp_ui_scaling",
		widget_type = "stepper"
	},
	{
		setup = "cb_enabled_crosshairs_setup",
		saved_value = "cb_enabled_crosshairs_saved_value",
		callback = "cb_enabled_crosshairs",
		tooltip_text = "tooltip_enabled_crosshairs",
		widget_type = "stepper"
	},
	{
		setup = "cb_overcharge_opacity_setup",
		saved_value = "cb_overcharge_opacity_saved_value",
		callback = "cb_overcharge_opacity",
		tooltip_text = "tooltip_overcharge_opacity",
		widget_type = "slider"
	},
	{
		setup = "cb_enabled_gamepad_menu_layout_setup",
		saved_value = "cb_enabled_gamepad_menu_layout_saved_value",
		callback = "cb_enabled_gamepad_menu_layout",
		tooltip_text = "tooltip_enabled_gamepad_menu_layout",
		widget_type = "stepper"
	},
	{
		setup = "cb_enabled_gamepad_hud_layout_setup",
		saved_value = "cb_enabled_gamepad_hud_layout_saved_value",
		callback = "cb_enabled_gamepad_hud_layout",
		tooltip_text = "tooltip_enabled_gamepad_hud_layout",
		widget_type = "stepper"
	},
	{
		setting_name = "play_intro_cinematic",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setup = "cb_chat_enabled_setup",
		saved_value = "cb_chat_enabled_saved_value",
		callback = "cb_chat_enabled",
		tooltip_text = "tooltip_chat_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_chat_font_size_setup",
		saved_value = "cb_chat_font_size_saved_value",
		callback = "cb_chat_font_size",
		tooltip_text = "tooltip_chat_font_size",
		widget_type = "drop_down"
	},
	{
		setup = "cb_clan_tag_setup",
		saved_value = "cb_clan_tag_saved_value",
		callback = "cb_clan_tag",
		tooltip_text = "tooltip_clan_tag",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_twitch",
		widget_type = "title"
	},
	{
		setup = "cb_twitch_vote_time_setup",
		saved_value = "cb_twitch_vote_time_saved_value",
		callback = "cb_twitch_vote_time",
		tooltip_text = "tooltip_twitch_vote_time",
		widget_type = "drop_down"
	},
	{
		setup = "cb_twitch_time_between_votes_setup",
		saved_value = "cb_twitch_time_between_votes_saved_value",
		callback = "cb_twitch_time_between_votes",
		tooltip_text = "tooltip_twitch_time_between_votes",
		widget_type = "drop_down"
	},
	{
		setting_name = "twitch_spawn_amount",
		widget_type = "stepper",
		options = {
			{
				value = 1,
				text = Localize("percent_100")
			},
			{
				value = 1.5,
				text = Localize("percent_150")
			},
			{
				value = 2,
				text = Localize("percent_200")
			}
		}
	},
	{
		setting_name = "twitch_disable_positive_votes",
		widget_type = "stepper",
		options = {
			{
				text = Localize("twitch_enable_positive_votes"),
				value = TwitchSettings.positive_vote_options.enable_positive_votes
			},
			{
				text = Localize("twitch_disable_giving_items"),
				value = TwitchSettings.positive_vote_options.disable_giving_items
			},
			{
				text = Localize("twitch_disable_positive_votes"),
				value = TwitchSettings.positive_vote_options.disable_positive_votes
			}
		}
	},
	{
		setting_name = "twitch_disable_mutators",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setting_name = "twitch_mutator_duration",
		widget_type = "stepper",
		options = {
			{
				value = 1,
				text = Localize("percent_100")
			},
			{
				value = 1.5,
				text = Localize("percent_150")
			},
			{
				value = 2,
				text = Localize("percent_200")
			}
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_bots",
		widget_type = "title"
	},
	{
		setup = "cb_bot_spawn_priority_setup",
		saved_value = "cb_bot_spawn_priority_saved_value",
		callback = "cb_bot_spawn_priority",
		tooltip_text = "tooltip_bot_spawn_priority",
		widget_type = "sorted_list"
	},
	{
		size_y = 30,
		widget_type = "empty"
	}
}

local function set_function(self, user_setting_name, widget_type, content, style, value_set_function)
	local new_value = nil

	if widget_type == "slider" then
		new_value = content.value
	else
		local options_values = content.options_values
		local current_selection = content.current_selection
		new_value = options_values[current_selection]
	end

	self.changed_user_settings[user_setting_name] = new_value

	value_set_function(content, style, new_value)
end

local function setup_function(self, user_setting_name, widget_type, options)
	local default_value = DefaultUserSettings.get("user_settings", user_setting_name)
	local current_value = Application.user_setting(user_setting_name)

	if widget_type == "slider" then
		local min = options.min
		local max = options.max
		local decimals = options.decimals
		local value = math.clamp(current_value / (max - min), 0, 1)

		return value, min, max, decimals, "menu_settings_" .. user_setting_name, default_value
	else
		local selection, default_option = nil

		for index, option in ipairs(options) do
			local value = option.value

			if value == current_value then
				selection = index
			end

			if value == default_value then
				default_option = index
			end
		end

		fassert(default_option, "Default value %q for %q does not exist in passed options table", tostring(default_value), user_setting_name)

		selection = selection or default_option

		return selection, options, "menu_settings_" .. user_setting_name, default_option
	end
end

local function saved_value_function(self, user_setting_name, widget_type, widget, saved_function)
	local saved_value = self.changed_user_settings[user_setting_name]

	if saved_value == nil then
		saved_value = Application.user_setting(user_setting_name)
	end

	local default_value = DefaultUserSettings.get("user_settings", user_setting_name)

	if saved_value == nil then
		saved_value = default_value
	end

	local content = widget.content
	local style = widget.style

	if widget_type == "slider" then
		local min = content.min
		local max = content.max
		saved_value = math.clamp(saved_value, min, max)
		content.internal_value = saved_value / (max - min)
		content.value = saved_value
	else
		content.current_selection = table.find(content.options_values, saved_value) or table.find(content.options_values, default_value)
	end

	saved_function(content, style, saved_value)
end

function generate_settings(settings_definition)
	for _, definition in pairs(settings_definition) do
		local setting_name = definition.setting_name

		if setting_name then
			local prefix = "cb_" .. setting_name
			local callback_name = prefix
			definition.callback = prefix
			local widget_type = definition.widget_type

			OptionsView[callback_name] = function (self, content, style)
				return set_function(self, setting_name, widget_type, content, style, definition.value_set_function or NOP)
			end

			local setup_function_name = prefix .. "_setup"
			definition.setup = setup_function_name

			OptionsView[setup_function_name] = function (self)
				return setup_function(self, setting_name, widget_type, definition.options)
			end

			local saved_value_function_name = prefix .. "_saved_value"
			definition.saved_value = saved_value_function_name

			OptionsView[saved_value_function_name] = function (self, widget)
				return saved_value_function(self, setting_name, widget_type, widget, definition.value_saved_function or NOP)
			end

			definition.tooltip_text = "tooltip_" .. setting_name
		end
	end
end

generate_settings(audio_settings_definition)
generate_settings(gameplay_settings_definition)
generate_settings(video_settings_definition)

local LightFX = rawget(_G, "LightFX")
local razerchroma_defined = rawget(_G, "RazerChroma")

if LightFX or RazerChroma then
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		size_y = 30,
		widget_type = "empty"
	}
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		text = "settings_view_header_misc",
		widget_type = "title"
	}
end

if LightFX then
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		setup = "cb_alien_fx_setup",
		saved_value = "cb_alien_fx_saved_value",
		callback = "cb_alien_fx",
		tooltip_text = "tooltip_alien_fx",
		widget_type = "stepper"
	}
end

if RazerChroma then
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		setup = "cb_razer_chroma_setup",
		saved_value = "cb_razer_chroma_saved_value",
		callback = "cb_razer_chroma",
		tooltip_text = "tooltip_razer_chroma",
		widget_type = "stepper"
	}
end

gameplay_settings_definition[#gameplay_settings_definition + 1] = {
	size_y = 110,
	widget_type = "empty"
}
local display_settings_definition = {
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "Monitor",
		widget_type = "title"
	}
}
local keybind_settings_definition = {
	{
		text = "settings_view_header_movement",
		widget_type = "title"
	},
	{
		keybind_description = "move_forward",
		widget_type = "keybind",
		actions = {
			"move_forward",
			"move_forward_pressed"
		}
	},
	{
		keybind_description = "move_left",
		widget_type = "keybind",
		actions = {
			"move_left",
			"move_left_pressed"
		}
	},
	{
		keybind_description = "move_back",
		widget_type = "keybind",
		actions = {
			"move_back",
			"move_back_pressed"
		}
	},
	{
		keybind_description = "move_right",
		widget_type = "keybind",
		actions = {
			"move_right",
			"move_right_pressed"
		}
	},
	{
		keybind_description = "jump_1",
		widget_type = "keybind",
		actions = {
			"jump_1",
			"dodge_hold"
		}
	},
	{
		keybind_description = "jump_only",
		widget_type = "keybind",
		actions = {
			"jump_only"
		}
	},
	{
		keybind_description = "dodge",
		widget_type = "keybind",
		actions = {
			"dodge"
		}
	},
	{
		keybind_description = "crouch",
		widget_type = "keybind",
		actions = {
			"crouch",
			"crouching"
		}
	},
	{
		keybind_description = "walk",
		widget_type = "keybind",
		actions = {
			"walk"
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_combat",
		widget_type = "title"
	},
	{
		keybind_description = "action_one",
		widget_type = "keybind",
		actions = {
			"action_one",
			"action_one_hold",
			"action_one_release",
			"action_one_mouse"
		}
	},
	{
		keybind_description = "action_two",
		widget_type = "keybind",
		actions = {
			"action_two",
			"action_two_hold",
			"action_two_release"
		}
	},
	{
		keybind_description = "weapon_reload",
		widget_type = "keybind",
		actions = {
			"weapon_reload",
			"weapon_reload_hold"
		}
	},
	{
		keybind_description = "action_three",
		widget_type = "keybind",
		actions = {
			"action_three",
			"action_three_hold",
			"action_three_release"
		}
	},
	{
		keybind_description = "input_active_ability",
		widget_type = "keybind",
		actions = {
			"action_career",
			"action_career_hold",
			"action_career_release"
		}
	},
	{
		keybind_description = "ping",
		widget_type = "keybind",
		actions = {
			"ping",
			"ping_hold",
			"ping_release"
		}
	},
	{
		keybind_description = "ping_only",
		widget_type = "keybind",
		actions = {
			"ping_only"
		}
	},
	{
		keybind_description = "ping_only_enemy",
		required_dlc = "carousel",
		widget_type = "keybind",
		actions = {
			"ping_only_enemy"
		}
	},
	{
		keybind_description = "ping_only_movement",
		required_dlc = "carousel",
		widget_type = "keybind",
		actions = {
			"ping_only_movement"
		}
	},
	{
		keybind_description = "ping_only_item",
		required_dlc = "carousel",
		widget_type = "keybind",
		actions = {
			"ping_only_item"
		}
	},
	{
		keybind_description = "social_wheel_only",
		widget_type = "keybind",
		actions = {
			"social_wheel_only",
			"social_wheel_only_hold",
			"social_wheel_only_release"
		}
	},
	{
		keybind_description = "interact",
		widget_type = "keybind",
		actions = {
			"interact",
			"interacting"
		}
	},
	{
		keybind_description = "wield_1",
		widget_type = "keybind",
		actions = {
			"wield_1"
		}
	},
	{
		keybind_description = "wield_2",
		widget_type = "keybind",
		actions = {
			"wield_2"
		}
	},
	{
		keybind_description = "wield_3",
		widget_type = "keybind",
		actions = {
			"wield_3"
		}
	},
	{
		keybind_description = "wield_4",
		widget_type = "keybind",
		actions = {
			"wield_4"
		}
	},
	{
		keybind_description = "wield_5",
		widget_type = "keybind",
		actions = {
			"wield_5"
		}
	},
	{
		keybind_description = "wield_switch_1",
		widget_type = "keybind",
		actions = {
			"wield_switch",
			"wield_switch_1"
		}
	},
	{
		keybind_description = "wield_next",
		widget_type = "keybind",
		actions = {
			"wield_next"
		}
	},
	{
		keybind_description = "wield_prev",
		widget_type = "keybind",
		actions = {
			"wield_prev"
		}
	},
	{
		keybind_description = "character_inspecting",
		widget_type = "keybind",
		actions = {
			"character_inspecting"
		}
	},
	{
		keybind_description = "action_inspect",
		widget_type = "keybind",
		actions = {
			"action_inspect",
			"action_inspect_hold",
			"action_inspect_release"
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_menu_hotkeys",
		widget_type = "title"
	},
	{
		keybind_description = "ingame_player_list_pressed",
		keymappings_key = "IngamePlayerListKeymaps",
		widget_type = "keybind",
		actions = {
			"ingame_player_list_pressed",
			"ingame_player_list_held",
			"ingame_player_list_exit_1"
		}
	},
	{
		keybind_description = "hotkey_map",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_map"
		}
	},
	{
		keybind_description = "hotkey_inventory",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_inventory",
			"hotkey_deus_inventory"
		}
	},
	{
		keybind_description = "hotkey_hero",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_hero"
		}
	},
	{
		keybind_description = "hotkey_store",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_store"
		}
	},
	{
		keybind_description = "hotkey_achievements",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_achievements"
		}
	},
	{
		keybind_description = "hotkey_weave_forge",
		required_dlc = "scorpion",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_weave_forge"
		}
	},
	{
		keybind_description = "hotkey_weave_play",
		required_dlc = "scorpion",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_weave_play"
		}
	},
	{
		keybind_description = "hotkey_weave_leaderboard",
		required_dlc = "scorpion",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_weave_leaderboard"
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_multiplayer",
		widget_type = "title"
	},
	{
		keybind_description = "voip_push_to_talk",
		keymappings_key = "ChatControllerSettings",
		widget_type = "keybind",
		actions = {
			"voip_push_to_talk"
		}
	},
	{
		keybind_description = "activate_chat_input",
		keymappings_key = "ChatControllerSettings",
		widget_type = "keybind",
		actions = {
			"activate_chat_input"
		}
	},
	{
		keybind_description = "execute_chat_input_1",
		keymappings_key = "ChatControllerSettings",
		widget_type = "keybind",
		actions = {
			"execute_chat_input_1"
		}
	},
	{
		keybind_description = "ingame_vote_yes",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"ingame_vote_yes"
		}
	},
	{
		keybind_description = "ingame_vote_no",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"ingame_vote_no"
		}
	},
	{
		keybind_description = "rcon_activate_menu",
		keymappings_key = "RconControllerSettings",
		widget_type = "keybind",
		actions = {
			"activate_menu"
		}
	}
}

for i, keybind_setting in ipairs(keybind_settings_definition) do
	if not keybind_setting.keymappings_key then
		keybind_setting.keymappings_key = "PlayerControllerKeymaps"
	end

	if not keybind_setting.keymappings_table_key then
		keybind_setting.keymappings_table_key = "win32"
	end
end

local ignore_keybind = {
	gamepad_right_axis = true,
	analog_input = true,
	look_raw = true,
	gamepad_left_axis = true,
	wield_scroll = true,
	move_controller = true,
	look_raw_controller = true,
	scroll_axis = true,
	cursor = true
}
local gamepad_settings_definition = {
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		bg_image2 = "controller_image_ps4",
		bg_image = "controller_image_xb1",
		widget_type = "gamepad_layout",
		bg_image_size = {
			1260,
			400
		},
		bg_image_size2 = {
			1260,
			440
		}
	},
	{
		setup = "cb_gamepad_layout_setup",
		name = "gamepad_layout",
		saved_value = "cb_gamepad_layout_saved_value",
		callback = "cb_gamepad_layout",
		tooltip_text = "tooltip_gamepad_layout",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_left_handed_enabled_setup",
		saved_value = "cb_gamepad_left_handed_enabled_saved_value",
		callback = "cb_gamepad_left_handed_enabled",
		tooltip_text = "tooltip_gamepad_left_handed_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_look_invert_y_setup",
		saved_value = "cb_gamepad_look_invert_y_saved_value",
		callback = "cb_gamepad_look_invert_y",
		tooltip_text = "tooltip_gamepad_invert_y",
		widget_type = "stepper"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		setup = "cb_gamepad_look_sensitivity_setup",
		saved_value = "cb_gamepad_look_sensitivity_saved_value",
		callback = "cb_gamepad_look_sensitivity",
		tooltip_text = "tooltip_gamepad_look_sensitivity",
		widget_type = "slider"
	},
	{
		size_y = 10,
		widget_type = "empty"
	},
	{
		setup = "cb_gamepad_look_sensitivity_y_setup",
		saved_value = "cb_gamepad_look_sensitivity_y_saved_value",
		callback = "cb_gamepad_look_sensitivity_y",
		tooltip_text = "tooltip_gamepad_look_sensitivity",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		setup = "cb_gamepad_zoom_sensitivity_setup",
		saved_value = "cb_gamepad_zoom_sensitivity_saved_value",
		callback = "cb_gamepad_zoom_sensitivity",
		tooltip_text = "tooltip_gamepad_zoom_sensitivity",
		widget_type = "slider"
	},
	{
		size_y = 10,
		widget_type = "empty"
	},
	{
		setup = "cb_gamepad_zoom_sensitivity_y_setup",
		saved_value = "cb_gamepad_zoom_sensitivity_y_saved_value",
		callback = "cb_gamepad_zoom_sensitivity_y",
		tooltip_text = "tooltip_gamepad_zoom_sensitivity",
		widget_type = "slider"
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		setup = "cb_gamepad_auto_aim_enabled_setup",
		saved_value = "cb_gamepad_auto_aim_enabled_saved_value",
		callback = "cb_gamepad_auto_aim_enabled",
		tooltip_text = "tooltip_gamepad_auto_aim_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_acceleration_enabled_setup",
		saved_value = "cb_gamepad_acceleration_enabled_saved_value",
		callback = "cb_gamepad_acceleration_enabled",
		tooltip_text = "tooltip_gamepad_acceleration_enabled",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_rumble_enabled_setup",
		saved_value = "cb_gamepad_rumble_enabled_saved_value",
		callback = "cb_gamepad_rumble_enabled",
		tooltip_text = "tooltip_gamepad_rumble_enabled_pc",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_use_ps4_style_input_icons_setup",
		saved_value = "cb_gamepad_use_ps4_style_input_icons_saved_value",
		callback = "cb_gamepad_use_ps4_style_input_icons",
		tooltip_text = "tooltip_gamepad_use_ps4_style_input_icons",
		widget_type = "stepper"
	}
}
local tobii_settings_definition = nil

if rawget(_G, "Tobii") then
	tobii_settings_definition = {}

	local function add_stepper(name, tooltip_text)
		tobii_settings_definition[#tobii_settings_definition + 1] = {
			widget_type = "stepper",
			callback = "cb_" .. name,
			setup = "cb_" .. name .. "_setup",
			saved_value = "cb_" .. name .. "_saved_value",
			tooltip_text = tooltip_text
		}
	end

	local function add_slider(name, tooltip_text)
		tobii_settings_definition[#tobii_settings_definition + 1] = {
			widget_type = "slider",
			callback = "cb_" .. name,
			setup = "cb_" .. name .. "_setup",
			saved_value = "cb_" .. name .. "_saved_value",
			tooltip_text = tooltip_text
		}
	end

	tobii_settings_definition[#tobii_settings_definition + 1] = {
		text = "settings_view_header_eyetracker",
		widget_type = "title"
	}

	add_stepper("tobii_eyetracking", "tooltip_tobii_eyetracking")
	add_stepper("tobii_extended_view", "tooltip_tobii_extended_view")
	add_slider("tobii_extended_view_sensitivity", "tooltip_tobii_extended_view_sensitivity")
	add_stepper("tobii_extended_view_use_head_tracking", "tooltip_tobii_extended_view_use_head_tracking")
	add_stepper("tobii_aim_at_gaze", "tooltip_tobii_aim_at_gaze")
	add_stepper("tobii_fire_at_gaze", "tooltip_tobii_fire_at_gaze")
	add_stepper("tobii_clean_ui", "tooltip_tobii_clean_ui")
end

local network_settings_definition = {
	{
		text = "settings_view_matchmaking_display",
		widget_type = "title"
	},
	{
		setting_name = "allow_occupied_hero_lobbies",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		setting_name = "always_ask_hero_when_joining",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	},
	{
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_other",
		widget_type = "title"
	},
	{
		setup = "cb_max_upload_speed_setup",
		saved_value = "cb_max_upload_speed_saved_value",
		callback = "cb_max_upload_speed",
		tooltip_text = "tooltip_max_upload_speed",
		widget_type = "drop_down"
	},
	{
		setup = "cb_small_network_packets_setup",
		saved_value = "cb_small_network_packets_saved_value",
		callback = "cb_small_network_packets",
		tooltip_text = "tooltip_small_network_packets",
		widget_type = "stepper"
	},
	{
		setup = "cb_max_quick_play_search_range_setup",
		saved_value = "cb_max_quick_play_search_range_saved_value",
		callback = "cb_max_quick_play_search_range",
		tooltip_text = "tooltip_max_quick_play_search_range",
		widget_type = "drop_down"
	},
	{
		setting_name = "show_numerical_latency",
		widget_type = "stepper",
		options = {
			{
				value = true,
				text = Localize("menu_settings_on")
			},
			{
				value = false,
				text = Localize("menu_settings_off")
			}
		}
	}
}

generate_settings(network_settings_definition)

local needs_reload_settings = {
	"screen_resolution",
	"fullscreen",
	"borderless_fullscreen",
	"vsync",
	"gamma",
	"skin_material_enabled",
	"char_texture_quality",
	"env_texture_quality",
	"sun_shadows",
	"sun_shadow_quality",
	"taa_enabled",
	"graphics_quality",
	"adapter_index",
	"use_physic_debris",
	"max_shadow_casting_lights",
	"local_light_shadow_quality",
	"lod_object_multiplier",
	"lod_scatter_density",
	"dof_enabled",
	"ssr_enabled",
	"ssr_high_quality",
	"low_res_transparency",
	"volumetric_lighting_local_lights",
	"volumetric_lighting_local_shadows",
	"volumetric_data_size",
	"volumetric_extrapolation_high_quality",
	"volumetric_extrapolation_volumetric_shadows",
	"ambient_light_quality",
	"particles_quality",
	"ao_quality",
	"local_probes_enabled",
	"volumetric_fog_quality"
}
local needs_restart_settings = {
	"char_texture_quality",
	"env_texture_quality",
	"use_physic_debris",
	"use_baked_enemy_meshes"
}
SettingsMenuNavigation = {
	"gameplay_settings",
	"video_settings",
	"audio_settings",
	"keybind_settings",
	"gamepad_settings",
	"network_settings"
}
TutorialSettingsMenuNavigation = {
	true,
	true,
	true,
	true,
	true,
	true,
	true
}
local title_button_definitions = {
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_1", "settings_view_gameplay", 18),
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_3", "settings_view_video", 18),
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_4", "settings_view_sound", 18),
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_5", "settings_view_keybind", 18),
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_6", "settings_view_gamepad", 18),
	[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_7", "settings_view_network", 18)
}

if rawget(_G, "Tobii") then
	title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_text_button("settings_button_8", "settings_view_eyetracking", 18)
	SettingsMenuNavigation[#SettingsMenuNavigation + 1] = "tobii_eyetracking_settings"
end

return {
	video_settings_definition = video_settings_definition,
	audio_settings_definition = audio_settings_definition,
	gameplay_settings_definition = gameplay_settings_definition,
	display_settings_definition = display_settings_definition,
	keybind_settings_definition = keybind_settings_definition,
	gamepad_settings_definition = gamepad_settings_definition,
	tobii_settings_definition = tobii_settings_definition,
	network_settings_definition = network_settings_definition,
	needs_restart_settings = needs_restart_settings,
	needs_reload_settings = needs_reload_settings,
	ignore_keybind = ignore_keybind,
	title_button_definitions = title_button_definitions
}
