return function ()
	dofile("scripts/ui/fat/fat_ui")
	FatUI.debug_hook("open_frame", function (func, ...)
		func(...)

		FatUI._texture_debug_ptr = Vector3(50, FatUI.resolution[2] - 50, 1000)
	end)

	local function debug_draw(method, arg, pos, size, debug_color)
		if not DEBUG_DRAW then
			return
		end

		local label = string.format("%s(%q, %s, %s)", method, arg, tostring(pos), tostring(size))

		if FatUI.mouse_is_inside(pos, size) then
			local min, max = Gui.text_extents(FatUI.gui, label, "materials/fonts/arial", 24)
			local info_pos, info_size = TY.apply_margins(Vector2(-10, -6), FatUI._texture_debug_ptr, max - min)

			Gui.rect(FatUI.gui, info_pos, info_size, Color(39, 40, 34))
			Gui.text(FatUI.gui, label, "materials/fonts/arial", 24, nil, FatUI._texture_debug_ptr, debug_color)

			FatUI._texture_debug_ptr[2] = FatUI._texture_debug_ptr[2] - 26.400000000000002
		end

		local s = FatUI.base_scale
		size = s * size
		pos = s * pos
		pos = pos + Vector3(0, 0, 1)
		local inner_pos, inner_size = TY.apply_margins(Vector2(3, 3), pos, size)

		Gui.rect(FatUI.gui, pos, size, Color(39, 40, 34))
		Gui.rect(FatUI.gui, inner_pos, inner_size, debug_color)
		Gui.text(FatUI.gui, arg, "materials/fonts/arial", 16, nil, inner_pos + Vector2(1, 1), Color(200, 200, 200))
		Gui.text(FatUI.gui, arg, "materials/fonts/arial", 16, nil, inner_pos + Vector2(1, -1), Color(200, 200, 200))
		Gui.text(FatUI.gui, arg, "materials/fonts/arial", 16, nil, inner_pos + Vector2(-1, -1), Color(200, 200, 200))
		Gui.text(FatUI.gui, arg, "materials/fonts/arial", 16, nil, inner_pos + Vector2(-1, 1), Color(200, 200, 200))
		Gui.text(FatUI.gui, arg, "materials/fonts/arial", 16, nil, inner_pos, Color(0, 0, 0))

		return true
	end

	local ALPHABET = "abcdefghijklmnopqrstuvwxyz"

	local function random_char(seed, i)
		seed, i = Math.next_random(seed, #ALPHABET)

		return seed, string.sub(ALPHABET, i, i)
	end

	FatUI.debug_text_lengths = function (text)
		if not DEBUG_TEXT_LENGTHS then
			return text
		end

		local seed, x = tonumber(Application.make_hash(text):sub(-8), 16)

		return text:gsub("%S", function (char, char2, roll)
			seed, char = random_char(seed)
			seed, roll = Math.next_random(seed)

			if roll < 0.25 then
				seed, char2 = random_char(seed)
				char = char .. char2
			end

			return char
		end)
	end

	FatUI.debug_hook("draw_texture_uv", function (func, texture, uv00, uv11, pos, size, color)
		if FatUI.debug_draw("draw_texture_uv", texture, pos, size, Color(102, 217, 239)) then
			return
		end

		func(texture, uv00, uv11, pos, size, color)
	end)
	FatUI.debug_hook("draw_texture", function (func, texture, pos, size, color)
		if FatUI.debug_draw("draw_texture", texture, pos, size, Color(249, 38, 114)) then
			return
		end

		func(texture, pos, size, color)
	end)
	FatUI.debug_hook("draw_text", function (func, text, font, font_size, pos, color)
		local size = FatUI.calc_text_extents_size(text, font, font_size)
		text = FatUI.debug_text_lengths(text)

		if FatUI.debug_draw("draw_text", text, pos, size, Color(166, 226, 46)) then
			return
		end

		func(text, font, font_size, pos, color)
	end)
	FatUI.debug_hook("calc_word_wrap", function (func, text, font, font_size, width, hard_breaks, soft_breaks, use_global)
		text = FatUI.debug_text_lengths(text)

		return func(text, font, font_size, width, hard_breaks, soft_breaks, use_global)
	end)
	FatUI.debug_hook("calc_text_extents", function (func, text, font, font_size)
		text = FatUI.debug_text_lengths(text)

		return func(text, font, font_size)
	end)
end
