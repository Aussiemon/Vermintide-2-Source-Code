-- chunkname: @scripts/entity_system/systems/deus_chest/deus_chest_preload_system.lua

require("scripts/network/shared_state")

DeusChestPreloadSystem = class(DeusChestPreloadSystem, ExtensionSystemBase)

local function is_preload_list_equal(t1, t2)
	local t1_size = 0

	for k1, v1 in pairs(t1) do
		if t2[k1] ~= v1 then
			return false
		end

		t1_size = t1_size + 1
	end

	local t2_size = 0

	for k2, v2 in pairs(t2) do
		if t1[k2] ~= v2 then
			return false
		end

		t2_size = t2_size + 1
	end

	return t1_size == t2_size
end

local function encode_preload_packages(preload_packages)
	local encoded_preload_packages = {}
	local inventory_packages_lut = NetworkLookup.inventory_packages

	for package_name, _ in pairs(preload_packages) do
		local network_package_id = inventory_packages_lut[package_name]

		assert(network_package_id, "No existing inventory package for attempted name %q", package_name)

		encoded_preload_packages[#encoded_preload_packages + 1] = network_package_id
	end

	local json = cjson.encode(encoded_preload_packages)

	return json
end

local function decode_encode_preload_packages(json)
	local encoded_preload_packages = cjson.decode(json)
	local preload_packages = {}
	local inventory_packages_lut = NetworkLookup.inventory_packages

	for _, network_package_id in ipairs(encoded_preload_packages) do
		local package_name = inventory_packages_lut[network_package_id]

		preload_packages[package_name] = true
	end

	return preload_packages
end

local shared_state_spec = {
	server = {},
	peer = {
		preload_packages = {
			type = "table",
			default_value = {},
			composite_keys = {
				local_player_id = true,
			},
			encode = encode_preload_packages,
			decode = decode_encode_preload_packages,
		},
	},
}

SharedState.validate_spec(shared_state_spec)

local PACKAGE_MANAGER_REFERENCE_NAME = "DeusChestPreloadSystem"
local DEUS_CHEST_PRELOAD_AMOUNT = 1
local DEUS_CHEST_CHECK_RANGE = 50
local UPDATE_FREQUENCY = 5
local DEUS_CHEST_FETCH_RESULTS = {}

DeusChestPreloadSystem.init = function (self, context, system_name, extensions)
	DeusChestPreloadSystem.super.init(self, context, system_name, extensions)

	self._deus_chest_to_extension = {}
	self._broadphase = Broadphase(255, 30)
	self._broadphase_ids = {}
	self._loaded_or_loading_packages = {}
	self._player_manager = Managers.player
	self._package_manager = Managers.package

	local is_server = context.is_server
	local network_server = Managers.mechanism:network_handler()
	local server_peer_id = network_server.server_peer_id
	local own_peer_id = Network.peer_id()

	self._shared_state = SharedState:new("deus_chest_preload", shared_state_spec, is_server, network_server, server_peer_id, own_peer_id)

	local network_event_delegate = context.network_event_delegate

	self._shared_state:register_rpcs(network_event_delegate)
	self:_setup_weapon_preload_settings()
end

DeusChestPreloadSystem._setup_weapon_preload_settings = function (self)
	local success = false
	local platform_type
	local deus_weapon_preload_settings = Managers.backend:get_deus_weapon_preload_settings()

	if IS_XB1 then
		platform_type = XboxOne.console_type_string()

		local settings = deus_weapon_preload_settings[platform_type]
		local default_settings = deus_weapon_preload_settings.default

		if settings then
			print(string.format("[DeusChestPreloadSystem] Loading weapon preload settings for platform: %q", platform_type))
			table.dump(settings, "WEAPON_PRELOAD_SETTINGS", 2)

			self._deus_chest_preload_amount = settings.deus_chest_preload_amount
			self._deus_chest_check_range = settings.deus_chest_check_range
			self._deus_chest_update_frequency = settings.deus_chest_update_frequency
			success = true
		elseif default_settings then
			print(string.format("[DeusChestPreloadSystem] Failed getting weapon preload settings for platform: %q --> using default settings for %q", platform_type, PLATFORM))
			table.dump(default_settings, "WEAPON_PRELOAD_SETTINGS", 2)

			self._deus_chest_preload_amount = default_settings.deus_chest_preload_amount
			self._deus_chest_check_range = default_settings.deus_chest_check_range
			self._deus_chest_update_frequency = default_settings.deus_chest_update_frequency
			success = true
		end
	elseif IS_PS4 then
		local platform_type = "ps4"

		if PS4.is_ps5() then
			platform_type = "ps5"
		elseif PS4.is_pro() then
			platform_type = "ps4_pro"
		end

		local settings = deus_weapon_preload_settings[platform_type]
		local default_settings = deus_weapon_preload_settings.default

		if settings then
			print(string.format("[DeusChestPreloadSystem] Loading weapon preload settings for platform: %q", platform_type))
			table.dump(settings, "WEAPON_PRELOAD_SETTINGS", 2)

			self._deus_chest_preload_amount = settings.deus_chest_preload_amount
			self._deus_chest_check_range = settings.deus_chest_check_range
			self._deus_chest_update_frequency = settings.deus_chest_update_frequency
			success = true
		elseif default_settings then
			print(string.format("[DeusChestPreloadSystem] Failed getting weapon preload settings for platform: %q --> using default settings for %q", platform_type, PLATFORM))
			table.dump(default_settings, "WEAPON_PRELOAD_SETTINGS", 2)

			self._deus_chest_preload_amount = default_settings.deus_chest_preload_amount
			self._deus_chest_check_range = default_settings.deus_chest_check_range
			self._deus_chest_update_frequency = default_settings.deus_chest_update_frequency
			success = true
		end
	elseif deus_weapon_preload_settings then
		local settings = deus_weapon_preload_settings.default

		if settings then
			print(string.format("[DeusChestPreloadSystem] Loading weapon preload settings for platform: %q", PLATFORM))
			table.dump(settings, "WEAPON_PRELOAD_SETTINGS", 2)

			self._deus_chest_preload_amount = settings.deus_chest_preload_amount
			self._deus_chest_check_range = settings.deus_chest_check_range
			self._deus_chest_update_frequency = settings.deus_chest_update_frequency
		end
	end

	if not success then
		print(string.format("[DeusChestPreloadSystem] Couldn't find settings for platform: %q --> Using fallback settings", PLATFORM))

		self._deus_chest_preload_amount = DEUS_CHEST_PRELOAD_AMOUNT
		self._deus_chest_check_range = DEUS_CHEST_CHECK_RANGE
		self._deus_chest_update_frequency = UPDATE_FREQUENCY
	end

	fassert(self._deus_chest_preload_amount, "[DeusChestPreloadSystem] Missing weapon preload settings for chest_preload_amount")
	fassert(self._deus_chest_check_range, "[DeusChestPreloadSystem] Missing weapon preload settings for chest_range_check")
	fassert(self._deus_chest_update_frequency, "[DeusChestPreloadSystem] Missing weapon preload settings for chest_update_frequency")
end

DeusChestPreloadSystem.destroy = function (self)
	self._shared_state:unregister_rpcs()

	local loaded_or_loading_packages = self._loaded_or_loading_packages
	local package_manager = self._package_manager

	for package_name, _ in pairs(loaded_or_loading_packages) do
		package_manager:unload(package_name, PACKAGE_MANAGER_REFERENCE_NAME)
	end
end

local missing_packages = {}
local all_needed_packages = {}
local packages_to_remove = {}

DeusChestPreloadSystem.update = function (self, context, t)
	if self._deus_chest_preload_amount == 0 then
		return
	end

	self._timer = self._timer or t + self._deus_chest_update_frequency

	if t <= self._timer then
		return
	end

	local local_player = Managers.player:local_player()
	local local_player_unit = local_player and local_player.player_unit

	if not ALIVE[local_player_unit] then
		return
	end

	local own_preload_packages = self:get_player_preload_packages(local_player)

	if not own_preload_packages then
		return
	end

	DeusChestPreloadSystem.super.update(self, context, t)
	table.clear(all_needed_packages)

	local local_player_position = POSITION_LOOKUP[local_player_unit]
	local num_deus_chests = Broadphase.query(self._broadphase, local_player_position, self._deus_chest_check_range, DEUS_CHEST_FETCH_RESULTS)

	num_deus_chests = math.min(num_deus_chests, self._deus_chest_preload_amount)

	local deus_chest_to_extension = self._deus_chest_to_extension

	for i = 1, num_deus_chests do
		local deus_chest_unit = DEUS_CHEST_FETCH_RESULTS[i]
		local preload_extension = deus_chest_to_extension[deus_chest_unit]
		local preload_packages = preload_extension:get_weapon_preload_packages()

		for _, needed_package in ipairs(preload_packages) do
			all_needed_packages[needed_package] = true
		end
	end

	local own_preload_packages_changed = not is_preload_list_equal(all_needed_packages, own_preload_packages)

	if own_preload_packages_changed then
		self:set_player_preload_packages(local_player, all_needed_packages)
	end

	table.clear(all_needed_packages)
	table.clear(missing_packages)
	table.clear(packages_to_remove)

	local package_manager = self._package_manager
	local human_players = self._player_manager:human_players()

	for _, player in pairs(human_players) do
		local preload_packages = self:get_player_preload_packages(player)

		for needed_package, _ in pairs(preload_packages) do
			all_needed_packages[needed_package] = true
		end

		for needed_package, _ in pairs(preload_packages) do
			if not package_manager:has_loaded(needed_package, PACKAGE_MANAGER_REFERENCE_NAME) then
				missing_packages[needed_package] = true
			end
		end
	end

	local loaded_or_loading_packages = self._loaded_or_loading_packages

	for missing_package, _ in pairs(missing_packages) do
		if not package_manager:is_loading(missing_package) then
			local async = true

			loaded_or_loading_packages[missing_package] = true

			package_manager:load(missing_package, PACKAGE_MANAGER_REFERENCE_NAME, nil, async)
		end
	end

	for package, _ in pairs(loaded_or_loading_packages) do
		packages_to_remove[package] = true
	end

	for needed_package, _ in pairs(all_needed_packages) do
		packages_to_remove[needed_package] = nil
	end

	for package_to_remove, _ in pairs(packages_to_remove) do
		if package_manager:can_unload(package_to_remove) then
			package_manager:unload(package_to_remove, PACKAGE_MANAGER_REFERENCE_NAME)

			loaded_or_loading_packages[package_to_remove] = nil
		end
	end

	self._timer = t + self._deus_chest_update_frequency
end

DeusChestPreloadSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	local extension = DeusChestPreloadSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	local position = POSITION_LOOKUP[unit]
	local id = Broadphase.add(self._broadphase, unit, position, 0.1)

	self._broadphase_ids[unit] = id
	self._deus_chest_to_extension[unit] = extension

	return extension
end

DeusChestPreloadSystem.on_remove_extension = function (self, unit, extension_name, ...)
	local ids = self._broadphase_ids
	local id = ids[unit]

	Broadphase.remove(self._broadphase, id)

	ids[unit] = nil
	self._deus_chest_to_extension[unit] = nil

	return DeusChestPreloadSystem.super.on_remove_extension(self, unit, extension_name, ...)
end

DeusChestPreloadSystem.get_player_preload_packages = function (self, player)
	local peer_id = player.peer_id
	local local_player_id = player:local_player_id()

	if peer_id and local_player_id then
		local key = self._shared_state:get_key("preload_packages", nil, local_player_id)

		return self._shared_state:get_peer(peer_id, key)
	else
		return nil
	end
end

DeusChestPreloadSystem.set_player_preload_packages = function (self, player, preload_packages)
	local peer_id = player.peer_id
	local local_player_id = player:local_player_id()
	local key = self._shared_state:get_key("preload_packages", nil, local_player_id)

	self._shared_state:set_peer(peer_id, key, table.clone(preload_packages))
end
