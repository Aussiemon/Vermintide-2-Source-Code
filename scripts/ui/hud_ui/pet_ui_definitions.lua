-- chunkname: @scripts/ui/hud_ui/pet_ui_definitions.lua

local RETAINED_MODE_ENABLED = true
local SKULL_TEXTURES = {
	"necromancer_hud_skull_01",
	"necromancer_hud_skull_02",
	"necromancer_hud_skull_03",
	"necromancer_hud_skull_04",
	"necromancer_hud_skull_05",
	"necromancer_hud_skull_06",
}
local SKULL_GLOW_TEXTURES = {
	"necromancer_hud_skull_01_eyes",
	"necromancer_hud_skull_02_eyes",
	"necromancer_hud_skull_03_eyes",
	"necromancer_hud_skull_04_eyes",
	"necromancer_hud_skull_05_eyes",
	"necromancer_hud_skull_06_eyes",
}
local COMMAND_TO_ICON = {
	[CommandStates.Following] = "necromancer_command_coin_follow",
	[CommandStates.Attacking] = "necromancer_command_coin_attack",
	[CommandStates.StandingGround] = "necromancer_command_coin_defend",
}
local COMMAND_TO_TEXT = {
	[CommandStates.Following] = "shovel_skeleton_state_follow",
	[CommandStates.Attacking] = "shovel_skeleton_state_attack",
	[CommandStates.StandingGround] = "shovel_skeleton_state_defend",
}
local ROOT_SIZE = {
	1920,
	1080,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = ROOT_SIZE,
	},
	screen = {
		position = {
			0,
			0,
			UILayer.hud_inventory,
		},
		size = ROOT_SIZE,
		scale = IS_CONSOLE and "hud_fit" or "fit",
	},
	container = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			460,
			0,
			0,
		},
		size = {
			300,
			80,
		},
	},
	skull_pivot = {
		horizontal_alignment = "left",
		parent = "container",
		vertical_alignment = "top",
		position = {
			2,
			-11,
			5,
		},
		size = {
			64,
			64,
		},
	},
}
local container_widget_definition = {
	scenegraph_id = "container",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "bg",
				texture_id = "bg",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "enumerator_bg",
				texture_id = "enumerator_bg",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return Application.user_setting("numeric_ui")
				end,
			},
			{
				pass_type = "text",
				style_id = "help_text",
				text_id = "help_text",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.in_command_mode
				end,
			},
			{
				pass_type = "texture",
				style_id = "state_glow",
				texture_id = "state_glow",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.show_glow
				end,
			},
			{
				pass_type = "texture",
				style_id = "state",
				texture_id = "state",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "state_icon",
				texture_id = "state_icon",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "pet_amount_text",
				text_id = "pet_amount_text",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "text",
				style_id = "pet_amount_text_shadow",
				text_id = "pet_amount_text_shadow",
				retained_mode = RETAINED_MODE_ENABLED,
			},
		},
	},
	content = {
		bg = "necromancer_hud_base",
		enumerator_bg = "necromancer_hud_enumerator_piece",
		pet_amount_text = "",
		pet_amount_text_shadow = "",
		show_glow = false,
		state = "necromancer_command_coin",
		state_glow = "necromancer_heavy_attack_fx",
		state_icon = "necromancer_command_coin_attack",
	},
	style = {
		bg = {
			texture_size = {
				300,
				80,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		state_glow = {
			horizontal_alignment = "right",
			texture_size = {
				76,
				84,
			},
			offset = {
				15,
				0,
				1,
			},
		},
		state = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				48,
				48,
			},
			offset = {
				244,
				-18,
				3,
			},
		},
		state_icon = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				48,
				48,
			},
			offset = {
				244,
				-18,
				4,
			},
		},
		help_text = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			word_wrap = true,
			text_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				scenegraph_definition.container.size[2] + 50,
				4,
			},
		},
		enumerator_bg = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				20,
				18,
			},
			offset = {
				-22,
				-3,
				3,
			},
		},
		pet_amount_text = {
			font_size = 14,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = {
				255,
				255,
				255,
				160,
			},
			size = {
				40,
				18,
			},
			offset = {
				248,
				-2,
				5,
			},
		},
		pet_amount_text_shadow = {
			font_size = 14,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				40,
				18,
			},
			offset = {
				250,
				-3,
				4,
			},
		},
	},
}
local pet_widget_definition = {
	scenegraph_id = "skull_pivot",
	offset = {
		0,
		0,
		0,
	},
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				retained_mode = RETAINED_MODE_ENABLED,
			},
			{
				pass_type = "texture",
				style_id = "icon_glow",
				texture_id = "icon_glow",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content, style)
					return style.color[1] > 0
				end,
			},
		},
	},
	content = {
		icon = "necromancer_hud_skull_01",
		icon_glow = "necromancer_hud_skull_01_eyes",
	},
	style = {
		icon = {
			offset = {
				0,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		icon_glow = {
			offset = {
				0,
				0,
				2,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
	},
}

local function reposition_widget(widget, index, total)
	widget.offset[1] = 36 * (6 - index)
end

local function set_progress(immediate_materials, retained_materials, t)
	local materials = RETAINED_MODE_ENABLED and retained_materials or immediate_materials

	for i = 1, #materials do
		Material.set_scalar(materials[i], "progress", t)
	end
end

local animation_definitions = {
	change_command_state = {
		{
			delay = 0,
			duration = 0.1,
			name = "spin_half_1",
			init = function (ui_scenegraph, _, container_widget, command_state)
				return
			end,
			update = function (ui_scenegraph, _, container_widget, progress, command_state)
				set_progress(container_widget.content.materials, container_widget.content.retained_materials, progress * 0.5)
			end,
			on_complete = function (ui_scenegraph, _, container_widget, command_state)
				container_widget.content.state_icon = COMMAND_TO_ICON[command_state] or "icons_placeholder"
			end,
		},
		{
			delay = 0.1,
			duration = 0.1,
			name = "spin_half_2",
			init = function (ui_scenegraph, _, container_widget, command_state)
				return
			end,
			update = function (ui_scenegraph, _, container_widget, progress, command_state)
				set_progress(container_widget.content.materials, container_widget.content.retained_materials, progress * 0.5 + 0.5)
			end,
			on_complete = function (ui_scenegraph, _, container_widget, command_state)
				set_progress(container_widget.content.materials, container_widget.content.retained_materials, 0)
			end,
		},
	},
	spawn_skeleton = {
		{
			delay = 0,
			duration = 0.2,
			name = "dissolve_icon",
			init = function (ui_scenegraph, _, pet_widget)
				local color = pet_widget.style.icon.color

				color[1], color[2], color[3], color[4] = 0, 0, 0, 0
			end,
			update = function (ui_scenegraph, _, pet_widget, progress)
				local value = 255 * progress
				local color = pet_widget.style.icon.color

				color[1], color[2], color[3], color[4] = value, value, value, value
			end,
			on_complete = function (ui_scenegraph, _, pet_widget)
				return
			end,
		},
	},
	fade_in_skull_glow = {
		{
			delay = 0.2,
			duration = 0.2,
			name = "fade_in_skull_glow",
			init = function (ui_scenegraph, _, pet_widget)
				pet_widget.style.icon_glow.color[1] = 0
			end,
			update = function (ui_scenegraph, _, pet_widget, progress)
				pet_widget.style.icon_glow.color[1] = 255 * progress
			end,
			on_complete = function (ui_scenegraph, _, pet_widget)
				return
			end,
		},
	},
	fade_out_skull_glow = {
		{
			delay = 0.2,
			duration = 0.2,
			name = "fade_out_skull_glow",
			init = function (ui_scenegraph, _, pet_widget)
				pet_widget.style.icon_glow.color[1] = 255
			end,
			update = function (ui_scenegraph, _, pet_widget, progress)
				pet_widget.style.icon_glow.color[1] = 255 - 255 * progress
			end,
			on_complete = function (ui_scenegraph, _, pet_widget)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	container_widget_definition = container_widget_definition,
	pet_widget_definition = pet_widget_definition,
	reposition_widget = reposition_widget,
	SKULL_TEXTURES = SKULL_TEXTURES,
	SKULL_GLOW_TEXTURES = SKULL_GLOW_TEXTURES,
	COMMAND_TO_ICON = COMMAND_TO_ICON,
	COMMAND_TO_TEXT = COMMAND_TO_TEXT,
	RETAINED_MODE_ENABLED = RETAINED_MODE_ENABLED,
}
