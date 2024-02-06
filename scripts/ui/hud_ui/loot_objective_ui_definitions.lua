-- chunkname: @scripts/ui/hud_ui/loot_objective_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local ICON_SIZE = {
	64,
	64,
}
local BACKGROUND_SIZE = {
	819,
	60,
}
local scenegraph_definition = {
	root = {
		is_root = true,
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
	background_parent = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "center",
		position = {
			-200,
			-100,
			1,
		},
		size = {
			383,
			86,
		},
	},
	background = {
		horizontal_alignment = "left",
		parent = "background_parent",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			0,
		},
		size = {
			383,
			86,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
}
local color = table.clone(Colors.color_definitions.white)

color[1] = 0

local function create_loot_widget(texture, amount)
	local spacing = {
		20,
		20,
	}
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size
	local texture_total_width = texture_size[1] * amount
	local total_spacing = spacing[1] * (amount - 1)
	local size = {
		texture_total_width + total_spacing,
		texture_size[2] + spacing[2],
	}
	local frame_settings = UIFrameSettings.item_hover_01
	local frame_corner_size = frame_settings.texture_sizes.corner
	local icon_textures = {}
	local glow_icon_textures = {}
	local background_icon_textures = {}
	local icon_texture_sizes = {}
	local icon_texture_colors = {}

	for i = 1, amount do
		icon_textures[i] = texture
		glow_icon_textures[i] = texture .. "_glow"
		background_icon_textures[i] = texture .. "_bg"
		icon_texture_sizes[i] = texture_size
		icon_texture_colors[i] = {
			0,
			255,
			255,
			255,
		}
	end

	return {
		scenegraph_id = "background",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "multi_texture",
					style_id = "icon_textures",
					texture_id = "icon_textures",
				},
				{
					pass_type = "multi_texture",
					style_id = "background_icon_textures",
					texture_id = "background_icon_textures",
				},
				{
					pass_type = "multi_texture",
					style_id = "glow_icon_textures",
					texture_id = "glow_icon_textures",
				},
			},
		},
		content = {
			background = "loot_objective_bg",
			draw_count = 0,
			amount = amount,
			frame = frame_settings.texture,
			icon_textures = icon_textures,
			glow_icon_textures = glow_icon_textures,
			background_icon_textures = background_icon_textures,
		},
		style = {
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					150,
					255,
					255,
					255,
				},
				default_color = {
					150,
					255,
					255,
					255,
				},
				size = {
					size[1] + frame_corner_size[1] * 2,
					size[2] + frame_corner_size[2] * 2,
				},
				offset = {
					-frame_corner_size[1],
					-frame_corner_size[2],
					2,
				},
			},
			background = {
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			icon_textures = {
				axis = 1,
				direction = 1,
				scenegraph_id = "pivot",
				spacing = {
					spacing[1],
					0,
				},
				texture_sizes = icon_texture_sizes,
				texture_colors = icon_texture_colors,
				color = {
					0,
					255,
					255,
					255,
				},
				default_color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					-size[1] / 2,
					-texture_size[2] / 2,
					2,
				},
				draw_count = amount,
			},
			background_icon_textures = {
				axis = 1,
				direction = 1,
				scenegraph_id = "pivot",
				spacing = {
					spacing[1],
					0,
				},
				texture_sizes = icon_texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-size[1] / 2,
					-texture_size[2] / 2,
					1,
				},
				draw_count = amount,
			},
			glow_icon_textures = {
				axis = 1,
				direction = 1,
				scenegraph_id = "pivot",
				spacing = {
					spacing[1],
					0,
				},
				texture_sizes = icon_texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-size[1] / 2,
					-texture_size[2] / 2,
					3,
				},
				draw_count = amount,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local widget_definitions = {}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	create_loot_widget = create_loot_widget,
}
