ImguiDeusWeapons = class(ImguiDeusWeapons)
local rarities = {
	"plentiful",
	"common",
	"rare",
	"exotic",
	"unique"
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}

local function render_weapon_group_selection(available_weapon_groups, current_weapon_group_index, available_rarities, current_rarity_index, available_difficulties, current_difficulty_index, current_run_progress)
	current_weapon_group_index = Imgui.Combo("Select weapon group", current_weapon_group_index - 1, available_weapon_groups)
	current_rarity_index = Imgui.Combo("Select rarity", current_rarity_index - 1, available_rarities)
	current_difficulty_index = Imgui.Combo("Select difficulty (affects powerlevel)", current_difficulty_index - 1, available_difficulties)
	current_run_progress = Imgui.SliderFloat("Run progress (affects powerlevel)", current_run_progress, 0, 0.999)

	return current_weapon_group_index, current_rarity_index, current_difficulty_index, current_run_progress
end

local function equip_weapon(weapon, career_name)
	local player_manager = Managers.player
	local player = player_manager:local_player()
	local player_unit = player.player_unit
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local resyncing_loadout = inventory_extension:resyncing_loadout()

	if resyncing_loadout then
		return false
	end

	local deus_backend = Managers.backend:get_interface("deus")

	deus_backend:grant_deus_weapon(weapon)
	deus_backend:refresh_deus_weapons_in_items_backend()

	local backend_id = weapon.backend_id
	local slot_type = weapon.data.slot_type
	local slot_name = nil
	local slots = InventorySettings.slots_by_slot_index

	for _, slot in pairs(slots) do
		if slot_type == slot.type then
			slot_name = slot.name
		end
	end

	BackendUtils.set_loadout_item(backend_id, career_name, slot_name)
	inventory_extension:create_equipment_in_slot(slot_name, backend_id)
end

local function render_weapon(weapon)
	local inventory_icon, display_name, description, store_icon = UIUtils.get_ui_information_from_item(weapon)
	local rarity_color = Colors.get_table(weapon.rarity)

	Imgui.TextColored(" === " .. Localize(display_name) .. " === ", rarity_color[2], rarity_color[3], rarity_color[4], rarity_color[1])
	Imgui.Spacing()
	Imgui.Text("type: " .. Localize(weapon.data.item_type))
	Imgui.Text("slot: " .. weapon.data.slot_type)
	Imgui.Text("rarity: " .. weapon.rarity)

	local power_level_text = "power_level: " .. weapon.power_level

	Imgui.Text("power_level: " .. weapon.power_level)

	if weapon.traits then
		Imgui.Text("traits:")

		for _, trait in ipairs(weapon.traits) do
			Imgui.Text("  - " .. trait)
		end
	end

	if weapon.properties then
		Imgui.Text("props:")

		for prop, val in pairs(weapon.properties) do
			Imgui.Text("  - " .. prop .. ": " .. val)
		end
	end

	if weapon.skin then
		Imgui.Text("skin: " .. weapon.skin)
	end
end

local function render_property_setting(property_names, rarity, property_settings)
	for _, property_key in ipairs(property_names) do
		if not property_settings[property_key] then
			property_settings[property_key] = 0.75
		end

		if rarity == "unique" then
			property_settings[property_key] = 1
		else
			local value = Imgui.SliderFloat("Set Property " .. property_key .. " power", property_settings[property_key], 0, 1)
			property_settings[property_key] = math.round_with_precision(value, 3)
		end
	end

	return property_settings
end

ImguiDeusWeapons.init = function (self)
	return
end

ImguiDeusWeapons.update = function (self)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local profile_index = player:profile_index()
	local career_index = player:career_index()

	if not career_index then
		return
	end

	if self._career_index ~= career_index or self._profile_index ~= profile_index then
		local hero_data = SPProfiles[profile_index]
		local career_data = hero_data.careers[career_index]
		local career_name = career_data.name
		self._available_weapon_groups = {}

		for group_key, _ in pairs(DeusWeaponGroups) do
			local group = DeusWeaponGroups[group_key]

			if group and table.contains(group.can_wield, career_name) then
				self._available_weapon_groups[#self._available_weapon_groups + 1] = group_key
			end
		end

		self._career_index = career_index
		self._profile_index = profile_index
		self._career_name = career_name

		self:_reset_base_weapon_selection_data()
	end
end

ImguiDeusWeapons.is_persistent = function (self)
	return false
end

ImguiDeusWeapons.draw = function (self, is_open)
	if not Managers.state or not Managers.state.game_mode or Managers.state.game_mode:game_mode_key() ~= "deus" then
		Imgui.Begin("DeusWeapons", "always_auto_resize")
		Imgui.Text("This UI only works when playing a deus level.")
		Imgui.End()

		return
	end

	Imgui.Begin("DeusWeapons", "always_auto_resize")
	Imgui.Spacing()
	Imgui.Text("Select Weapon Group:")

	self._selected_weapon_group_index, self._selected_rarity_index, self._difficulty_index, self._run_progress = render_weapon_group_selection(self._available_weapon_groups, self._selected_weapon_group_index, rarities, self._selected_rarity_index, difficulties, self._difficulty_index, self._run_progress)
	local group = DeusWeaponGroups[self._available_weapon_groups[self._selected_weapon_group_index]]
	local difficulty = difficulties[self._difficulty_index]
	local rarity = rarities[self._selected_rarity_index]
	local items_for_rarity = group.items_per_rarity[rarity]

	if not items_for_rarity or #items_for_rarity <= 0 or not items_for_rarity then
		local available_items = {
			group.default
		}
	end

	Imgui.Spacing()
	Imgui.Text("Select Item From Group:")

	self._selected_item_key_index = Imgui.Combo("Select item key", self._selected_item_key_index - 1, available_items)
	local item_key = available_items[self._selected_item_key_index]

	if self._prev_item_key ~= item_key or self._prev_difficulty_index ~= self._difficulty_index or self._prev_rarity ~= rarity or self._prev_run_progress ~= self._run_progress then
		self:_reset_weapon_setting_data(item_key, difficulty, self._run_progress, rarity)

		self._prev_item_key = item_key
		self._prev_difficulty_index = self._difficulty_index
		self._prev_rarity = rarity
		self._prev_run_progress = self._run_progress
	end

	local archetypes_available = self._available_archetypes and #self._available_archetypes > 0
	local properties_available = self._available_property_combinations and #self._available_property_combinations > 0
	local traits_available = self._available_trait_combinations and #self._available_trait_combinations > 0
	local skins_available = self._available_skins and #self._available_skins > 0

	if archetypes_available or properties_available or traits_available or skins_available then
		Imgui.Spacing()
		Imgui.Text("Select Properties, Traits and/or Skins:")
	end

	if archetypes_available then
		self._selected_archetype_index = Imgui.Combo("Select archetype", self._selected_archetype_index - 1, self._available_archetypes)
		local archetype = DeusWeaponArchetypes[self._available_archetypes[self._selected_archetype_index]]
		self._properties = archetype.properties
		self._traits = archetype.traits
	end

	if properties_available then
		self._selected_property_index = Imgui.Combo("Select property combination", self._selected_property_index - 1, self._available_property_combinations_string)

		if self._prev_selected_property_index ~= self._selected_property_index then
			self._properties = {}
		end

		self._prev_selected_property_index = self._selected_property_index
		local properties_to_apply = self._available_property_combinations[self._selected_property_index]
		self._properties = render_property_setting(properties_to_apply, rarity, self._properties)
	end

	if traits_available then
		self._selected_trait_index = Imgui.Combo("Select trait", self._selected_trait_index - 1, self._available_trait_combinations_string)
		self._traits = self._available_trait_combinations[self._selected_trait_index]
	end

	if skins_available then
		self._selected_skin_index = Imgui.Combo("Select skin", self._selected_skin_index - 1, self._available_skins)
		self._skin = self._available_skins[self._selected_skin_index]
	end

	Imgui.Spacing()

	local generate = not self._weapon
	generate = generate or self._weapon.deus_item_key ~= item_key

	for prop, val in pairs(self._properties) do
		generate = generate or self._weapon.properties[prop] ~= self._properties[prop]
	end

	generate = generate or not table.compare(self._weapon.traits, self._traits)
	generate = generate or self._weapon.skin ~= self._skin
	generate = generate or self._weapon.rarity ~= rarity
	generate = generate or self._weapon.power_level ~= self._powerlevel

	if generate then
		self._weapon = deus_create_weapon(item_key, self._properties and table.clone(self._properties), self._traits and table.clone(self._traits), self._skin, self._powerlevel, rarity)
	end

	if self._weapon then
		Imgui.Text("Weapon:")
		render_weapon(self._weapon)
	end

	Imgui.Spacing()

	if self._weapon and Imgui.Button("Equip") then
		equip_weapon(self._weapon, self._career_name)

		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()

		deus_run_controller:save_loadout(self._weapon)
	end

	Imgui.End()
end

ImguiDeusWeapons._reset_base_weapon_selection_data = function (self)
	self._selected_weapon_group_index = 1
	self._selected_rarity_index = 1
	self._selected_item_key_index = 1
	self._difficulty_index = 1
	self._run_progress = 0
	self._weapon = nil
end

ImguiDeusWeapons._reset_weapon_setting_data = function (self, item_key, difficulty, run_progress, rarity)
	self._powerlevel, self._available_archetypes, self._available_property_combinations, self._available_trait_combinations, self._available_skins = deus_get_possibilities_for_item_key(item_key, difficulty, run_progress, rarity)
	self._run_progress = run_progress
	self._available_property_combinations_string = {}

	if self._available_property_combinations then
		for _, property_combination in ipairs(self._available_property_combinations) do
			self._available_property_combinations_string[#self._available_property_combinations_string + 1] = table.concat(property_combination, ", ")
		end
	end

	self._available_trait_combinations_string = {}

	if self._available_trait_combinations then
		for _, trait_combination in ipairs(self._available_trait_combinations) do
			self._available_trait_combinations_string[#self._available_trait_combinations_string + 1] = table.concat(trait_combination, ", ")
		end
	end

	self._selected_archetype_index = 1
	self._selected_property_index = 1
	self._selected_trait_index = 1
	self._selected_skin_index = 1
	self._properties = {}
	self._traits = {}
	self._skin = nil
end

return
