Fonts = {
	arial = {
		"materials/fonts/arial",
		14,
		"arial"
	},
	arial_masked = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.Masked
	},
	arial_write_mask = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.WriteMask
	},
	hell_shark_arial = {
		"materials/fonts/arial",
		14,
		"arial"
	},
	hell_shark_arial_masked = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.Masked
	},
	hell_shark_arial_write_mask = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.WriteMask
	},
	hell_shark = {
		"materials/fonts/gw_body",
		20,
		"gw_body"
	},
	hell_shark_masked = {
		"materials/fonts/gw_body",
		20,
		"gw_body",
		Gui.Masked
	},
	hell_shark_write_mask = {
		"materials/fonts/gw_body",
		20,
		"gw_body",
		Gui.WriteMask
	},
	hell_shark_header = {
		"materials/fonts/gw_head",
		20,
		"gw_head"
	},
	hell_shark_header_masked = {
		"materials/fonts/gw_head",
		20,
		"gw_head",
		Gui.Masked
	},
	hell_shark_header_write_mask = {
		"materials/fonts/gw_head",
		20,
		"gw_head",
		Gui.WriteMask
	},
	chat_output_font = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.MultiColor + Gui.ForceSuperSampling + Gui.FormatDirectives
	},
	chat_output_font_masked = {
		"materials/fonts/arial",
		14,
		"arial",
		Gui.MultiColor + Gui.ForceSuperSampling + Gui.FormatDirectives + Gui.Masked
	}
}
local font_vertical_base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
local font_height_base = "A"
FontHeights = FontHeights or {}
local math_floor = math.floor

function UIFontByResolution(font_style, optional_scale)
	local font_type = font_style.font_type
	local font_size = font_style.font_size
	local scale = RESOLUTION_LOOKUP.scale

	if optional_scale then
		scale = scale * optional_scale
	end

	local target_size = (font_style.allow_fractions and font_size * scale) or math_floor(font_size * scale)
	local used_font_size = math.max(target_size, 1)

	return Fonts[font_type], used_font_size
end

function UISetupFontHeights(gui)
	local FontHeights = FontHeights

	for font_name, font_data in pairs(Fonts) do
		if FontHeights[font_name] == nil then
			FontHeights[font_name] = {}
			local material, size, font = unpack(font_data)
			local min, max, caret = Gui.text_extents(gui, font_vertical_base, material, size)
			local base_min, base_max, _ = Gui.text_extents(gui, font_height_base, material, size)
			FontHeights[font_name][size] = {
				base_max[3] - base_min[3],
				min[3],
				max[3]
			}
		end
	end
end

function UIGetFontHeight(gui, font_name, font_size)
	local FontHeights = FontHeights
	FontHeights[font_name] = FontHeights[font_name] or {}
	local height_data = FontHeights[font_name][font_size]
	local scale = RESOLUTION_LOOKUP.scale
	local extra_max = 5 * scale * math.min(font_size / 20, 1)
	local extra_min = 4 * scale * math.min(font_size / 20, 1)

	if height_data then
		return height_data[1] + extra_min + extra_max, height_data[2] - extra_min, height_data[3] + extra_max
	end

	local material = Fonts[font_name][1]
	local min, max, caret = Gui.text_extents(gui, font_vertical_base, material, font_size)
	local base_min, base_max, caret = Gui.text_extents(gui, font_height_base, material, font_size)
	local height = base_max[3] - base_min[3]
	FontHeights[font_name][font_size] = {
		height,
		min[3],
		max[3]
	}

	return height + extra_min + extra_max, min.y - extra_min, max.y + extra_max
end

return
