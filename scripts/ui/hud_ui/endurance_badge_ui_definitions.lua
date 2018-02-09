local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	root = {
		is_root = true,
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
	icon_root = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			64,
			-64,
			1
		},
		size = {
			0,
			0
		}
	}
}

local function create_badge_widget(id, texture)
	local global_color = Colors.get_color_table_with_alpha("white", 100)
	local parent_scenegraph_id = "icon_root"
	local scenegraph_id = "badge_" .. id
	local scenegraph_text_id = "badge_text_" .. id
	local icon_scenegraph = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		parent = parent_scenegraph_id,
		position = {
			0,
			0,
			1
		},
		size = {
			64,
			64
		}
	}
	local text_scenegraph = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		parent = scenegraph_id,
		position = {
			0,
			0,
			1
		},
		size = {
			64,
			64
		}
	}
	scenegraph_definition[scenegraph_id] = icon_scenegraph
	scenegraph_definition[scenegraph_text_id] = text_scenegraph

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					global_color_id = "global_color",
					retained_mode = true
				},
				{
					global_color_id = "global_color",
					style_id = "icon_text",
					pass_type = "text",
					text_id = "icon_text"
				}
			}
		},
		content = {
			icon_text = "",
			icon = texture
		},
		style = {
			icon = {
				offset = {
					0,
					0,
					1
				}
			},
			icon_text = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = 18,
				word_wrap = false,
				offset = {
					0,
					-25,
					1
				},
				scenegraph_id = scenegraph_text_id
			}
		},
		style_global = {
			global_color = global_color
		},
		scenegraph_id = scenegraph_id
	}
end

local mission_names = {
	"endurance_badge_01_mission",
	"endurance_badge_02_mission",
	"endurance_badge_03_mission",
	"endurance_badge_04_mission",
	"endurance_badge_05_mission"
}
local widget_definitions = {}
local missions = Missions

for index, mission_name in ipairs(mission_names) do
	local mission_template = missions[mission_name]
	local icon_texture = mission_template.collected_item_texture
	local widget = create_badge_widget(index, icon_texture)
	widget.content.mission_name = mission_name
	widget_definitions[index] = widget
end

return {
	mission_names = mission_names,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
