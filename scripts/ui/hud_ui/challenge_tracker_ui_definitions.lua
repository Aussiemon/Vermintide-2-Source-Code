local SIZE_X = 1920
local SIZE_Y = 1080
local QUEST_SIZE = {
	200,
	75
}
local QUEST_PADDING = 20
local scenegraph_definition = {
	screen = {
		scale = "hud_scale_fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			0,
			155,
			0
		},
		size = {
			0,
			0
		}
	},
	quest = {
		vertical_alignment = "top",
		parent = "pivot",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			0
		},
		size = QUEST_SIZE
	}
}
local corner = UIAtlasHelper.get_atlas_settings_by_texture_name("objective_detail")
local lily = UIAtlasHelper.get_atlas_settings_by_texture_name("lily")
local CHALLENGE_WIDGET_TEMPLATE = {
	scenegraph_id = "quest",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background_rect"
			},
			{
				pass_type = "texture",
				style_id = "background_lilies",
				texture_id = "background_id"
			},
			{
				pass_type = "texture",
				style_id = "corner_top_right",
				texture_id = "corner_id"
			},
			{
				pass_type = "texture",
				style_id = "corner_bot_right",
				texture_id = "corner_id"
			},
			{
				pass_type = "texture",
				style_id = "lily",
				texture_id = "lily_id"
			},
			{
				style_id = "challenge_name",
				pass_type = "text",
				text_id = "challenge_name"
			},
			{
				style_id = "challenge_name_shadow",
				pass_type = "text",
				text_id = "challenge_name"
			},
			{
				style_id = "reward_name",
				pass_type = "text",
				text_id = "reward_name"
			},
			{
				style_id = "reward_name_shadow",
				pass_type = "text",
				text_id = "reward_name"
			}
		}
	},
	content = {
		alpha_multiplier = 1,
		progress_bg_id = "challenge_ui_progress_arc_bg",
		progress = 0,
		challenge_name = "NO CHALLENGE NAME",
		is_done = false,
		background_id = "challenge_ui_questingknight_bg",
		last_milestone = 0,
		reward_name = "NO REWARD NAME",
		progress_id = "challenge_ui_progress_arc",
		max_progress = 0,
		last_progress = 0,
		lily_id = lily.texture_name,
		corner_id = corner.texture_name
	},
	style = {
		background_rect = {
			color = {
				140,
				32,
				32,
				32
			}
		},
		background_lilies = {
			color = {
				200,
				255,
				255,
				255
			}
		},
		corner_top_right = {
			vertical_alignment = "top",
			horizontal_alignment = "right",
			offset = {
				0,
				0.5 * corner.size[2],
				1
			},
			texture_size = corner.size,
			color = {
				255,
				255,
				255,
				255
			}
		},
		corner_bot_right = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			offset = {
				0,
				-0.5 * corner.size[2],
				1
			},
			texture_size = corner.size,
			color = {
				255,
				255,
				255,
				255
			}
		},
		lily = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			offset = {
				-0.5 * lily.size[1] + 3,
				0,
				5
			},
			texture_size = lily.size,
			color = {
				255,
				255,
				255,
				255
			}
		},
		progress = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			color = {
				255,
				255,
				200,
				75
			},
			offset = {
				-20,
				0,
				1
			},
			texture_size = {
				56,
				56
			}
		},
		progress_bg = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				-20,
				0,
				0
			},
			texture_size = {
				56,
				56
			}
		},
		challenge_name = {
			word_wrap = false,
			upper_case = false,
			localize = false,
			font_size = 22,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				20,
				-11,
				1
			}
		},
		challenge_name_shadow = {
			word_wrap = false,
			upper_case = false,
			localize = false,
			font_size = 22,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark_header",
			text_color = {
				255,
				0,
				0,
				0
			},
			offset = {
				22,
				-13,
				0
			}
		},
		reward_name = {
			word_wrap = false,
			upper_case = false,
			localize = false,
			font_size = 20,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				20,
				-36,
				1
			}
		},
		reward_name_shadow = {
			word_wrap = false,
			upper_case = false,
			localize = false,
			font_size = 20,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark_header",
			text_color = {
				255,
				0,
				0,
				0
			},
			offset = {
				22,
				-38,
				0
			}
		},
		reward_icon = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			texture_size = {
				61.599999999999994,
				64.39999999999999
			},
			color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				-16,
				0,
				50
			}
		}
	}
}

local function get_widget_position(offset, index)
	return {
		offset[1],
		offset[2] - (QUEST_SIZE[2] + QUEST_PADDING) * (index - 1),
		offset[3]
	}
end

local function create_objective(challenge, gui, offset, index)
	local widget = UIWidget.init(CHALLENGE_WIDGET_TEMPLATE)
	widget.offset = get_widget_position(offset, index)
	local content = widget.content
	content.challenge = challenge
	content.challenge_name = Localize(challenge:get_challenge_name())
	local reward = challenge:get_reward()
	local reward_name = challenge:get_reward_name()
	content.reward_name = UIUtils.format_localized_description(reward_name, reward.description_values)

	table.dump(reward.description_values, reward_name)

	content.reward_icon = reward.icon
	local p, mp = challenge:get_progress()
	content.progress = p
	content.last_progress = p
	content.max_progress = mp
	content.start_anim_progress = p / mp
	content.last_milestone = math.floor(content.start_anim_progress * 4)
	local template_id = content.progress_id
	local clone_id = content.progress_id .. math.uuid()

	Gui.clone_material_from_template(gui, clone_id, template_id)

	content.progress_id = clone_id

	return widget
end

local function NOP()
	return
end

local animation_definitions = {
	on_enter = {
		{
			name = "ease_in",
			delay = 0.5,
			duration = 1,
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				local x = widget.offset
				params.src = {
					x[1] + 1.5 * QUEST_SIZE[2],
					x[2]
				}
				params.dst = {
					x[1],
					x[2]
				}
				widget.content.alpha_multiplier = 0
				widget.offset[1] = params.src[1]
				widget.offset[2] = params.src[2]
				local content = widget.content
				local material = Gui.material(params.ui_renderer.gui, widget.content.progress_id)

				Material.set_scalar(material, "angle", (content.start_anim_progress - 0.5) * math.pi * 2)
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				local t = math.easeOutCubic(progress)
				widget.content.alpha_multiplier = t
				widget.offset[1] = math.floor(math.lerp(params.src[1], params.dst[1], t))
				widget.offset[2] = math.floor(math.lerp(params.src[2], params.dst[2], t))
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				params.view:_play_sound("Play_hud_grail_knight_quest_start")
			end
		}
	},
	on_progress = {
		{
			name = "update circle",
			duration = 0.2,
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				local content = widget.content
				content.start_anim_progress = content.start_anim_progress or 0
				content.end_anim_progress = content.progress / content.max_progress
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				local content = widget.content
				local material = Gui.material(params.ui_renderer.gui, widget.content.progress_id)
				local start_anim_progress = content.start_anim_progress
				local end_anim_progress = content.end_anim_progress
				local anim_progress = math.lerp(start_anim_progress, end_anim_progress, progress)

				Material.set_scalar(material, "angle", (anim_progress - 0.5) * math.pi * 2)

				local next_milestone_p = (content.last_milestone + 1) / 4

				if end_anim_progress > next_milestone_p and end_anim_progress < 1 then
					params.view:_play_sound("Play_hud_grail_knight_quest_milestone_finish")

					content.last_milestone = math.floor(end_anim_progress * 4)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local content = widget.content
				content.start_anim_progress = content.end_anim_progress
			end
		}
	},
	on_done = {
		{
			name = "fade and play sound",
			delay = 0.5,
			duration = 1,
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				params.view:_play_sound("Play_hud_grail_knight_quest_finish")
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				widget.content.alpha_multiplier = 1 - progress
			end,
			on_complete = NOP
		},
		{
			name = "play sound",
			delay = 2.2,
			duration = 0.1,
			init = NOP,
			update = NOP,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local challenge = widget.content.challenge
				local sound_event = challenge:get_reward().sound

				if sound_event then
					params.view:_play_sound(sound_event)
				end

				params.view:_cb_on_done(widget, challenge)
			end
		}
	},
	on_cancel = {
		{
			name = "fade",
			delay = 0.5,
			duration = 1,
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				widget.content.alpha_multiplier = 1 - progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local challenge = widget.content.challenge

				params.view:_cb_on_done(widget, challenge)
			end
		}
	}
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	create_objective = create_objective,
	header_templates = header_templates,
	get_widget_position = get_widget_position
}
