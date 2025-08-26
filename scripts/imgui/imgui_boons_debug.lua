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

	local aliases = self:_fetch_aliases(self._boon_list)

	self._selected_boon_id, self._filtered_boon_list, self._filter_text = ImguiX.combo_search(self._selected_boon_id, self._filtered_boon_list, self._filter_text, self._boon_list, aliases)

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

ImguiBoonsDebug._fetch_aliases = function (self, boons)
	local name_aliases = {}
	local description_aliases = {}
	local talent_tree, profile_name
	local local_player = Managers.player:local_player()

	if local_player then
		local profile_index = local_player:profile_index()
		local career_index = local_player:career_index()

		if (profile_index or 0) * (career_index or 0) > 0 then
			profile_name = SPProfiles[profile_index].display_name
			talent_tree = TalentTrees[profile_name][career_index]
		end
	end

	for i, boon_name in ipairs(boons) do
		local boon = DeusPowerUpTemplates[boon_name]

		if talent_tree and string.gmatch(boon_name, "%a+_%d+_%d+")() then
			local talent_parts = string.split(boon_name, "_")
			local talent_row = tonumber(talent_parts[2])
			local talent_col = tonumber(talent_parts[3])
			local talent_name = talent_tree[talent_row][talent_col]
			local talent = TalentUtils.get_talent(profile_name, talent_name)

			name_aliases[i] = talent.display_name and Localize(talent.display_name) or Localize(talent.name)
			description_aliases[i] = UIUtils.get_talent_description(talent)
		else
			name_aliases[i] = boon.display_name and Localize(boon.display_name) or ""
			description_aliases[i] = boon.advanced_description and UIUtils.get_trait_description(nil, boon) or ""
		end
	end

	return {
		name_aliases,
		description_aliases,
	}
end
