ImguiUIEditor = class(ImguiUIEditor)
local Gui = Gui
local Vector2 = Vector2
local Vector3 = Vector3
local Color = Color

local function V2(t)
	return Vector2(t[1], t[2])
end

local function show_texture(gui, res, ts)
	local size = V2(ts.size)
	local pos = Vector3(0.5 * (res[1] - size[1]), 0.5 * (res[2] - size[2]), 1000)
	local PADDING = Vector2(5, 5)

	Gui.rect(gui, pos - PADDING, size + 2 * PADDING, Color(255, 0, 255, 255))
	Gui.rect(gui, pos, size, Color(255, 255, 0, 255))
	Gui.bitmap_uv(gui, ts.material_name, V2(ts.uv00), V2(ts.uv11), pos, size, Color(255, 255, 255, 255))
end

local DO_RELOAD = true

ImguiUIEditor.init = function (self)
	self._needle = ""
	self._rect = {
		w = 100,
		h = 100,
		x = 0,
		y = 0
	}

	dofile("scripts/helpers/ui_atlas_helper")

	local texture_list = {}

	for k, v in pairs(UIAtlasHelper._ui_atlas_settings) do
		v.texture_name = k
		texture_list[#texture_list + 1] = v
	end

	table.sort(texture_list, function (a, b)
		return a.texture_name < b.texture_name
	end)

	self._texture_list = texture_list
	DO_RELOAD = false
end

ImguiUIEditor.destroy = function (self)
	if self._gui then
		Managers.package:unload("resource_packages/menu_assets_common", "ImguiUIEditor")

		self._gui = World.destroy_gui(self._world, self._gui)
		self._world, self._gui = nil
	end
end

local function materials(list, ...)
	local name = table.remove(list)

	if not name then
		return ...
	end

	if Application.can_get("material", name) then
		return materials(list, "material", name, ...)
	else
		return materials(list, ...)
	end
end

ImguiUIEditor.get_gui = function (self)
	if self._gui ~= nil or not Managers.world:has_world("top_ingame_view") then
		return self._gui
	end

	self._gui = false

	Managers.package:load("resource_packages/menu_assets_common", "ImguiUIEditor", function ()
		self._world = Managers.world:world("top_ingame_view")
		self._gui = World.create_screen_gui(self._world, "immediate", materials({
			"materials/ui/ui_1080p_achievement_atlas_textures",
			"materials/ui/ui_1080p_carousel_atlas",
			"materials/ui/ui_1080p_chat",
			"materials/ui/ui_1080p_common",
			"materials/ui/ui_1080p_demo_textures",
			"materials/ui/ui_1080p_hud_atlas_textures",
			"materials/ui/ui_1080p_hud_single_textures",
			"materials/ui/ui_1080p_inn_single_textures",
			"materials/ui/ui_1080p_loading",
			"materials/ui/ui_1080p_menu_atlas_textures",
			"materials/ui/ui_1080p_menu_single_textures",
			"materials/ui/ui_1080p_news_splash",
			"materials/ui/ui_1080p_popup",
			"materials/ui/ui_1080p_splash_screen",
			"materials/ui/ui_1080p_start_screen",
			"materials/ui/ui_1080p_store_menu",
			"materials/ui/ui_1080p_title_screen",
			"materials/ui/ui_1080p_tutorial_textures",
			"materials/ui/ui_1080p_voice_chat",
			"materials/ui/ui_1080p_watermarks",
			"materials/fonts/gw_fonts"
		}))
	end, true)
end

ImguiUIEditor.update = function (self)
	if DO_RELOAD then
		self:destroy()
		self:init()
	end
end

local material_modifiers = {
	{
		"Masked",
		"masked_"
	},
	{
		"Saturated",
		"saturated_"
	},
	{
		"Point-sample",
		"point_sample_"
	},
	{
		"Offscreen",
		"offscreen_"
	}
}

local function fixed_width_text(text)
	Imgui.text(text)
	Imgui.same_line(100 - Imgui.calculate_text_size(text))
	Imgui.spacing(0)
end

local function material_type_matrix(ts)
	for _, mod in ipairs(material_modifiers) do
		fixed_width_text(mod[1])
		Imgui.same_line()
	end

	Imgui.spacing()

	for key in pairs(ts) do
		if string.find(key, "material_name") then
			for _, mod in ipairs(material_modifiers) do
				fixed_width_text(tostring(not not string.find(key, mod[2])))
				Imgui.same_line()
			end

			Imgui.spacing()
		end
	end
end

local string_format = string.format

local function Imgui_text_fmt(fmt, ...)
	return Imgui.text(string_format(fmt, ...))
end

ImguiUIEditor.draw = function (self)
	local gui = self:get_gui()
	local res = Vector2(Gui.resolution())

	Imgui.begin_window("Texture viewer")

	local needle = Imgui.input_text("Search texture", self._needle)
	self._needle = needle
	local no_matches = true

	Imgui.begin_child_window("Search results", 0, 0, true)
	Imgui.columns(3)

	local find = string.find

	for _, texture_settings in ipairs(self._texture_list) do
		if find(texture_settings.texture_name, needle) then
			Imgui.text(texture_settings.texture_name)
			Imgui.open_popup_on_item_click("test_popup")

			if Imgui.is_item_hovered() then
				Imgui.begin_tool_tip("Material matrix")
				material_type_matrix(texture_settings)
				Imgui.end_tool_tip()

				if gui then
					pcall(show_texture, gui, res, texture_settings)
				end
			end

			Imgui.next_column()
			Imgui.text(texture_settings.material_name)
			Imgui.next_column()
			Imgui_text_fmt("%dx%d", texture_settings.size[1], texture_settings.size[2])
			Imgui.next_column()

			no_matches = false
		end
	end

	Imgui.columns(0)

	if no_matches then
		Imgui.text("No matches.")
	end
end

ImguiUIEditor.is_persistent = function (self)
	return false
end

return
