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
			-100,
			100,
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
}
local widget_definitions = {}

local function create_ability_widget()
	return {
		scenegraph_id = "ability_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon_cooldown",
					texture_id = "icon_cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "top_edge",
					texture_id = "top_edge",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "top_edge_on_cooldown",
					texture_id = "top_edge",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "border",
					texture_id = "border",
				},
				{
					pass_type = "texture",
					style_id = "cooldown_mask",
					texture_id = "cooldown_mask",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return true
					end,
				},
				{
					content_id = "cooldown",
					pass_type = "texture_uv",
					style_id = "cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "background_effect",
					texture_id = "background_effect",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
				{
					pass_type = "text",
					style_id = "input_text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
				{
					pass_type = "text",
					style_id = "input_text_shadow",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "input_background",
					texture_id = "input_background",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end,
				},
			},
		},
		content = {
			background = "pvp_ability_background",
			background_effect = "hud_ability_bg",
			border = "pvp_ability_border",
			cooldown_mask = "hud_ability_cooldown_mask",
			icon = "radial_chat_icon_difficulty_up_glow",
			icon_cooldown = "radial_chat_icon_difficulty_up",
			input_background = "info_window_background",
			input_text = "",
			on_cooldown = true,
			top_edge = "pvp_ability_top",
			cooldown = {
				texture_id = "pvp_ability_background",
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
					138,
					138,
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					150,
					0,
					0,
					0,
				},
			},
			background_effect = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					138,
					138,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					100,
					100,
				},
				color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			icon_cooldown = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					100,
					100,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					0,
					0,
					8,
				},
			},
			icon_disabled = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					100,
					100,
				},
				color = {
					200,
					120,
					120,
					120,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			cooldown = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "bottom",
				default_size = {
					138,
					138,
				},
				texture_size = {
					138,
					138,
				},
				color = {
					150,
					120,
					120,
					120,
				},
				offset = {
					0,
					-69,
					3,
				},
			},
			cooldown_mask = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				default_size = {
					138,
					138,
				},
				texture_size = {
					138,
					138,
				},
				color = {
					50,
					255,
					255,
					255,
				},
				offset = {
					0,
					-69,
					3,
				},
			},
			border = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					138,
					138,
				},
				offset = {
					0,
					0,
					4,
				},
				color = {
					255,
					0,
					0,
					0,
				},
			},
			top_edge = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					138,
					138,
				},
				color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					5,
				},
			},
			top_edge_on_cooldown = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					138,
					138,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					5,
				},
			},
			input_background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					110,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					100,
					0,
				},
			},
			input_text = {
				font_size = 40,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					70,
					2,
				},
			},
			input_text_shadow = {
				font_size = 40,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					0,
					68,
					1,
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

local function create_widget_priming()
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
						local progress = content.progress

						return progress > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "ring",
					texture_id = "ring",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local draw_ring = content.draw_ring

						return not draw_ring
					end,
				},
			},
		},
		content = {
			background = "versus_crosshair_crosshair_bg",
			cooldown_mask = "hud_ability_cooldown_mask",
			draw_ring = false,
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
				color = {
					255,
					255,
					255,
					255,
				},
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
				color = {
					255,
					255,
					255,
					255,
				},
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
				color = Colors.get_color_table_with_alpha("orange", 255),
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
				color = {
					0,
					255,
					255,
					255,
				},
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
				color = {
					255,
					255,
					255,
					255,
				},
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
				color = {
					255,
					255,
					255,
					255,
				},
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
				color = Colors.get_color_table_with_alpha("orange", 255),
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
				color = {
					0,
					255,
					255,
					255,
				},
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
			background = "versus_reload_progress_bg",
			on_cooldown = false,
			progress = 0,
			text = "Reloading",
			cooldown = {
				texture_id = "versus_reload_progress_fill",
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
					118,
					26,
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
					118,
					26,
				},
				texture_size = {
					118,
					26,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-59,
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
					10,
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
					9,
					0,
				},
			},
		},
		offset = {
			0,
			-350,
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

local pre_defined_widgets = {
	packmaster_reload = {
		definition = create_widget_reload(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
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
	reload = {
		definition = create_widget_reload(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			if is_player_dead then
				return
			end

			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local num_extra_current, num_extra_total = career_extension:get_extra_ability_uses()
			local num_total_stacks = 1 + num_extra_total
			local num_current_stacks = num_extra_current

			if ability_cooldown <= 0 then
				num_current_stacks = num_current_stacks + 1

				if num_extra_total > 0 then
					ability_cooldown, max_cooldown = career_extension:get_extra_ability_charge()
					ability_cooldown = max_cooldown - ability_cooldown
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

			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_data = career_extension:get_activated_ability_data(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local priming_progress = ability_data.priming_progress or 0
			local content = widget.content
			local style = widget.style

			style.cooldown_mask.color[1] = 255 * priming_progress or 0

			local stored_ability_cooldown = content.ability_cooldown or 0
			local on_cooldown = ability_cooldown < stored_ability_cooldown

			content.draw_ring = on_cooldown
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

			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_available = career_extension:can_use_activated_ability(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local cooldown_fraction = 0

			if uses_cooldown then
				cooldown_fraction = ability_cooldown / max_cooldown
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

			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
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
		definition = create_widget_ammo(),
		update_function = function (dt, t, ui_renderer, career_extension, ability_id, widget, is_player_dead)
			local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
			local ability_available = career_extension:can_use_activated_ability(ability_id)
			local uses_cooldown = career_extension:uses_cooldown(ability_id)
			local content = widget.content
			local style = widget.style
			local default_size = style.progress.default_size
			local texture_size = style.progress.texture_size
			local cooldown_fraction = 0

			if uses_cooldown then
				cooldown_fraction = ability_cooldown / max_cooldown
			else
				cooldown_fraction = ability_available and 0 or 1
			end

			local progress = 1 - cooldown_fraction
			local previous_progress = content.progress or 0

			content.progress = progress

			if progress <= previous_progress then
				texture_size[1] = default_size[1] * progress
			end

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
}
local profile_ability_templates = {
	vs_gutter_runner = {
		pounce = {
			widget_definitions = {
				priming = pre_defined_widgets.priming.definition,
			},
			update_functions = {
				priming = pre_defined_widgets.priming.update_function,
			},
		},
		foff = {
			widget_definitions = {
				duration = pre_defined_widgets.duration.definition,
			},
			update_functions = {
				duration = pre_defined_widgets.duration.update_function,
			},
		},
	},
	vs_ratling_gunner = {
		fire = {
			widget_definitions = {
				priming = pre_defined_widgets.priming.definition,
				reload = pre_defined_widgets.reload.definition,
				ammo = pre_defined_widgets.ammo.definition,
			},
			update_functions = {
				priming = pre_defined_widgets.priming.update_function,
				reload = pre_defined_widgets.reload.update_function,
				ammo = pre_defined_widgets.ammo.update_function,
			},
		},
	},
	vs_warpfire_thrower = {
		fire = {
			widget_definitions = {
				priming = pre_defined_widgets.priming.definition,
				reload = pre_defined_widgets.reload.definition,
				ammo = pre_defined_widgets.ammo.definition,
			},
			update_functions = {
				priming = pre_defined_widgets.priming.update_function,
				reload = pre_defined_widgets.reload.update_function,
				ammo = pre_defined_widgets.ammo.update_function,
			},
		},
	},
	vs_poison_wind_globadier = {
		gas = {
			widget_definitions = {
				throw_charge = pre_defined_widgets.throw_charge.definition,
				reload = pre_defined_widgets.reload.definition,
			},
			update_functions = {
				reload = pre_defined_widgets.reload.update_function,
				throw_charge = pre_defined_widgets.throw_charge.update_function,
			},
		},
	},
	vs_packmaster = {
		equip = {
			widget_definitions = {
				reload = pre_defined_widgets.packmaster_reload.definition,
			},
			update_functions = {
				reload = pre_defined_widgets.packmaster_reload.update_function,
			},
		},
	},
}

return {
	profile_ability_templates = profile_ability_templates,
	create_ability_widget = create_ability_widget,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
