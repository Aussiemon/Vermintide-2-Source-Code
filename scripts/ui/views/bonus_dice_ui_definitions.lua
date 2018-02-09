local DICE_SIZE = {
	42,
	42
}
local NUM_DICE_COLUMNS = 5
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			1920,
			1080
		}
	},
	bonus_dice_background = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			42,
			-42,
			1
		},
		size = {
			DICE_SIZE[1],
			DICE_SIZE[2]
		}
	}
}
local dice_widget_definition = {
	scenegraph_id = "bonus_dice_background",
	element = UIElements.SimpleTexture,
	content = {
		texture_id = "dice_01"
	},
	style = {
		offset = {
			0,
			0,
			0
		},
		color = {
			255,
			255,
			255,
			255
		}
	}
}
local die_type_textures = {
	weighted = "dice_01",
	golden = "dice_01",
	normal = "dice_01"
}

local function get_die_texture(die_type)
	return die_type_textures[die_type] or "dice_01"
end

return {
	gap = 10,
	scenegraph_definition = scenegraph_definition,
	dice_widget_definition = dice_widget_definition,
	dice_size = table.clone(DICE_SIZE),
	num_dice_columns = NUM_DICE_COLUMNS,
	get_die_texture = get_die_texture
}
