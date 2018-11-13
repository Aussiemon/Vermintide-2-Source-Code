require("scripts/unit_extensions/generic/generic_health_extension")
require("scripts/unit_extensions/generic/overpowered_blob_health_extension")
require("scripts/unit_extensions/generic/explosive_barrel_health_extension")
require("scripts/unit_extensions/generic/invincible_health_extension")
require("scripts/unit_extensions/generic/rat_ogre_health_extension")
require("scripts/unit_extensions/generic/chaos_troll_health_extension")
require("scripts/unit_extensions/generic/chaos_troll_husk_health_extension")
require("scripts/unit_extensions/generic/training_dummy_health_extension")
require("scripts/unit_extensions/default_player_unit/player_unit_health_extension")
require("scripts/unit_extensions/health/loot_rat_health_extension")
require("scripts/unit_extensions/health/lure_health_extension")

HealthSystem = class(HealthSystem, ExtensionSystemBase)
local script_data = script_data
local RPCS = {
	"rpc_add_damage",
	"rpc_add_damage_network",
	"rpc_damage_taken_overcharge",
	"rpc_heal",
	"rpc_remove_assist_shield",
	"rpc_request_heal",
	"rpc_suicide",
	"rpc_sync_damage_taken",
	"rpc_take_falling_damage",
	"rpc_request_revive"
}
local extensions = {
	"ChaosTrollHealthExtension",
	"ChaosTrollHuskHealthExtension",
	"ExplosiveBarrelHealthExtension",
	"GenericHealthExtension",
	"InvincibleHealthExtension",
	"LootRatHealthExtension",
	"PlayerUnitHealthExtension",
	"RatOgreHealthExtension",
	"LureHealthExtension",
	"OverpoweredBlobHealthExtension",
	"TrainingDummyHealthExtension"
}

HealthSystem.init = function (self, entity_system_creation_context, system_name)
	HealthSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.unit_extensions = {}
	self.frozen_unit_extensions = {}
	self.player_unit_extensions = {}
	self.updateable_unit_extensions = {}
	self.active_damage_buffer_index = 1
	self.extension_init_context.system_data = self
end

HealthSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

HealthSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, self.NAME, extension_init_data)
	self.unit_extensions[unit] = extension

	if extension_name == "PlayerUnitHealthExtension" then
		self.player_unit_extensions[unit] = extension
	end

	if extension.update then
		self.updateable_unit_extensions[unit] = extension
	end

	return extension
end

HealthSystem.on_remove_extension = function (self, unit, extension_name)
	fassert(ScriptUnit.has_extension(unit, self.NAME), "Trying to remove non-existing extension %q from unit %s", extension_name, unit)
	ScriptUnit.remove_extension(unit, self.NAME)

	self.unit_extensions[unit] = nil
	self.frozen_unit_extensions[unit] = nil
	self.player_unit_extensions[unit] = nil
	self.updateable_unit_extensions[unit] = nil
end

HealthSystem.freeze = function (self, unit, extension_name)
	fassert(self.frozen_unit_extensions[unit] == nil, "Tried to freeze an already frozen unit.")

	local extension = self.unit_extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")

	if extension.freeze then
		extension:freeze()
	end

	self.unit_extensions[unit] = nil
	self.frozen_unit_extensions[unit] = extension

	fassert(extension.unit, "Should this extension have a unit member?")
end

HealthSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extensions[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extensions[unit] = nil
	self.unit_extensions[unit] = extension

	if extension.unfreeze then
		extension:unfreeze()
	end
end

HealthSystem.hot_join_sync = function (self, sender)
	for unit, extension in pairs(self.unit_extensions) do
		if extension.hot_join_sync then
			extension:hot_join_sync(sender)
		end
	end
end

HealthSystem.update = function (self, context, t)
	self.active_damage_buffer_index = 3 - self.active_damage_buffer_index
	local active_damage_buffer_index = self.active_damage_buffer_index
	local pdArray_set_empty = pdArray.set_empty
	local player_unit_extensions = self.player_unit_extensions

	for unit, extension in pairs(self.unit_extensions) do
		local damage_queue = extension.damage_buffers[active_damage_buffer_index]

		pdArray_set_empty(damage_queue)

		extension._recent_damage_type = nil
		extension._recent_hit_react_type = nil
	end

	local dt = context.dt

	for unit, extension in pairs(self.updateable_unit_extensions) do
		extension:update(dt, context, t)
	end
end

HealthSystem._assist_shield = function (self, target_unit, shield_amount)
	local health_extension = self.unit_extensions[target_unit]
	local status_extension = ScriptUnit.extension(target_unit, "status_system")

	health_extension:shield(shield_amount)
	status_extension:set_shielded(true)
end

HealthSystem.suicide = function (self, unit)
	if not Unit.alive(unit) then
		if not unit then
			print("Got suicide from deleted player unit")
		else
			print("Trying suicide but already dead")
		end

		return
	end

	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension:die("forced")
end

local debug_units = {}

HealthSystem.update_debug = function (self)
	if script_data.damage_debug then
		for unit, extension in pairs(self.unit_extensions) do
			if Managers.player:owner(unit) then
				local damage_taken = extension:get_damage_taken()
				local max_health = extension:get_max_health()
				local dialogue_extension = ScriptUnit.has_extension(unit, "dialogue_system")

				if dialogue_extension then
					Debug.text("Player: %s @ %.2f/%.2f", dialogue_extension.context.player_profile, damage_taken, max_health)
				else
					Debug.text("Player: @ %.2f/%.2f", damage_taken, max_health)
				end
			else
				local health = extension:current_health()
				local damage = extension:get_damage_taken()
				local health_string = (health == math.huge and "inf") or string.format("%.2f", health)
				local breed = Unit.get_data(unit, "breed")

				if breed ~= nil then
					Debug.text("Breed %s @ %.2f/%s", breed.name, damage, health_string)
				else
					Debug.text("%s @ %.2f/%s", Unit.debug_name(unit), damage, health_string)
				end
			end
		end
	end

	local show_ai_health = script_data.show_ai_health
	local show_ai_spawn_info = script_data.show_ai_spawn_info

	if show_ai_health or show_ai_spawn_info then
		local player = Managers.player:local_player()

		if player == nil then
			return
		end

		local player_unit = player.player_unit
		local free_flight_manager = Managers.free_flight
		local free_flight_position = free_flight_manager:active("global") and free_flight_manager:camera_position_rotation()
		local ai_system = Managers.state.entity:system("ai_system")
		local broadphase = ai_system.broadphase
		local center_pos = free_flight_position or POSITION_LOOKUP[player_unit]

		if broadphase and center_pos then
			local num_units = Broadphase.query(broadphase, center_pos, 20, debug_units)
			local offset_vector = Vector3(0, 0, 0.5)
			local offset_vector2 = Vector3(0, 0, 0.65)
			local offset_vector3 = Vector3(0, 0, 0.75)
			local desc_color = Vector3(255, 200, 0)
			local desc_color2 = Vector3(255, 0, 200)
			local head_color = Vector3(255, 70, 0)
			local change_color = Vector3(55, 70, 255)
			local color1 = Vector3(0, 175, 75)
			local color2 = Vector3(175, 175, 0)
			local color3 = Vector3(175, 0, 0)
			local deadcolor = Vector3(100, 0, 0)
			local viewport_name = "player_1"
			local debug_text_manager = Managers.state.debug_text

			for i = 1, num_units, 1 do
				local unit = debug_units[i]
				local head_node = Unit.has_node(unit, "c_head") and Unit.node(unit, "c_head")

				if head_node then
					local health_extension = self.unit_extensions[unit]

					if show_ai_health then
						debug_text_manager:clear_unit_text(unit, "health")

						local current_health = health_extension.health - health_extension.damage
						local max_health = health_extension.health
						local p = current_health / max_health
						local color = (p > 0.99 and color1) or (p > 0.25 and color2) or color3

						if p <= 0 then
							local text = string.format("dead", current_health, health_extension.health)

							debug_text_manager:output_unit_text(text, 0.16, unit, head_node, offset_vector, nil, "health", deadcolor, viewport_name)
						else
							local text = string.format("%.2f / %.2f", current_health, health_extension.health)

							debug_text_manager:output_unit_text(text, 0.3, unit, head_node, offset_vector, nil, "health", color, viewport_name)
						end

						local ai_group_extension = ScriptUnit.has_extension(unit, "ai_group_system")
						local template_name = (ai_group_extension and ai_group_extension.template) or ""

						if template_name then
							debug_text_manager:output_unit_text(template_name, 0.15, unit, head_node, offset_vector2, nil, "health", head_color, viewport_name)
						end
					end

					if show_ai_spawn_info then
						debug_text_manager:clear_unit_text(unit, "spawn_info")

						local zone_data = health_extension.zone_data

						if zone_data then
							local hi_data = zone_data.hi_data
							local text, col = nil
							local replaced_breed = health_extension.replaced_breed

							if replaced_breed then
								col = change_color
								text = string.format("%s R>%s", health_extension.debug_info or "Roaming", health_extension.replaced_breed)
							else
								col = head_color
								text = string.format("%s SEG=%d", health_extension.debug_info or "Roaming", hi_data.id)
							end

							debug_text_manager:output_unit_text(text, 0.15, unit, head_node, offset_vector3, nil, "spawn_info", col, viewport_name)

							local breed_name = BLACKBOARDS[unit].breed.name
							local breed_count = hi_data and hi_data.breed_count and hi_data.breed_count[breed_name]
							local count = (breed_count and breed_count.count) or " "
							text = string.format("%s %s %q(%s)", (zone_data.island and "island_id:") or "zone_id:", zone_data.unique_zone_id, zone_data.pack_type or "?", count)

							if zone_data.hi then
								col = desc_color2
							else
								col = desc_color
							end

							debug_text_manager:output_unit_text(text, 0.15, unit, head_node, offset_vector2, nil, "spawn_info", col, viewport_name)
						else
							local ai_group_extension = ScriptUnit.has_extension(unit, "ai_group_system")
							local template_name = (ai_group_extension and ai_group_extension.template) or ""

							if template_name then
								debug_text_manager:output_unit_text(template_name, 0.15, unit, head_node, offset_vector2, nil, "spawn_info", head_color, viewport_name)
							end
						end
					end
				end
			end
		end
	end
end

HealthSystem.rpc_add_damage = function (self, sender, victim_unit_go_id, victim_unit_is_level_unit, attacker_unit_go_id, attacker_is_level_unit, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot)
	fassert(not self.is_server, "Tried sending rpc_add_damage to something other than client")

	local victim_unit = nil
	local unit_storage = self.unit_storage

	if victim_unit_is_level_unit then
		victim_unit = LevelHelper:unit_by_index(self.world, victim_unit_go_id)
	else
		victim_unit = unit_storage:unit(victim_unit_go_id)
	end

	if not Unit.alive(victim_unit) then
		return
	end

	local attacker_unit = nil

	if attacker_is_level_unit then
		attacker_unit = LevelHelper:unit_by_index(self.world, attacker_unit_go_id)
	else
		attacker_unit = unit_storage:unit(attacker_unit_go_id)
	end

	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local damage_type = NetworkLookup.damage_types[damage_type_id]
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local hit_ragdoll_actor = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor_id]
	local hit_react_type = NetworkLookup.hit_react_types[hit_react_type_id]
	local attacker_unit_alive = Unit.alive(attacker_unit)
	local victim_health_extension = self.unit_extensions[victim_unit]

	if damage_type ~= "sync_health" then
		victim_health_extension:add_damage((attacker_unit_alive and attacker_unit) or victim_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source, hit_ragdoll_actor, nil, hit_react_type, is_critical_strike, added_dot)
	end

	if victim_health_extension:is_alive() and is_dead then
		local killing_blow = FrameTable.alloc_table()
		local hit_position_table = hit_position and Vector3Aux.box(nil, hit_position)
		local damage_direction_table = Vector3Aux.box(nil, damage_direction)
		killing_blow[1] = damage_amount
		killing_blow[2] = damage_type
		killing_blow[3] = (attacker_unit_alive and attacker_unit) or victim_unit
		killing_blow[4] = hit_zone_name
		killing_blow[5] = hit_position_table
		killing_blow[6] = damage_direction_table
		killing_blow[7] = damage_source
		killing_blow[8] = hit_ragdoll_actor
		killing_blow[9] = "n/a"
		local death_system = Managers.state.entity:system("death_system")

		death_system:kill_unit(victim_unit, killing_blow)
	end
end

HealthSystem.rpc_add_damage_network = function (self, sender, victim_unit_go_id, victim_unit_is_level_unit, attacker_unit_go_id, attacker_is_level_unit, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_react_type_id, is_critical_strike, added_dot)
	fassert(self.is_server, "Tried sending rpc_add_damage_network to something other than the server")

	local victim_unit = nil
	local unit_storage = self.unit_storage

	if victim_unit_is_level_unit then
		victim_unit = LevelHelper:unit_by_index(self.world, victim_unit_go_id)
	else
		victim_unit = unit_storage:unit(victim_unit_go_id)
	end

	if not Unit.alive(victim_unit) then
		return
	end

	local attacker_unit = nil

	if attacker_is_level_unit then
		attacker_unit = LevelHelper:unit_by_index(self.world, attacker_unit_go_id)
	else
		attacker_unit = unit_storage:unit(attacker_unit_go_id)
	end

	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local damage_type = NetworkLookup.damage_types[damage_type_id]
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local hit_react_type = NetworkLookup.hit_react_types[hit_react_type_id]

	DamageUtils.add_damage_network(victim_unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source, nil, nil, nil, hit_react_type, is_critical_strike, added_dot)
end

HealthSystem.rpc_damage_taken_overcharge = function (self, sender, unit_go_id, damage)
	local unit = self.unit_storage:unit(unit_go_id)

	if unit then
		DamageUtils.apply_damage_to_overcharge(unit, damage)
	end
end

HealthSystem.rpc_heal = function (self, sender, target_unit_go_id, target_unit_is_level_unit, healer_unit_go_id, healer_unit_is_level_unit, heal_amount, heal_type_id)
	local target_unit = nil
	local unit_storage = self.unit_storage

	if target_unit_is_level_unit then
		target_unit = LevelHelper:unit_by_index(self.world, target_unit_go_id)
	else
		target_unit = unit_storage:unit(target_unit_go_id)
	end

	if not Unit.alive(target_unit) then
		return
	end

	local healer_unit = nil

	if healer_unit_is_level_unit then
		healer_unit = LevelHelper:unit_by_index(self.world, healer_unit_go_id)
	else
		healer_unit = unit_storage:unit(healer_unit_go_id)
	end

	local heal_type = NetworkLookup.heal_types[heal_type_id]

	if heal_type == "shield_by_assist" then
		self:_assist_shield(target_unit, heal_amount)
	else
		local health_extension = self.unit_extensions[target_unit]

		health_extension:add_heal(target_unit, heal_amount, nil, heal_type)

		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

		if status_extension then
			status_extension:healed(heal_type)
		end

		local buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

		if buff_extension then
			buff_extension:trigger_procs("on_healed", healer_unit, heal_amount, heal_type)
		end

		local healer_buff_extension = ScriptUnit.has_extension(healer_unit, "buff_system")

		if target_unit ~= healer_unit and healer_buff_extension then
			healer_buff_extension:trigger_procs("on_healed_ally", target_unit, heal_amount, heal_type)
		end
	end
end

HealthSystem.rpc_remove_assist_shield = function (self, sender, unit_go_id)
	local unit = self.unit_storage:unit(unit_go_id)
	local health_extension = self.unit_extensions[unit]

	health_extension:remove_assist_shield("blocked_damage")
end

HealthSystem.rpc_request_heal = function (self, sender, unit_go_id, heal_amount, heal_type_id)
	fassert(self.is_server or LEVEL_EDITOR_TEST, "Trying to request a heal from a client")

	local unit = self.unit_storage:unit(unit_go_id)

	if not Unit.alive(unit) then
		return
	end

	local heal_type = NetworkLookup.heal_types[heal_type_id]

	if heal_type == "shield_by_assist" then
		DamageUtils.assist_shield_network(unit, unit, heal_amount)
	else
		DamageUtils.heal_network(unit, unit, heal_amount, heal_type)
	end
end

HealthSystem.rpc_suicide = function (self, sender, go_id)
	local unit = self.unit_storage:unit(go_id)

	self:suicide(unit)
end

HealthSystem.rpc_sync_damage_taken = function (self, sender, go_id, is_level_unit, set_max_health, amount, state_id)
	local unit = nil
	local unit_storage = self.unit_storage

	if is_level_unit then
		unit = LevelHelper:unit_by_index(self.world, go_id)
	else
		unit = unit_storage:unit(go_id)
	end

	if not Unit.alive(unit) then
		return
	end

	local health_extension = self.unit_extensions[unit]
	local state = NetworkLookup.health_statuses[state_id]

	if health_extension.sync_damage_taken then
		health_extension:sync_damage_taken(amount, set_max_health, state)
	else
		health_extension.damage = amount
		health_extension.state = state
	end
end

HealthSystem.rpc_take_falling_damage = function (self, sender, go_id, fall_height)
	local unit = self.unit_storage:unit(go_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local player_health_extension = self.player_unit_extensions[unit]

	if not player_health_extension then
		return
	end

	fall_height = fall_height * 0.25
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local damage_multiplier = movement_settings_table.fall.heights.FALL_DAMAGE_MULTIPLIER
	local min_fall_damage_height = movement_settings_table.fall.heights.MIN_FALL_DAMAGE_HEIGHT
	local min_fall_damage_percentage = movement_settings_table.fall.heights.MIN_FALL_DAMAGE_PERCENTAGE
	local max_fall_damage_percentage = movement_settings_table.fall.heights.MAX_FALL_DAMAGE_PERCENTAGE
	local max_health = player_health_extension:get_max_health()
	local min_fall_damage = max_health * min_fall_damage_percentage
	local max_fall_damage = max_health * max_fall_damage_percentage

	if min_fall_damage_height < fall_height then
		local delta = fall_height - min_fall_damage_height
		local fall_damage = math.clamp(delta * damage_multiplier, min_fall_damage, max_fall_damage)
		local damage_direction = Vector3.up()
		local hit_zone_name = "full"
		local damage_type = "kinetic"

		DamageUtils.add_damage_network(unit, unit, fall_damage, hit_zone_name, damage_type, nil, damage_direction, "ground_impact")
	end
end

HealthSystem.rpc_request_revive = function (self, sender, revived_unit_go_id, reviver_unit_go_id)
	fassert(self.is_server or LEVEL_EDITOR_TEST, "Trying to request a revive from a client")

	local revived_unit = self.unit_storage:unit(revived_unit_go_id)
	local reviver_unit = self.unit_storage:unit(reviver_unit_go_id)

	StatusUtils.set_revived_network(revived_unit, true, reviver_unit)

	local player_manager = Managers.player
	local interactor_player = player_manager:unit_owner(reviver_unit)
	local interactable_player = player_manager:unit_owner(revived_unit)

	if not interactor_player or not interactable_player then
		return
	end

	local interactable_pos = POSITION_LOOKUP[revived_unit]

	Managers.telemetry.events:player_revived(interactor_player, interactable_player, interactable_pos)
end

return
