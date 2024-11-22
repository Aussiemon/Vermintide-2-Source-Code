-- chunkname: @scripts/ui/hud_ui/dark_pact_ability_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = false
local scenegraph_definition = {
	screen = {
		scale = "hud_scale_fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	ability_root = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			-90,
			300,
			10,
		},
		size = {
			1,
			1,
		},
	},
	horde_ability_root = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			-360,
			40,
			10,
		},
		size = {
			1,
			1,
		},
	},
	crosshair_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			1,
			1,
		},
	},
	bottom_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			10,
		},
		size = {
			1,
			1,
		},
	},
	ability_pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			40,
			10,
		},
		size = {
			1,
			1,
		},
	},
	ammo_parent = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			-50,
			140,
			10,
		},
		size = {
			383,
			86,
		},
	},
}
local widget_definitions = {
	abilities_detail_left = UIWidgets.create_simple_texture("health_bar_addon", "ability_pivot", nil, nil, {
		255,
		255,
		255,
		255,
	}, nil, {
		88,
		68,
	}),
	abilities_detail_right = UIWidgets.create_simple_uv_texture("health_bar_addon", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "ability_pivot", nil, nil, {
		255,
		255,
		255,
		255,
	}, nil, false, {
		88,
		68,
	}),
}

local function create_widget_priming()
	return {
		scenegraph_id = "crosshair_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					content_check_function = function (content)
						return content.progress > 0
					end,
				},
				{
					content_id = "progress_1",
					pass_type = "texture_uv",
					style_id = "progress_1",
					content_check_function = function (content)
						return content.parent.progress > 0
					end,
					content_change_function = function (content, style)
						content.uvs = {
							{
								0,
								1 - content.parent.progress,
							},
							{
								1,
								1,
							},
						}
						style.texture_size[2] = 84 * content.parent.progress
					end,
				},
				{
					content_id = "progress_2",
					pass_type = "texture_uv",
					style_id = "progress_2",
					content_check_function = function (content)
						return content.parent.progress > 0
					end,
					content_change_function = function (content, style)
						content.uvs = {
							{
								0,
								1 - content.parent.progress,
							},
							{
								1,
								1,
							},
						}
						style.texture_size[2] = 84 * content.parent.progress
					end,
				},
				{
					content_id = "progress_3",
					pass_type = "texture_uv",
					style_id = "progress_3",
					content_check_function = function (content)
						return content.parent.progress > 0
					end,
					content_change_function = function (content, style)
						content.uvs = {
							{
								0,
								1 - content.parent.progress,
							},
							{
								1,
								1,
							},
						}
						style.texture_size[2] = 84 * content.parent.progress
					end,
				},
			},
		},
		content = {
			background = "pounce_background",
			progress = 0,
			progress_1 = {
				texture_id = "pounce_01",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			progress_2 = {
				texture_id = "pounce_02",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			progress_3 = {
				texture_id = "pounce_03",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
		},
		style = {
			background = {
				texture_size = {
					108,
					100,
				},
				offset = {
					-54,
					-110,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			progress_1 = {
				texture_size = {
					108,
					84,
				},
				offset = {
					-54,
					-110,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			progress_2 = {
				texture_size = {
					108,
					84,
				},
				offset = {
					-54,
					-110,
					3,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			progress_3 = {
				texture_size = {
					108,
					84,
				},
				offset = {
					-54,
					-110,
					4,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_widget_recharge()
	return {
		scenegraph_id = "crosshair_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "cooldown_mask",
					texture_id = "cooldown_mask",
				},
				{
					content_id = "cooldown",
					pass_type = "texture_uv",
					style_id = "cooldown",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.progress > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "ring",
					texture_id = "ring",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.progress > 0
					end,
				},
			},
		},
		content = {
			background = "versus_crosshair_crosshair_bg",
			cooldown_mask = "hud_ability_cooldown_mask",
			progress = 0,
			ring = "versus_crosshair_crosshair_ring",
			cooldown = {
				texture_id = "versus_crosshair_crosshair_fill",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			ring = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					80,
					80,
				},
				offset = {
					0,
					0,
					2,
				},
				color = Colors.get_color_table_with_alpha("black", 0),
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					80,
					80,
				},
				offset = {
					0,
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 0),
			},
			cooldown = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "center",
				default_size = {
					80,
					80,
				},
				texture_size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("pactsworn_green", 0),
				offset = {
					0,
					0,
					1,
				},
			},
			cooldown_mask = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				default_size = {
					80,
					80,
				},
				texture_size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					0,
					0,
					3,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_widget_reload()
	return {
		scenegraph_id = "crosshair_root",
		element = {
			passes = {
				{
					content_id = "cooldown",
					pass_type = "texture_uv",
					style_id = "cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					retained_mode = RETAINED_MODE_ENABLED,
				},
			},
		},
		content = {
			background = "circular_bar_background",
			on_cooldown = false,
			progress = 0,
			text = "",
			cooldown = {
				texture_id = "circular_bar_fill",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					250,
					70,
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			cooldown = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				default_size = {
					250,
					70,
				},
				texture_size = {
					250,
					70,
				},
				color = Colors.get_color_table_with_alpha("pactsworn_green", 255),
				offset = {
					-125,
					0,
					1,
				},
			},
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					255,
					255,
					255,
				},
				size = {
					500,
					30,
				},
				offset = {
					-250,
					16,
					1,
				},
			},
			text_shadow = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					0,
					0,
					0,
				},
				size = {
					500,
					30,
				},
				offset = {
					-249,
					15,
					0,
				},
			},
		},
		offset = {
			0,
			-140,
			0,
		},
	}
end

local function create_widget_ammo()
	return {
		scenegraph_id = "bottom_root",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "rect",
					style_id = "progress",
					retained_mode = RETAINED_MODE_ENABLED,
				},
			},
		},
		content = {
			progress = 0,
		},
		style = {
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					501,
					20,
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					0,
					0,
					0,
				},
			},
			progress = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				default_size = {
					496,
					16,
				},
				texture_size = {
					496,
					16,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-248,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			80,
			0,
		},
	}
end

local function create_dark_pact_ability_widget()
	return {
		scenegraph_id = "horde_ability_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "ability_progress",
					texture_id = "ability_progress",
				},
				{
					pass_type = "texture",
					style_id = "ability_effect",
					texture_id = "ability_effect",
					content_check_function = function (content)
						return content.ready
					end,
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top",
					texture_id = "ability_effect_top",
					content_check_function = function (content)
						return content.ready
					end,
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_halo",
					texture_id = "ability_effect_halo",
					content_check_function = function (content)
						return content.ready
					end,
				},
				{
					pass_type = "text",
					style_id = "input_text",
					text_id = "input_text",
				},
				{
					pass_type = "texture",
					style_id = "input_background",
					texture_id = "input_background",
				},
			},
		},
		content = {
			ability_effect = "dark_pact_ability_effect",
			ability_effect_halo = "dark_pact_ability_effect_halo",
			ability_effect_top = "dark_pact_ability_effect_top",
			ability_progress = "dark_pact_ability_progress_bar",
			background = "horde_bar_background",
			input_background = "info_window_background",
			input_text = "-",
			ready = false,
		},
		style = {
			background = {
				size = {
					356,
					160,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			ability_progress = {
				gradient_threshold = 0,
				size = {
					262,
					16,
				},
				offset = {
					10,
					72,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			ability_effect = {
				size = {
					152,
					180,
				},
				offset = {
					223,
					-15,
					3,
				},
				color = Colors.get_color_table_with_alpha("pactsworn_red", 255),
			},
			ability_effect_top = {
				size = {
					152,
					180,
				},
				offset = {
					223,
					-15,
					4,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			ability_effect_halo = {
				size = {
					356,
					160,
				},
				offset = {
					0,
					0,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			input_text = {
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				use_shadow = false,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					30,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					284,
					162,
					2,
				},
			},
			input_background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					110,
					30,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					301,
					180,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			10,
		},
	}
end

local function create_ammo_widget()
	return {
		scenegraph_id = "ammo_parent",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "ammo_background",
					texture_id = "ammo_background",
				},
				{
					pass_type = "text",
					style_id = "current_ammo",
					text_id = "current_ammo",
				},
				{
					pass_type = "text",
					style_id = "ammo_divider",
					text_id = "ammo_divider",
				},
				{
					pass_type = "text",
					style_id = "remaining_ammo",
					text_id = "remaining_ammo",
				},
			},
		},
		content = {
			ammo_background = "loot_objective_bg",
			ammo_divider = "/",
			current_ammo = "-",
			remaining_ammo = "-",
		},
		style = {
			ammo_background = {
				color = {
					200,
					255,
					255,
					255,
				},
			},
			current_ammo = {
				font_size = 72,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				localize = false,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = false,
				size = {
					20,
					20,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					161.5,
					-8,
					10,
				},
			},
			ammo_divider = {
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					10,
				},
			},
			remaining_ammo = {
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = false,
				size = {
					20,
					20,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					204.5,
					0,
					10,
				},
			},
		},
		offset = {
			0,
			0,
			1,
		},
	}
end

local pre_defined_widgets = {
	packmaster_reload = {
		definition = create_widget_reload(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local ability = career_extension:ability_by_id(ability_id)
			local conditions_met = ability:ability_available()
			local startup_delay_time = ability:startup_delay_time()
			local progress
			local draw = false

			if conditions_met then
				progress = ability:startup_delay_fraction()
				draw = progress ~= nil
			end

			local content = widget.content
			local style = widget.style

			content.visible = draw

			if progress then
				local default_size = style.cooldown.default_size
				local texture_size = style.cooldown.texture_size
				local uvs = content.cooldown.uvs

				uvs[2][1] = progress
				texture_size[1] = default_size[1] * progress
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	ratling_gunner_reload = {
		definition = create_widget_reload(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit)
			if is_player_dead then
				return
			end

			local content = widget.content
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local weapon_unit = inventory_extension:get_weapon_unit()
			local weapon_unit_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
			local reload_progress = weapon_unit_extension:get_custom_data("reload_progress")

			content.visible = reload_progress > 0

			if not content.visible then
				return
			end

			local style = widget.style

			reload_progress = 1 - reload_progress

			if reload_progress then
				local default_size = style.cooldown.default_size
				local texture_size = style.cooldown.texture_size

				reload_progress = math.remap(0, 1, 0.05, 0.95, reload_progress)

				local uvs = content.cooldown.uvs

				uvs[2][1] = reload_progress
				texture_size[1] = default_size[1] * reload_progress
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	reload = {
		definition = create_widget_reload(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			if is_player_dead then
				return
			end

			local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local num_extra_current, num_extra_total = career_extension:get_extra_ability_uses()
			local num_total_stacks = 1 + num_extra_total
			local num_current_stacks = num_extra_current

			if ability_cooldown <= 0 then
				num_current_stacks = num_current_stacks + 1

				if num_extra_total > 0 then
					ability_cooldown, full_cooldown = career_extension:get_extra_ability_charge()
					ability_cooldown = full_cooldown - ability_cooldown
				end
			end

			local display_on_cooldown = false
			local content = widget.content
			local style = widget.style
			local stored_ability_cooldown = content.ability_cooldown or 0
			local cooldown_fraction = 0

			if uses_cooldown then
				if ability_cooldown < stored_ability_cooldown then
					display_on_cooldown = true
					cooldown_fraction = ability_cooldown / stored_ability_cooldown
				else
					content.ability_cooldown = ability_cooldown
				end

				if not ability_cooldown or ability_cooldown <= 0 then
					content.ability_cooldown = 0
				end
			end

			local default_size = style.cooldown.default_size
			local texture_size = style.cooldown.texture_size
			local uvs = content.cooldown.uvs

			uvs[2][1] = cooldown_fraction
			texture_size[1] = default_size[1] * cooldown_fraction
			content.visible = display_on_cooldown

			if num_total_stacks > 1 then
				local orig_text = content.orig_text

				if not orig_text then
					content.orig_text = content.text
				end

				content.text = string.format("%s (%d/%d)", orig_text, num_current_stacks, num_total_stacks)
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	priming = {
		definition = create_widget_priming(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			if is_player_dead then
				return
			end

			local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_data = career_extension:get_activated_ability_data(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local priming_progress = ability_data.priming_progress or 0
			local content = widget.content
			local style = widget.style
			local stored_ability_cooldown = content.ability_cooldown or 0

			content.progress = priming_progress

			if uses_cooldown and stored_ability_cooldown <= ability_cooldown then
				content.ability_cooldown = ability_cooldown
			end

			if not ability_cooldown or ability_cooldown <= 0 then
				content.ability_cooldown = 0
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	recharge = {
		definition = create_widget_recharge(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			if is_player_dead then
				return
			end

			local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_available = career_extension:can_use_activated_ability(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local cooldown_fraction = 0

			if uses_cooldown then
				cooldown_fraction = ability_cooldown / full_cooldown
			else
				cooldown_fraction = ability_available and 0 or 1
			end

			local content = widget.content
			local dirty = cooldown_fraction ~= content.current_cooldown_fraction
			local on_cooldown = cooldown_fraction ~= 0

			widget.style.cooldown_mask.color[1] = 255 * cooldown_fraction
			content.on_cooldown = on_cooldown
			content.progress = cooldown_fraction

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	throw_charge = {
		definition = create_widget_recharge(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			if is_player_dead then
				return
			end

			local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_data = career_extension:get_activated_ability_data(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local priming_progress = ability_data.priming_progress or 0
			local content = widget.content
			local style = widget.style
			local current_priming_progress = content.progress or 0
			local visible = current_priming_progress < priming_progress

			style.cooldown_mask.color[1] = visible and 255 * priming_progress or 0

			local stored_ability_cooldown = content.ability_cooldown or 0

			content.visible = priming_progress > 0 and priming_progress < 1
			content.progress = priming_progress

			if uses_cooldown and stored_ability_cooldown <= ability_cooldown then
				content.ability_cooldown = ability_cooldown
			end

			if not ability_cooldown or ability_cooldown <= 0 then
				content.ability_cooldown = 0
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	ammo = {
		definition = create_ammo_widget(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	duration = {
		definition = create_widget_ammo(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			local ability_data = career_extension:get_activated_ability_data(ability_id)
			local duration_progress = ability_data.duration_progress or 0
			local buff_name = "vs_gutter_runner_smoke_bomb_invisible"
			local player = Managers.player:local_player(1)
			local player_unit = player.player_unit

			if not Unit.alive(player_unit) then
				return
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_name)

			if not buff then
				return
			end

			local duration = buff.duration
			local start_time = buff.start_time
			local game_time = Managers.time:time("game")
			local end_time = duration and start_time + duration or 0
			local remaining_duration = end_time and math.max(end_time - game_time, 0)
			local style = widget.style
			local default_size = style.progress.default_size
			local texture_size = style.progress.texture_size
			local progress = remaining_duration / duration

			texture_size[1] = default_size[1] * progress

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
	ability = {
		definition = create_dark_pact_ability_widget(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit, horde_ability_extension)
			if is_player_dead then
				return
			end

			local cooldown = horde_ability_extension:cooldown()
			local game_time = Managers.time:time("game")
			local ability_charge = horde_ability_extension:get_ability_charge(game_time)
			local ability_cooldown = math.clamp(cooldown - ability_charge, 0, cooldown)
			local content = widget.content
			local cooldown_fraction = ability_cooldown == 0 and 0 or ability_cooldown / cooldown

			cooldown_fraction = 1 - cooldown_fraction

			local material_name = widget.content.ability_progress
			local material = Gui.material(ui_renderer.gui, material_name)

			Material.set_scalar(material, "gradient_threshold", cooldown_fraction)

			content.ready = cooldown_fraction == 1
			content.actual_cooldown = cooldown_fraction

			local gamepad_active = Managers.input:is_device_active("gamepad")

			if gamepad_active ~= content.is_gamepad_active then
				local input_action = "versus_horde_ability"
				local input_manager = Managers.input

				if gamepad_active then
					input_action = "versus_horde_ability"
					content.input_text = "$KEY;Player__" .. input_action .. ":"
				else
					local input_service = input_manager:get_service("Player")
					local _, input_text = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)

					content.input_text = "[" .. input_text .. "]"
				end
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end,
	},
}

local function create_dark_pact_hud_ability_icon_widget()
	return {
		scenegraph_id = "ability_pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon_bg",
					texture_id = "texture_icon",
					content_change_function = function (content, style, _, dt)
						if content.texture_icon == "icons_placeholder" and content.settings then
							content.texture_icon = content.settings.icon
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					content_check_function = function (content)
						return content.is_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_mask",
					texture_id = "icon_mask",
					content_change_function = function (content, style, _, dt)
						style.color[1] = 255 * (1 - content.progress)
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_frame",
					texture_id = "texture_frame",
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_cooldown",
					texture_id = "texture_cooldown",
					content_check_function = function (content)
						return content.is_cooldown
					end,
					content_change_function = function (content, style, _, dt)
						style.color[1] = 255 * (1 - content.progress)
					end,
				},
				{
					pass_type = "text",
					style_id = "input",
					text_id = "input",
					content_change_function = function (content, style, _, dt)
						if not content.settings then
							return
						end

						local gamepad_active = Managers.input:is_device_active("gamepad")

						if content.gamepad_active ~= gamepad_active then
							content.gamepad_active = gamepad_active

							local input = gamepad_active and content.settings.gamepad_input or content.settings.input_action
							local input_service = Managers.input:get_service("Player")
							local _, input_text, keymap_binding = UISettings.get_gamepad_input_texture_data(input_service, input, gamepad_active)

							if keymap_binding and keymap_binding[1] == "mouse" or gamepad_active then
								content.input = string.format("$KEY;Player__%s:", input)
								style.offset[1] = 68
							else
								content.input = input_text
								style.offset[1] = 40
							end
						end

						local subtitle_gui = Managers.ui:get_hud_component("SubtitleGui")

						if subtitle_gui then
							local has_subtitles = subtitle_gui:is_displaying_subtitle()

							content.has_subtitles = has_subtitles

							local fade_progress = content.fade_progress or 0

							if has_subtitles then
								fade_progress = math.max(fade_progress - dt * 5, 0)
							else
								fade_progress = math.min(fade_progress + dt * 5, 1)
							end

							style.text_color[1] = 55 + 200 * fade_progress
							content.fade_progress = fade_progress
						end
					end,
				},
			},
		},
		content = {
			gris = "rect_masked",
			icon_mask = "dark_pact_ability_icon_gradient_mask",
			input = "n/a",
			is_cooldown = false,
			progress = 0,
			set_unsaturated = false,
			texture_cooldown = "dark_pact_ability_icon_cooldown_gradient",
			texture_frame = "health_bar_ability_icon_frame",
			texture_icon = "icons_placeholder",
		},
		style = {
			texture_icon_bg = {
				saturated = false,
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					1,
				},
			},
			texture_icon = {
				masked = true,
				saturated = false,
				size = {
					56,
					56,
				},
				color = {
					255,
					30,
					30,
					30,
				},
				offset = {
					12,
					14,
					2,
				},
			},
			icon_mask = {
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					2,
				},
			},
			texture_cooldown = {
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					3,
				},
			},
			texture_frame = {
				size = {
					80,
					80,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			input = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					0,
					0,
				},
				area_size = {
					20,
					20,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					68,
					100,
					6,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function ratling_gunner_reload_icon_update(dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit, horde_ability_extension)
	if is_player_dead then
		return
	end

	local content = widget.content
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local weapon_unit = inventory_extension:get_weapon_unit()
	local weapon_unit_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	local reload_progress = weapon_unit_extension:get_custom_data("reload_progress")
	local on_cooldown = reload_progress > 0

	content.is_cooldown = on_cooldown
	content.progress = reload_progress

	UIRenderer.draw_widget(ui_renderer, widget)
end

local function chaos_troll_cooldown_update(dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit, horde_ability_extension)
	if is_player_dead then
		return
	end

	local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
	local ability_data = career_extension:get_activated_ability_data(ability_id)
	local uses_cooldown = career_extension:uses_cooldown(ability_id)
	local content = widget.content
	local style = widget.style
	local on_cooldown = ability_cooldown ~= 0

	content.is_cooldown = on_cooldown

	if on_cooldown then
		content.progress = 1 - math.clamp(ability_cooldown / full_cooldown, 0, content.current_progress or 1)
	end

	UIRenderer.draw_widget(ui_renderer, widget)
end

local function gutter_runner_foff_duration_update(dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit, horde_ability_extension)
	if is_player_dead then
		return
	end

	local ability_data = career_extension:get_activated_ability_data(ability_id)
	local duration_progress = ability_data.duration_progress or 0
	local can_use_ability = career_extension:can_use_activated_ability(ability_id)
	local content = widget.content
	local progress = 0
	local on_cooldown = false

	if not can_use_ability then
		on_cooldown = true
		progress = 0
		widget.style.texture_icon.color = {
			255,
			100,
			100,
			100,
		}
	end

	local buff_name = "vs_gutter_runner_smoke_bomb_invisible"
	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
	local buff = buff_extension:get_non_stacking_buff(buff_name)

	if buff then
		local duration = buff.duration
		local start_time = buff.start_time
		local game_time = Managers.time:time("game")
		local end_time = duration and start_time + duration or 0
		local remaining_duration = end_time and math.max(end_time - game_time, 0)
		local progress = remaining_duration / duration

		on_cooldown = progress ~= 1
	end

	content.is_cooldown = on_cooldown
	content.progress = progress

	UIRenderer.draw_widget(ui_renderer, widget)
end

local function poison_wind_globadier_reload_update(dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead, player_unit, horde_ability_extension)
	if is_player_dead then
		return
	end

	local ability_cooldown, full_cooldown = career_extension:current_ability_cooldown(ability_id)
	local uses_cooldown = career_extension:uses_cooldown(ability_id)
	local num_extra_current, num_extra_total = career_extension:get_extra_ability_uses()
	local num_total_stacks = 1 + num_extra_total
	local num_current_stacks = num_extra_current

	if ability_cooldown <= 0 then
		num_current_stacks = num_current_stacks + 1

		if num_extra_total > 0 then
			ability_cooldown, full_cooldown = career_extension:get_extra_ability_charge()
			ability_cooldown = full_cooldown - ability_cooldown
		end
	end

	local display_on_cooldown = false
	local content = widget.content
	local style = widget.style
	local stored_ability_cooldown = content.ability_cooldown or 0
	local cooldown_fraction = 0

	if uses_cooldown then
		if ability_cooldown < stored_ability_cooldown then
			display_on_cooldown = true
			cooldown_fraction = ability_cooldown / stored_ability_cooldown
		else
			content.ability_cooldown = ability_cooldown
		end

		if not ability_cooldown or ability_cooldown <= 0 then
			content.ability_cooldown = 0
		end
	end

	content.is_cooldown = display_on_cooldown
	content.progress = 1 - cooldown_fraction

	UIRenderer.draw_widget(ui_renderer, widget)
end

local profile_ability_templates = {
	vs_chaos_troll = {
		{
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
			},
		},
		{
			ability_name = "vomit",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
			},
			update_functions = {
				ability_icon = chaos_troll_cooldown_update,
			},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability = pre_defined_widgets.ability.update_function,
			},
		},
	},
	vs_gutter_runner = {
		{
			ability_name = "pounce",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
				priming = pre_defined_widgets.priming.definition,
			},
			update_functions = {
				priming = pre_defined_widgets.priming.update_function,
			},
		},
		{
			ability_name = "foff",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
			},
			update_functions = {
				ability_icon = gutter_runner_foff_duration_update,
			},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability = pre_defined_widgets.ability.update_function,
			},
		},
	},
	vs_ratling_gunner = {
		{
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
			},
		},
		{
			ability_name = "fire",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
				reload = pre_defined_widgets.ratling_gunner_reload.definition,
				ammo = pre_defined_widgets.ammo.definition,
			},
			update_functions = {
				ability_icon = ratling_gunner_reload_icon_update,
				reload = pre_defined_widgets.ratling_gunner_reload.update_function,
				ammo = pre_defined_widgets.ammo.update_function,
			},
			events = {
				on_dark_pact_ammo_changed = "event_on_dark_pact_ammo_changed",
			},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability = pre_defined_widgets.ability.update_function,
			},
		},
	},
	vs_warpfire_thrower = {
		{
			ability_name = "fire",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
			},
			update_functions = {},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability = pre_defined_widgets.ability.update_function,
			},
		},
	},
	vs_poison_wind_globadier = {
		{
			ability_name = "gas",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
				throw_charge = pre_defined_widgets.throw_charge.definition,
			},
			update_functions = {
				ability_icon = poison_wind_globadier_reload_update,
				throw_charge = pre_defined_widgets.throw_charge.update_function,
			},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability = pre_defined_widgets.ability.update_function,
			},
		},
	},
	vs_packmaster = {
		{
			ability_name = "equip",
			widget_definitions = {
				ability_icon = create_dark_pact_hud_ability_icon_widget(),
				reload = pre_defined_widgets.packmaster_reload.definition,
			},
			update_functions = {
				reload = pre_defined_widgets.packmaster_reload.update_function,
			},
		},
		{
			ability_name = "horde_ability",
			widget_definitions = {
				ability_charge = pre_defined_widgets.ability.definition,
			},
			update_functions = {
				ability_charge = pre_defined_widgets.ability.update_function,
			},
		},
	},
}

return {
	profile_ability_templates = profile_ability_templates,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
