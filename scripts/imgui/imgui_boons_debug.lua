-- chunkname: @scripts/imgui/imgui_boons_debug.lua

ImguiBoonsDebug = class(ImguiBoonsDebug)

local SHOULD_RELOAD = true

ImguiBoonsDebug.init = function (self)
	self._selected_boon_id = 1
	self._filter_text = ""
	self._boon_list = {}
	self._filtered_boon_list = {}

	self:_get_boons()

	self._filtered_boon_list = self:_apply_boon_filter(self._filter_text, self._boon_list)
end

ImguiBoonsDebug._get_boons = function (self)
	table.clear(self._boon_list)

	for name, template in pairs(DeusPowerUpTemplates) do
		table.insert(self._boon_list, name)
	end

	table.sort(self._boon_list)
end

ImguiBoonsDebug._apply_boon_filter = function (self, filter_text, boon_list)
	if filter_text == "" then
		return boon_list
	end

	local filtered_list = {}
	local search_string = string.gsub(filter_text, "[_ ]", "")

	for i = 1, #boon_list do
		local boon = boon_list[i]
		local search_boon_name = string.gsub(boon, "[_ ]", "")

		if search_boon_name:find(search_string, 1, true) then
			table.insert(filtered_list, boon)
		end
	end

	return filtered_list
end

ImguiBoonsDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end
end

ImguiBoonsDebug.on_round_start = function (self)
	return
end

ImguiBoonsDebug.is_persistent = function (self)
	return true
end

ImguiBoonsDebug.draw = function (self, is_open)
	local do_close = Imgui.begin_window("Boons Debug", "always_auto_resize")

	self:_update_controls()
	Imgui.end_window()

	return do_close
end

ImguiBoonsDebug._update_controls = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()

	if mechanism_name ~= "deus" then
		Imgui.text("This UI only works when playing with the deus mechanism.")

		return
	end

	self._selected_boon_id, self._filtered_boon_list, self._filter_text = ImguiX.combo_search(self._selected_boon_id, self._filtered_boon_list, self._filter_text, self._boon_list)

	if Imgui.button("Add", 100, 20) then
		local local_player = Managers.player and Managers.player:local_player()

		if not local_player then
			return
		end

		local power_up_name = self._filtered_boon_list[self._selected_boon_id]

		if not power_up_name then
			return
		end

		local power_up_rarity

		for rarity, boon_definitions in pairs(DeusPowerUpRarityPool) do
			for i = 1, #boon_definitions do
				if boon_definitions[i][1] == power_up_name then
					power_up_rarity = rarity

					break
				end
			end

			if power_up_rarity then
				break
			end
		end

		if not power_up_rarity then
			return
		end

		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, power_up_rarity)
		local local_player_id = local_player:local_player_id()

		deus_run_controller:add_power_ups({
			power_up,
		}, local_player_id, true)
	end
end
