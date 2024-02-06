-- chunkname: @scripts/game_state/components/transient_package_loader.lua

TransientPackageLoader = class(TransientPackageLoader)

local UNLOAD_GRACE_PERIOD = 60
local Unit_get_data = Unit.get_data

local function clear_all_refs(t)
	table.clear(t.units)
	table.clear(t.refs)
end

local function add_ref(unit, value, t)
	t.units[unit] = value
	t.refs[value] = (t.refs[value] or 0) + 1
end

local function remove_ref(unit, t)
	local value = t.units[unit]

	if value then
		t.units[unit] = nil

		local t_refs = t.refs

		if t_refs[value] <= 1 then
			t_refs[value] = nil
		else
			t_refs[value] = t_refs[value] - 1
		end
	end
end

TransientPackageLoader.init = function (self)
	self._unload_package_queue = {}
	self._load_package_queue = {}
	self._tracked_projectiles = {
		units = {},
		refs = {},
	}
	self._tracked_units = {
		units = {},
		refs = {},
	}
end

local rpcs = {
	"rpc_sync_transient_projectile_packages",
	"rpc_sync_transient_unit_packages",
	"rpc_sync_transient_ready",
}

TransientPackageLoader.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
end

TransientPackageLoader.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

TransientPackageLoader.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	printf("[TransientPackageLoader] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._sync_ready = server_peer_id == own_peer_id
	self._loaded = server_peer_id == own_peer_id
	self._loading_started = self._loaded
	self._should_unload_packages_t = nil
	self._last_package_checked = nil
end

TransientPackageLoader.network_context_destroyed = function (self)
	print("[TransientPackageLoader] network_context_destroyed")

	self._should_unload_packages_t = nil
	self._last_package_checked = nil

	clear_all_refs(self._tracked_projectiles)
	clear_all_refs(self._tracked_units)
end

TransientPackageLoader.update = function (self)
	if self._should_unload_packages_t and self._should_unload_packages_t < Managers.time:time("game") then
		local unload_queue = self._unload_package_queue
		local package_manager = Managers.package
		local package_name = next(unload_queue, self._last_package_checked)

		self._last_package_checked = package_name

		if package_name and (package_manager:num_references(package_name) > 1 or package_manager:can_unload(package_name)) then
			Managers.package:unload(package_name, "TransientPackageLoader")

			unload_queue[package_name] = nil
		end

		if package_name == nil and next(unload_queue) == nil then
			self._should_unload_packages_t = nil
			self._last_package_checked = nil
		end
	elseif not self._loaded and self._sync_ready then
		local package_manager = Managers.package

		if self._loading_started then
			for name in pairs(self._load_package_queue) do
				if not package_manager:has_loaded(name) then
					return false
				else
					self._unload_package_queue[name] = self._load_package_queue[name]
					self._load_package_queue[name] = nil
				end
			end

			self._loaded = true
		else
			for package_name in pairs(self._load_package_queue) do
				Managers.package:load(package_name, "TransientPackageLoader", nil, true)
			end

			self._loading_started = true
		end
	end
end

TransientPackageLoader.signal_in_game = function (self)
	self._should_unload_packages_t = Managers.time:time("game") + UNLOAD_GRACE_PERIOD
end

TransientPackageLoader.unload_all_packages = function (self)
	for package_name in pairs(self._load_package_queue) do
		Managers.package:unload(package_name, "TransientPackageLoader")
	end

	for package_name in pairs(self._unload_package_queue) do
		Managers.package:unload(package_name, "TransientPackageLoader")
	end

	table.clear(self._load_package_queue)
	table.clear(self._unload_package_queue)
	clear_all_refs(self._tracked_projectiles)
	clear_all_refs(self._tracked_units)

	self._last_package_checked = nil
	self._should_unload_packages_t = nil
end

TransientPackageLoader.loading_completed = function (self)
	return self._loaded
end

TransientPackageLoader.add_projectile = function (self, unit)
	local unit_name = Unit_get_data(unit, "unit_name")
	local projectile_units_template = ProjectileUnitsFromUnitName[unit_name]
	local template = ProjectileUnits[projectile_units_template]

	if template and not template.transient_package_loader_ignore then
		add_ref(unit, projectile_units_template, self._tracked_projectiles)
	end
end

TransientPackageLoader.add_unit = function (self, unit, unit_name)
	add_ref(unit, unit_name or Unit_get_data(unit, "unit_name"), self._tracked_units)
end

TransientPackageLoader.remove_projectile = function (self, unit)
	remove_ref(unit, self._tracked_projectiles)
end

TransientPackageLoader.remove_unit = function (self, unit)
	remove_ref(unit, self._tracked_units)
end

TransientPackageLoader.hot_join_sync = function (self, peer_id)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]
	local ids_to_sync = {}
	local ids_to_sync_n = 0

	do
		local tracked_projectile_refs = self._tracked_projectiles.refs

		table.clear(ids_to_sync)

		ids_to_sync_n = 0

		for name in pairs(tracked_projectile_refs) do
			ids_to_sync_n = ids_to_sync_n + 1
			ids_to_sync[ids_to_sync_n] = NetworkLookup.projectile_units[name]
		end

		if ids_to_sync_n > 0 then
			RPC.rpc_sync_transient_projectile_packages(channel_id, ids_to_sync)
		end
	end

	do
		local tracked_units_refs = self._tracked_units.refs

		table.clear(ids_to_sync)

		ids_to_sync_n = 0

		for name in pairs(tracked_units_refs) do
			ids_to_sync_n = ids_to_sync_n + 1
			ids_to_sync[ids_to_sync_n] = NetworkLookup.husks[name]
		end

		if ids_to_sync_n > 0 then
			RPC.rpc_sync_transient_unit_packages(channel_id, ids_to_sync)
		end
	end

	RPC.rpc_sync_transient_ready(channel_id)
end

TransientPackageLoader.rpc_sync_transient_projectile_packages = function (self, channel_id, projectile_unit_ids)
	local packages = self._load_package_queue

	for unit_id_idx = 1, #projectile_unit_ids do
		local template_id = projectile_unit_ids[unit_id_idx]
		local projectile_unit_template_name = NetworkLookup.projectile_units[template_id]
		local projectile_units = ProjectileUnits[projectile_unit_template_name]

		if projectile_units.projectile_unit_name then
			packages[projectile_units.projectile_unit_name] = true
		end

		if projectile_units.dummy_linker_unit_name then
			packages[projectile_units.dummy_linker_unit_name] = true
		end

		local dummy_linker_broken_units = projectile_units.dummy_linker_broken_units

		if dummy_linker_broken_units then
			for broken_unit_package_idx = 1, #dummy_linker_broken_units do
				packages[dummy_linker_broken_units[broken_unit_package_idx]] = true
			end
		end
	end
end

TransientPackageLoader.rpc_sync_transient_unit_packages = function (self, channel_id, husk_unit_name_ids)
	local packages = self._load_package_queue

	for i = 1, #husk_unit_name_ids do
		local husk_unit_name_id = husk_unit_name_ids[i]
		local package_name = NetworkLookup.husks[husk_unit_name_id]

		packages[package_name] = true
	end
end

TransientPackageLoader.rpc_sync_transient_ready = function (self, channel_id)
	self._sync_ready = true
end
