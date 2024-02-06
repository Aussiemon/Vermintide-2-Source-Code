-- chunkname: @scripts/unit_extensions/deus/deus_chest_preload_extension.lua

DeusChestPreloadExtension = class(DeusChestPreloadExtension)

local REAL_PLAYER_LOCAL_ID = 1
local package_exclusion_list = {
	["units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_3p"] = true,
	["units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_magic_3p"] = true,
	["units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_runed_3p"] = true,
	["units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_3p"] = true,
	["units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_3p"] = true,
	["units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_3p"] = true,
}

local function get_weapon_packages(stored_purchase, career_name)
	local item_data = stored_purchase.data
	local backend_id = stored_purchase.backend_id
	local skin = stored_purchase.skin
	local item_template = BackendUtils.get_item_template(item_data, backend_id)
	local item_units = BackendUtils.get_item_units(item_data, backend_id, skin, career_name)
	local packages = WeaponUtils.get_weapon_packages(item_template, item_units, false)
	local filtered_packages = {}

	for i = 1, #packages do
		local package = packages[i]

		if not package_exclusion_list[package] then
			filtered_packages[#filtered_packages + 1] = package
		end
	end

	return filtered_packages
end

DeusChestPreloadExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local pickup_extension = ScriptUnit.has_extension(unit, "pickup_system")

	fassert(pickup_extension, "DeusChestPreloadExtension requires unit to also have DeusChestExtension")

	self._pickup_extension = pickup_extension
	self._weapon_preload_packages = {}
end

DeusChestPreloadExtension.extensions_ready = function (self, world, unit)
	local mechanism = Managers.mechanism:game_mechanism()

	self._deus_run_controller = mechanism:get_deus_run_controller()

	fassert(self._deus_run_controller, "deus pickup unit can only be used in a deus run")
end

DeusChestPreloadExtension.update = function (self, unit, input, dt, context, t)
	local go_id = self._go_id or Managers.state.unit_storage:go_id(unit)
	local deus_run_controller = self._deus_run_controller
	local own_peer_id = deus_run_controller:get_own_peer_id()
	local profile_index, career_index = deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local player_changed = profile_index ~= self._profile_index or career_index ~= self._career_index
	local server_chest_type = self:_get_server_chest_type(unit)

	if go_id and server_chest_type then
		local is_weapon_chest = server_chest_type == DEUS_CHEST_TYPES.swap_ranged or server_chest_type == DEUS_CHEST_TYPES.swap_melee

		if player_changed and is_weapon_chest then
			local profile = SPProfiles[profile_index]
			local career = profile.careers[career_index]
			local career_name = career.name

			self:_generate_stored_weapon_packages(career_name)
		end

		if server_chest_type == DEUS_CHEST_TYPES.upgrade then
			self:_generate_upgraded_weapon_packages()
		end

		self._profile_index = profile_index
		self._career_index = career_index
		self._go_id = go_id
		self._chest_type = server_chest_type
	end
end

DeusChestPreloadExtension.get_weapon_preload_packages = function (self)
	return self._weapon_preload_packages
end

DeusChestPreloadExtension.get_chest_type = function (self)
	return self._chest_type
end

DeusChestPreloadExtension._generate_stored_weapon_packages = function (self, career_name)
	table.clear(self._weapon_preload_packages)

	local stored_purchase = self._pickup_extension:get_stored_purchase()
	local preload_packages = get_weapon_packages(stored_purchase, career_name)

	table.append(self._weapon_preload_packages, preload_packages)
end

DeusChestPreloadExtension._generate_upgraded_weapon_packages = function (self)
	local deus_run_controller = self._deus_run_controller
	local melee_weapon, ranged_weapon = deus_run_controller:get_own_loadout()
	local own_peer_id = deus_run_controller:get_own_peer_id()
	local profile_index, career_index = deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local melee_weapon_changed = melee_weapon ~= self._previous_melee_weapon
	local ranged_weapon_changed = ranged_weapon ~= self._previous_ranged_weapon
	local rarity = self._pickup_extension:get_rarity()

	if melee_weapon_changed then
		self._stored_melee_upgrade = self:_generate_upgraded_weapon(melee_weapon, rarity, self._go_id, profile_index, career_index)
		self._previous_melee_weapon = melee_weapon
	end

	if ranged_weapon_changed then
		self._stored_ranged_upgrade = self:_generate_upgraded_weapon(ranged_weapon, rarity, self._go_id, profile_index, career_index)
		self._previous_ranged_weapon = ranged_weapon
	end

	if melee_weapon_changed or ranged_weapon_changed then
		local weapon_preload_packages = self._weapon_preload_packages

		table.clear(weapon_preload_packages)
		table.append(weapon_preload_packages, get_weapon_packages(self._stored_melee_upgrade))
		table.append(weapon_preload_packages, get_weapon_packages(self._stored_ranged_upgrade))
	end
end

DeusChestPreloadExtension._generate_upgraded_weapon = function (self, weapon, rarity, go_id, profile_index, career_index)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller:get_current_node()
	local progress = current_node.run_progress
	local difficulty = deus_run_controller:get_run_difficulty()
	local weapon_seed = HashUtils.fnv32_hash(string.format("%s_%s_%s_%s_%s", profile_index, career_index, current_node.weapon_pickup_seed, go_id, 1))
	local new_weapon = DeusWeaponGeneration.upgrade_item(weapon, difficulty, progress, rarity, weapon_seed)

	return new_weapon
end

DeusChestPreloadExtension._get_server_chest_type = function (self, unit)
	local game_session = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if not game_session or not go_id then
		return nil
	end

	local chest_lookup = GameSession.game_object_field(game_session, go_id, "server_chest_type")

	return chest_lookup ~= 0 and NetworkLookup.deus_chest_types[chest_lookup] or nil
end
