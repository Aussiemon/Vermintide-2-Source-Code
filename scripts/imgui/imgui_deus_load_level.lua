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
	for base_level_name, _ in pairs(DEUS_LEVEL_SETTINGS) do
		levels[#levels + 1] = base_level_name
	end
end

table.sort(levels)

ImguiDeusLoadLevel.init = function (self)
	self._base_level_index = 1
	self._path_index = 1
	self._theme_index = 1
	self._difficulty_index = 1
	self._progress = 0
end

ImguiDeusLoadLevel.update = function (self)
	return
end

ImguiDeusLoadLevel.is_persistent = function (self)
	return false
end

ImguiDeusLoadLevel.draw = function (self, is_open)
	local mechanism_name = Managers.mechanism:current_mechanism_name()

	Imgui.Begin("DeusLoadLevel", "always_auto_resize")

	if mechanism_name ~= "deus" then
		Imgui.Text("This UI only works when playing with the deus mechanism.")
	else
		local prev_base_level_index = self._base_level_index
		self._base_level_index = Imgui.Combo("Level", self._base_level_index - 1, levels)

		if prev_base_level_index ~= self._base_level_index then
			self._path_index = 1
			self._theme_index = 1
		end

		local base_level_name = levels[self._base_level_index]
		local deus_level = DEUS_LEVEL_SETTINGS[base_level_name]
		self._path_index = Imgui.Combo("Path", self._path_index - 1, deus_level.paths)
		self._theme_index = Imgui.Combo("Theme", self._theme_index - 1, deus_level.themes)
		self._difficulty_index = Imgui.Combo("Difficulty", self._difficulty_index - 1, difficulties)
		self._progress = Imgui.SliderFloat("Run progress", self._progress, 0, 0.999)
		local full_name = base_level_name .. "_" .. deus_level.themes[self._theme_index] .. "_path" .. deus_level.paths[self._path_index]

		if Imgui.Button("Load") then
			local mechanism = Managers.mechanism:game_mechanism()

			mechanism:debug_load_deus_level(full_name, difficulties[self._difficulty_index], self._progress)
		end
	end

	Imgui.End()
end

return
