ImguiDeusLoadLevel = class(ImguiDeusLoadLevel)
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
local levels = {}

if DEUS_LEVEL_SETTINGS then
	for level_name, _ in pairs(DEUS_LEVEL_SETTINGS) do
		levels[#levels + 1] = level_name
	end
end

table.sort(levels)

ImguiDeusLoadLevel.init = function (self)
	self._base_level_index = 1
	self._path_index = 1
	self._theme_index = 1
	self._difficulty_index = 1
	self._progress = 0
	self._level_seed = 0
end

ImguiDeusLoadLevel.update = function (self)
	return
end

ImguiDeusLoadLevel.is_persistent = function (self)
	return false
end

ImguiDeusLoadLevel.draw = function (self, is_open)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local do_close = Imgui.begin_window("DeusLoadLevel", "always_auto_resize")

	if mechanism_name ~= "deus" then
		Imgui.text("This UI only works when playing with the deus mechanism.")
	else
		local prev_base_level_index = self._base_level_index
		self._base_level_index = Imgui.combo("Level", self._base_level_index, levels)

		if prev_base_level_index ~= self._base_level_index then
			self._path_index = 1
			self._theme_index = 1
		end

		local level_name = levels[self._base_level_index]
		local deus_level = DEUS_LEVEL_SETTINGS[level_name]
		local with_belakor = nil

		if level_name ~= "arena_belakor" then
			self._path_index = Imgui.combo("Path", self._path_index, deus_level.paths)
			self._theme_index = Imgui.combo("Theme", self._theme_index, deus_level.themes)
			self._with_belakor = Imgui.checkbox("With Belakor", not not self._with_belakor)
			with_belakor = self._with_belakor
		else
			Imgui.checkbox("With Belakor", true)

			with_belakor = true
		end

		self._difficulty_index = Imgui.combo("Difficulty", self._difficulty_index, difficulties)
		self._progress = Imgui.slider_float("Run progress", self._progress, 0, 0.999)
		self._level_seed = Imgui.input_int("Level seed", self._level_seed)

		Imgui.same_line()

		if Imgui.button("Randomize seed") then
			self._level_seed = math.random_seed()
		end

		Imgui.text_colored("If entered manually: Press return to confirm the entered seed", 255, 255, 255, 128)
		Imgui.spacing()

		local full_name = nil

		if level_name == "arena_belakor" then
			full_name = "arena_belakor"
		else
			full_name = level_name .. "_" .. deus_level.themes[self._theme_index] .. "_path" .. deus_level.paths[self._path_index]
		end

		if Imgui.button("Load") then
			local mechanism = Managers.mechanism:game_mechanism()

			mechanism:debug_load_deus_level(full_name, difficulties[self._difficulty_index], self._progress, self._level_seed, with_belakor)
		end
	end

	Imgui.end_window()

	return do_close
end
