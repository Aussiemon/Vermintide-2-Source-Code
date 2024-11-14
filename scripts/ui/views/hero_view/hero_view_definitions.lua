-- chunkname: @scripts/ui/views/hero_view/hero_view_definitions.lua

local_require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root_1 = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root_1",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "dead_space_filler",
		vertical_alignment = "top",
		size = {
			1800,
			2,
		},
		position = {
			0,
			-150,
			1,
		},
	},
}
local settings_by_screen = {
	{
		draw_background_world = false,
		name = "overview",
		state_name = "HeroViewStateOverview",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
		contains_new_content = function ()
			return false
		end,
	},
	{
		draw_background_world = false,
		name = "achievements",
		state_name = "HeroViewStateAchievements",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
		contains_new_content = function ()
			return false
		end,
	},
	{
		camera_target = "consumable_table",
		draw_background_world = false,
		hotkey_disabled = true,
		name = "loot",
		state_name = "HeroViewStateLoot",
		camera_position = {
			0,
			2.4,
			0.6,
		},
		camera_rotation = {
			0,
			0,
			-1.2,
		},
		contains_new_content = function ()
			return false
		end,
	},
	{
		draw_background_world = false,
		name = "keep_decorations",
		state_name = "HeroViewStateKeepDecorations",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
		contains_new_content = function ()
			return false
		end,
	},
	{
		draw_background_world = false,
		name = "weave_forge",
		state_name = "HeroViewStateWeaveForge",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
		contains_new_content = function ()
			return false
		end,
	},
	{
		draw_background_world = false,
		name = "handbook",
		state_name = "HeroViewStateHandbook",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
		contains_new_content = function ()
			return false
		end,
	},
}
local title_text_style = {
	font_size = 36,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_name_text_style = {
	font_size = 36,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_level_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local title_description_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local loading_text_style = {
	font_size = 72,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		16,
	},
}
local hero_icons = {
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead",
}
local widgets_definitions = {
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	title_description_text = UIWidgets.create_simple_text("n/a", "title_description_text", nil, nil, title_description_text_style),
	background = UIWidgets.create_simple_texture("large_frame_01", "dead_space_filler"),
	loading_bg = {
		scenegraph_id = "screen",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward",
		},
		style = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				15,
			},
		},
	},
	loading_text = UIWidgets.create_simple_text("n/a", "screen", nil, nil, loading_text_style),
}
local animations = {}
local attachments = {
	witch_hunter = {
		{
			unit_name = "units/beings/player/witch_hunter/headpiece/wh_hat_03",
			linking = AttachmentNodeLinking.hat.slot_hat,
		},
	},
	bright_wizard = {
		{
			unit_name = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff_3p",
			linking = AttachmentNodeLinking.staff.third_person.wielded,
		},
		{
			unit_name = "units/beings/player/bright_wizard/headpiece/bw_clothgate_01",
			linking = AttachmentNodeLinking.bw_gate.slot_hat,
		},
	},
	dwarf_ranger = {
		{
			unit_name = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.right.third_person.wielded,
		},
		{
			unit_name = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.left.third_person.wielded,
		},
		{
			unit_name = "units/beings/player/dwarf_ranger/headpiece/dr_helmet_01",
			linking = AttachmentNodeLinking.hat.slot_hat,
		},
	},
	wood_elf = {
		{
			unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
			linking = AttachmentNodeLinking.arrow.third_person.wielded,
		},
		{
			unit_name = "units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2_3p",
			linking = AttachmentNodeLinking.bow.third_person.wielded,
		},
		{
			unit_name = "units/beings/player/way_watcher/headpiece/ww_hood_01",
			linking = AttachmentNodeLinking.hat_skinned.slot_hat,
		},
	},
	empire_soldier = {
		{
			unit_name = "units/beings/player/empire_soldier/headpiece/es_hat_01",
			linking = AttachmentNodeLinking.hat.slot_hat,
		},
		{
			unit_name = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.right.third_person.wielded,
		},
	},
}
local flow_events = {
	witch_hunter = {
		available = "witch_hunter_available",
		hovered = "witch_hunter_hovered",
		selected = "witch_hunter_selected",
		unavailable = "witch_hunter_unavailable",
		unhovered = "witch_hunter_unhovered",
		unselected = "witch_hunter_unselected",
	},
	bright_wizard = {
		available = "bright_wizard_available",
		hovered = "bright_wizard_hovered",
		selected = "bright_wizard_selected",
		unavailable = "bright_wizard_unavailable",
		unhovered = "bright_wizard_unhovered",
		unselected = "bright_wizard_unselected",
	},
	dwarf_ranger = {
		available = "dwarf_ranger_available",
		hovered = "dwarf_ranger_hovered",
		selected = "dwarf_ranger_selected",
		unavailable = "dwarf_ranger_unavailable",
		unhovered = "dwarf_ranger_unhovered",
		unselected = "dwarf_ranger_unselected",
	},
	wood_elf = {
		available = "wood_elf_available",
		hovered = "wood_elf_hovered",
		selected = "wood_elf_selected",
		unavailable = "wood_elf_unavailable",
		unhovered = "wood_elf_unhovered",
		unselected = "wood_elf_unselected",
	},
	empire_soldier = {
		available = "empire_soldier_available",
		hovered = "empire_soldier_hovered",
		selected = "empire_soldier_selected",
		unavailable = "empire_soldier_unavailable",
		unhovered = "empire_soldier_unhovered",
		unselected = "empire_soldier_unselected",
	},
}

DLCUtils.append("hero_view_settings_by_screen", settings_by_screen)

return {
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions,
	settings_by_screen = settings_by_screen,
	attachments = attachments,
	flow_events = flow_events,
	animations = animations,
}
