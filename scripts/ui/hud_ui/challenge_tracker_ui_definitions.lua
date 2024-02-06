-- chunkname: @scripts/ui/hud_ui/challenge_tracker_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local QUEST_SIZE = {
	260,
	75,
}
local QUEST_PADDING = 20
local RETAINED_MODE_ENABLED = true
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
	pivot = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			1,
			155,
			0,
		},
		size = {
			0,
			0,
		},
	},
	quest = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "top",
		position = {
			0,
			0,
			0,
		},
		size = QUEST_SIZE,
	},
}
local corner = UIAtlasHelper.get_atlas_settings_by_texture_name("objective_detail")
local lily = UIAtlasHelper.get_atlas_settings_by_texture_name("lily")
local CHALLENGE_WIDGET_TEMPLATE = {
	scenegraph_id = "quest",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background_rect",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "background_lilies",
				texture_id = "background_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "corner_top_right",
				texture_id = "corner_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "corner_bot_right",
				texture_id = "corner_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "lily",
				texture_id = "lily_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "progress",
				texture_id = "progress_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "progress_bg",
				texture_id = "progress_bg_id",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "reward_icon",
				texture_id = "reward_icon",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "progress_text",
				text_id = "progress_text",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "challenge_name",
				text_id = "challenge_name",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "challenge_name_shadow",
				text_id = "challenge_name",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "reward_name",
				text_id = "reward_name",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "reward_name_shadow",
				text_id = "reward_name",
				retained_mode = RETAINED_MODE_ENABLED,
			},
		},
	},
	content = {
		alpha_multiplier = 1,
		background_id = "challenge_ui_questingknight_bg",
		challenge_name = "NO CHALLENGE NAME",
		is_done = false,
		last_milestone = 0,
		last_progress = 0,
		max_progress = 0,
		progress = 0,
		progress_bg_id = "challenge_ui_progress_arc_bg",
		progress_id = "challenge_ui_progress_arc",
		progress_text = "0/0",
		reward_name = "NO REWARD NAME",
		lily_id = lily.texture_name,
		corner_id = corner.texture_name,
	},
	style = {
		background_rect = {
			color = {
				200,
				0,
				0,
				0,
			},
		},
		background_lilies = {
			color = {
				175,
				255,
				255,
				255,
			},
		},
		corner_top_right = {
			horizontal_alignment = "right",
			vertical_alignment = "top",
			offset = {
				0,
				0.5 * corner.size[2],
				1,
			},
			texture_size = corner.size,
			color = {
				255,
				255,
				255,
				255,
			},
		},
		corner_bot_right = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			offset = {
				0,
				-0.5 * corner.size[2],
				1,
			},
			texture_size = corner.size,
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lily = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			offset = {
				-0.5 * lily.size[1] + 3,
				0,
				5,
			},
			texture_size = lily.size,
			color = {
				255,
				255,
				255,
				255,
			},
		},
		progress = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			color = Colors.get_color_table_with_alpha("es_questingknight", 255),
			offset = {
				-5,
				0,
				1,
			},
			texture_size = {
				70,
				70,
			},
		},
		progress_bg = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			color = {
				200,
				200,
				200,
				200,
			},
			offset = {
				-5,
				0,
				0,
			},
			texture_size = {
				70,
				70,
			},
		},
		challenge_name = {
			dynamic_font_size = true,
			font_size = 22,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "bottom",
			word_wrap = false,
			size = {
				QUEST_SIZE[1] - 95,
				QUEST_SIZE[2] * 0.5,
			},
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				20,
				QUEST_SIZE[2] * 0.5,
				1,
			},
		},
		challenge_name_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "bottom",
			word_wrap = false,
			size = {
				QUEST_SIZE[1] - 95,
				QUEST_SIZE[2] * 0.5,
			},
			text_color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				22,
				QUEST_SIZE[2] * 0.5 - 2,
				0,
			},
		},
		reward_name = {
			dynamic_font_size_word_wrap = true,
			font_size = 20,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				QUEST_SIZE[1] - 95,
				QUEST_SIZE[2] * 0.5,
			},
			text_color = Colors.get_color_table_with_alpha("es_questingknight", 255),
			offset = {
				20,
				5,
				1,
			},
		},
		reward_name_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 20,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				QUEST_SIZE[1] - 95,
				QUEST_SIZE[2] * 0.5,
			},
			text_color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				22,
				3,
				0,
			},
		},
		reward_icon = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			texture_size = {
				60,
				60,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-10,
				7,
				50,
			},
		},
		progress_text = {
			dynamic_font_size = true,
			font_size = 12,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = false,
			vertical_alignment = "bottom",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				QUEST_SIZE[1] * 0.5 - 40,
				10,
				1,
			},
		},
	},
}

local function get_widget_position(offset, index)
	return {
		offset[1],
		offset[2] - (QUEST_SIZE[2] + QUEST_PADDING) * (index - 1),
		offset[3],
	}
end

local function create_objective(challenge, gui, offset, index)
	local widget = UIWidget.init(CHALLENGE_WIDGET_TEMPLATE)

	widget.offset = get_widget_position(offset, index)

	local content = widget.content

	content.challenge = challenge
	content.challenge_name = Localize(challenge:get_challenge_name())

	if challenge:is_repeatable() then
		widget.style.background_rect.color = {
			200,
			15,
			10,
			5,
		}
		widget.style.background_lilies.color = {
			200,
			255,
			255,
			255,
		}
	end

	local reward, reward_name = challenge:get_reward(), challenge:get_reward_name()

	content.reward_name = UIUtils.format_localized_description(reward_name, reward.description_values)
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
	content.progress_text = tostring(mp - p)

	return widget
end

local animation_definitions = {
	on_enter = {
		{
			delay = 0.5,
			duration = 1,
			name = "ease_in",
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				local x = widget.offset

				params.src = {
					x[1] + 1.5 * QUEST_SIZE[2],
					x[2],
				}
				params.dst = {
					x[1],
					x[2],
				}
				widget.content.alpha_multiplier = 0
				widget.offset[1] = params.src[1]
				widget.offset[2] = params.src[2]

				local gui = RETAINED_MODE_ENABLED and params.ui_renderer.gui_retained or params.ui_renderer.gui
				local content = widget.content
				local material = Gui.material(gui, widget.content.progress_id)

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
			end,
		},
	},
	on_progress = {
		{
			duration = 0.2,
			name = "update circle",
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				local content = widget.content
				local p, mp = content.progress, content.max_progress

				content.start_anim_progress = content.start_anim_progress or 0
				content.end_anim_progress = p / mp
				content.progress_text = tostring(mp - p)
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				local content = widget.content
				local gui = RETAINED_MODE_ENABLED and params.ui_renderer.gui_retained or params.ui_renderer.gui
				local material = Gui.material(gui, widget.content.progress_id)
				local start_anim_progress = content.start_anim_progress
				local end_anim_progress = content.end_anim_progress
				local anim_progress = math.lerp(start_anim_progress, end_anim_progress, progress)

				Material.set_scalar(material, "angle", (anim_progress - 0.5) * math.pi * 2)

				local next_milestone_p = (content.last_milestone + 1) / 4

				if next_milestone_p < end_anim_progress and end_anim_progress < 1 then
					params.view:_play_sound("Play_hud_grail_knight_quest_milestone_finish")

					content.last_milestone = math.floor(end_anim_progress * 4)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local content = widget.content

				content.start_anim_progress = content.end_anim_progress
			end,
		},
	},
	on_done = {
		{
			delay = 0.5,
			duration = 1,
			name = "fade and play sound",
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				params.view:_play_sound("Play_hud_grail_knight_quest_finish")
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				widget.content.alpha_multiplier = 1 - progress
			end,
			on_complete = NOP,
		},
		{
			delay = 2.2,
			duration = 0.1,
			name = "play sound",
			init = NOP,
			update = NOP,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local challenge = widget.content.challenge
				local sound_event = challenge:get_reward().sound

				if sound_event then
					params.view:_play_sound(sound_event)
				end

				params.view:_cb_on_done(widget, challenge)
			end,
		},
	},
	on_cancel = {
		{
			delay = 0.5,
			duration = 1,
			name = "fade",
			init = function (ui_scenegraph, scenegraph_def, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_def, widget, progress, params)
				widget.content.alpha_multiplier = 1 - progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widget, params)
				local challenge = widget.content.challenge

				params.view:_cb_on_done(widget, challenge)
			end,
		},
	},
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	create_objective = create_objective,
	get_widget_position = get_widget_position,
	RETAINED_MODE_ENABLED = RETAINED_MODE_ENABLED,
}
