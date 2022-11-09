script_data.debug_key_handler_visible = script_data.debug_key_handler_visible or Development.parameter("debug_key_handler_visible")
local cache_fail = {}

local function cached_fail(key)
	if cache_fail[key] == nil then
		cache_fail[key] = key .. "(M)"
	end

	return cache_fail[key]
end

local mod_cache = {
	["left shift"] = {},
	["right shift"] = {},
	["left ctrl"] = {},
	["right ctrl"] = {},
	["left alt"] = {}
}

local function cached_key_mod(key, key_modifier, missing)
	local cache = mod_cache[key_modifier]

	if cache[key] == nil then
		cache[key] = {
			exist = key_modifier .. "+" .. key,
			missing = key_modifier .. "(M)+" .. key
		}
	end

	return (missing and cache[key].missing) or cache[key].exist
end

DebugKeyHandler = DebugKeyHandler or {
	num_keys = 0,
	keys = {}
}
local DebugKeyHandler = DebugKeyHandler

DebugKeyHandler.setup = function (world, input_manager)
	DebugKeyHandler.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	DebugKeyHandler.enabled = true
	DebugKeyHandler.input_manager = input_manager
	DebugKeyHandler.current_y = 0
end

DebugKeyHandler.set_enabled = function (enabled)
	DebugKeyHandler.enabled = enabled
end

local blocking_modifiers = {
	"left ctrl",
	"left shift",
	"right ctrl",
	"left alt"
}

DebugKeyHandler.key_pressed = function (key, description, category, key_modifier, input_service_name)
	if not DebugKeyHandler.enabled or IS_LINUX then
		return
	end

	local input_service = DebugKeyHandler.input_manager:get_service(input_service_name or "Debug")

	if not input_service then
		return
	end

	if script_data.debug_key_handler_visible then
		DebugKeyHandler.num_keys = DebugKeyHandler.num_keys + 1
		category = category or "misc"
		local category_keys = DebugKeyHandler.keys[category]

		if category_keys == nil then
			category_keys = {}
			DebugKeyHandler.keys[category] = category_keys
		end

		local key_string = (input_service:has(key) and key) or cached_fail(key)

		if key_modifier then
			key_string = (input_service:has(key) and cached_key_mod(key, key_modifier)) or cached_key_mod(key, key_modifier, true)
		end

		category_keys[key_string] = description
	end

	local modifier_pressed = true

	if key_modifier then
		modifier_pressed = input_service:get(key_modifier)
	else
		for i = 1, #blocking_modifiers, 1 do
			local blocking_key = blocking_modifiers[i]

			if blocking_key ~= key and input_service:get(blocking_key) then
				modifier_pressed = false

				break
			end
		end
	end

	local key_pressed = modifier_pressed and input_service:get(key)

	return key_pressed
end

DebugKeyHandler.frame_clear = function ()
	DebugKeyHandler.num_keys = 0

	for category, category_keys in pairs(DebugKeyHandler.keys) do
		if next(category_keys) == nil then
			DebugKeyHandler.keys[category] = nil
		end

		table.clear(category_keys)
	end
end

local font_size = 16
local font = "arial"
local font_mtrl = "materials/fonts/" .. font

DebugKeyHandler.render = function ()
	if not script_data.debug_key_handler_visible then
		return
	end

	local offset_lerp = 1

	if not DebugKeyHandler.enabled then
		offset_lerp = 0.3
	end

	local header_color = Color(offset_lerp * 250, 255, 255, 100)
	local category_color = Color(offset_lerp * 250, 255, 255, 255)
	local key_color = Color(offset_lerp * 250, 255, 120, 0)
	local description_color = Color(offset_lerp * 255, 150, 150, 150)
	local res_x, res_y = Application.resolution()
	local gui = DebugKeyHandler.gui
	local start_y = DebugKeyHandler.current_y
	DebugKeyHandler.current_y = math.lerp(start_y, res_y / 2 + (DebugKeyHandler.num_keys * font_size) / 2 + (table.size(DebugKeyHandler.keys) * font_size) / 2, 0.1)
	local pos = Vector3(res_x - 230, start_y, 200)

	Gui.text(gui, "Debug keys", font_mtrl, font_size, font, pos, header_color)

	pos.y = pos.y - font_size * 1.5
	local even = false

	for category, category_keys in pairs(DebugKeyHandler.keys) do
		local start_y_cat = pos.y

		Gui.text(gui, category, font_mtrl, font_size, font, pos, category_color)

		pos.y = pos.y - font_size

		for key, description in pairs(category_keys) do
			Gui.text(gui, key, font_mtrl, font_size, font, pos, key_color)
			Gui.text(gui, description, font_mtrl, font_size, font, pos + Vector3(80, 0, 0), description_color)

			pos.y = pos.y - font_size
		end

		pos.y = pos.y - font_size / 2
	end

	Gui.rect(gui, Vector3(res_x - 250, pos.y + font_size, 100), Vector2(250, start_y - pos.y), Color(offset_lerp * 240, 25, 50, 25))

	if not DebugKeyHandler.enabled then
		Gui.rect(gui, Vector3(res_x - 250, pos.y + font_size, 300), Vector2(250, start_y - pos.y), Color(offset_lerp * 200, 20, 20, 20))
	end
end

return
