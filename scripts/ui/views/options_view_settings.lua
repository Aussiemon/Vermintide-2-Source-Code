local function assigned(a, b)
	if a == nil then
		return b
	else
		return a
	end

	return 
end

local function set_function(self, user_setting_name, content, value_set_function)
	local options_values = content.options_values
	local current_selection = content.current_selection
	local new_value = options_values[current_selection]
	self.changed_user_settings[user_setting_name] = new_value

	value_set_function(new_value)

	return 
end

local function setup_function(self, user_setting_name, options)
	local default_value = DefaultUserSettings.get("user_settings", user_setting_name)
	local current_value = Application.user_setting(user_setting_name)
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

local function saved_value_function(self, user_setting_name, widget)
	local saved_value = assigned(self.changed_user_settings[user_setting_name], Application.user_setting(user_setting_name))
	local default_value = DefaultUserSettings.get("user_settings", user_setting_name)

	if saved_value == nil then
		saved_value = default_value
	end

	local saved_index, default_index = nil
	local content = widget.content

	for index, value in pairs(content.options_values) do
		if value == saved_value then
			saved_index = index
		end

		if value == default_value then
			default_index = index
		end
	end

	content.current_selection = saved_index or default_index

	return 
end

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
		tooltip_text = "tooltip_resolutions",
		widget_type = "drop_down"
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
			slider_image = "settings_debug_gamma_correction",
			size = {
				500,
				120
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
		setup = "cb_high_quality_fur_setup",
		saved_value = "cb_high_quality_fur_saved_value",
		callback = "cb_high_quality_fur",
		tooltip_text = "tooltip_high_quality_fur",
		widget_type = "stepper"
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
		tooltip_text = "tooltip_light_shaft",
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
		setup = "cb_subtitles_setup",
		saved_value = "cb_subtitles_saved_value",
		callback = "cb_subtitles",
		tooltip_text = "tooltip_subtitles",
		widget_type = "stepper"
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
		size_y = 30,
		widget_type = "empty"
	},
	{
		text = "settings_view_header_interface",
		widget_type = "title"
	},
	{
		setup = "cb_ui_scale_setup",
		callback_on_release = true,
		saved_value = "cb_ui_scale_saved_value",
		callback = "cb_ui_scale",
		tooltip_text = "tooltio_ui_scale",
		widget_type = "slider"
	},
	{
		setup = "cb_hud_screen_fit_setup",
		saved_value = "cb_hud_screen_fit_saved_value",
		callback = "cb_hud_screen_fit",
		tooltip_text = "tooltip_hud_screen_fit",
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
		setup = "cb_tutorials_enabled_setup",
		saved_value = "cb_tutorials_enabled_saved_value",
		callback = "cb_tutorials_enabled",
		tooltip_text = "tooltip_tutorials_enabled",
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
		size_y = 30,
		widget_type = "empty"
	}
}

function generate_settings(settings_definition)
	for _, definition in pairs(settings_definition) do
		local setting_name = definition.setting_name

		if setting_name then
			local prefix = "cb_" .. setting_name
			local callback_name = prefix
			definition.callback = prefix
			OptionsView[callback_name] = function (self, content)
				return set_function(self, setting_name, content, definition.value_set_function or function ()
					return 
				end)
			end
			local setup_function_name = prefix .. "_setup"
			definition.setup = setup_function_name
			OptionsView[setup_function_name] = function (self)
				return setup_function(self, setting_name, definition.options)
			end
			local saved_value_function_name = prefix .. "_saved_value"
			definition.saved_value = saved_value_function_name
			OptionsView[saved_value_function_name] = function (self, widget)
				return saved_value_function(self, setting_name, widget)
			end
			definition.tooltip_text = "tooltip_" .. setting_name
		end
	end

	return 
end

generate_settings(gameplay_settings_definition)
generate_settings(video_settings_definition)

if rawget(_G, "Steam") then
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		setup = "cb_clan_tag_setup",
		saved_value = "cb_clan_tag_saved_value",
		callback = "cb_clan_tag",
		tooltip_text = "tooltip_clan_tag",
		widget_type = "stepper"
	}
end

if rawget(_G, "LightFX") then
	gameplay_settings_definition[#gameplay_settings_definition + 1] = {
		setup = "cb_alien_fx_setup",
		saved_value = "cb_alien_fx_saved_value",
		callback = "cb_alien_fx",
		tooltip_text = "tooltip_alien_fx",
		widget_type = "stepper"
	}
end

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
		keybind_description = "input_active_ability",
		widget_type = "keybind",
		actions = {
			"function_career",
			"function_career_release",
			"action_career",
			"action_career_hold",
			"action_career_release",
			"action_career_bw_1",
			"action_career_bw_2",
			"action_career_bw_3",
			"action_career_dr_1",
			"action_career_dr_2",
			"action_career_dr_3",
			"action_career_es_1",
			"action_career_es_2",
			"action_career_es_3",
			"action_career_wh_1",
			"action_career_wh_2",
			"action_career_wh_3",
			"action_career_we_1",
			"action_career_we_2",
			"action_career_we_3",
			"action_career_bw_1_release",
			"action_career_bw_2_release",
			"action_career_bw_3_release",
			"action_career_dr_1_release",
			"action_career_dr_2_release",
			"action_career_dr_3_release",
			"action_career_es_1_release",
			"action_career_es_2_release",
			"action_career_es_3_release",
			"action_career_wh_1_release",
			"action_career_wh_2_release",
			"action_career_wh_3_release",
			"action_career_we_1_release",
			"action_career_we_2_release",
			"action_career_we_3_release"
		}
	},
	{
		keybind_description = "ping",
		widget_type = "keybind",
		actions = {
			"ping"
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
			"hotkey_inventory"
		}
	},
	{
		keybind_description = "hotkey_forge",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_forge"
		}
	},
	{
		keybind_description = "hotkey_lobby_browser",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"hotkey_lobby_browser"
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
		keybind_description = "matchmaking_ready",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"matchmaking_ready"
		}
	},
	{
		keybind_description = "matchmaking_start",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"matchmaking_start"
		}
	},
	{
		keybind_description = "cancel_matchmaking",
		keymappings_key = "IngameMenuKeymaps",
		widget_type = "keybind",
		actions = {
			"cancel_matchmaking"
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
		bg_image2 = "controller_image_ps4",
		bg_image = "controller_image_xb1",
		widget_type = "gamepad_layout",
		bg_image_size = {
			907.1999999999999,
			288
		},
		bg_image_size2 = {
			1260,
			440
		}
	},
	{
		setup = "cb_gamepad_left_handed_enabled_setup",
		saved_value = "cb_gamepad_left_handed_enabled_saved_value",
		callback = "cb_gamepad_left_handed_enabled",
		tooltip_text = "tooltip_gamepad_left_handed_enabled",
		widget_type = "stepper"
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
		setup = "cb_gamepad_look_invert_y_setup",
		saved_value = "cb_gamepad_look_invert_y_saved_value",
		callback = "cb_gamepad_look_invert_y",
		tooltip_text = "tooltip_gamepad_invert_y",
		widget_type = "stepper"
	},
	{
		setup = "cb_gamepad_look_sensitivity_setup",
		saved_value = "cb_gamepad_look_sensitivity_saved_value",
		callback = "cb_gamepad_look_sensitivity",
		tooltip_text = "tooltip_gamepad_look_sensitivity",
		widget_type = "slider"
	},
	{
		setup = "cb_gamepad_zoom_sensitivity_setup",
		saved_value = "cb_gamepad_zoom_sensitivity_saved_value",
		callback = "cb_gamepad_zoom_sensitivity",
		tooltip_text = "tooltip_gamepad_zoom_sensitivity",
		widget_type = "slider"
	},
	{
		setup = "cb_gamepad_auto_aim_enabled_setup",
		saved_value = "cb_gamepad_auto_aim_enabled_saved_value",
		callback = "cb_gamepad_auto_aim_enabled",
		tooltip_text = "tooltip_gamepad_auto_aim_enabled",
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

		return 
	end

	local function add_slider(name, tooltip_text)
		tobii_settings_definition[#tobii_settings_definition + 1] = {
			widget_type = "slider",
			callback = "cb_" .. name,
			setup = "cb_" .. name .. "_setup",
			saved_value = "cb_" .. name .. "_saved_value",
			tooltip_text = tooltip_text
		}

		return 
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
		size_y = 30,
		widget_type = "empty"
	},
	{
		setup = "cb_max_upload_speed_setup",
		saved_value = "cb_max_upload_speed_saved_value",
		callback = "cb_max_upload_speed",
		tooltip_text = "tooltip_max_upload_speed",
		widget_type = "drop_down"
	}
}
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
	"reflection_probes_enabled",
	"radiance_probes_enabled",
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
