ActionCatch = class(ActionCatch, ActionBase)

ActionCatch.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCatch.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionCatch.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCatch.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local owner_unit = self.owner_unit
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local buffed_anim_time_scale = ActionUtils.get_action_time_scale(owner_unit, new_action)
	local catch_time = (new_action.catch_time or 0) * 1 / buffed_anim_time_scale
	self._catch_time = t + catch_time
	self._state = "waiting_to_catch"
	self._should_not_remove = new_action.should_not_remove

	if not self._should_not_remove then
		self:_remove_pickup()
	end
end

ActionCatch.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self._state == "waiting_to_catch" and self._catch_time <= t then
		self:_add_ammo()

		self._state = "caught"
	end
end

ActionCatch._remove_pickup = function (self)
	local inventory_extension = self._inventory_extension

	if inventory_extension then
		local axe_found = false
		local peer_id = Network.peer_id()
		local index = 1
		local pickup_system = Managers.state.entity:system("pickup_system")
		local axe_unit = pickup_system:get_and_delete_limited_owned_pickup_with_index(peer_id, index)

		if axe_unit and Unit.alive(axe_unit) then
			axe_found = true

			Unit.flow_event(axe_unit, "lua_recall")
		end

		if not axe_found then
			local projectile_system = Managers.state.entity:system("projectile_system")
			axe_unit = projectile_system:get_and_delete_indexed_projectile(self.owner_unit, index)

			if axe_unit and Unit.alive(axe_unit) then
				Unit.flow_event(axe_unit, "lua_recall")
			end
		end
	end
end

ActionCatch._add_ammo = function (self)
	local inventory_extension = self._inventory_extension
	local ammo_extension = nil
	local equipment = inventory_extension:equipment()
	local inventory_slots = equipment.slots
	local slot_data = inventory_slots.slot_ranged

	if slot_data then
		local left_hand_unit = slot_data.left_unit_1p
		local left_hand_ammo_extension = left_hand_unit and ScriptUnit.has_extension(left_hand_unit, "ammo_system")

		if left_hand_ammo_extension then
			ammo_extension = left_hand_ammo_extension
		end

		local right_hand_unit = slot_data.right_unit_1p
		local right_hand_ammo_extension = right_hand_unit and ScriptUnit.has_extension(right_hand_unit, "ammo_system")

		if right_hand_ammo_extension then
			ammo_extension = right_hand_ammo_extension
		end
	end

	if ammo_extension then
		if ammo_extension:total_remaining_ammo() == 0 then
			Unit.animation_event(self.first_person_unit, "to_ammo")
		end

		local amount = 1

		ammo_extension:add_ammo(amount)

		if ammo_extension:current_ammo() == 0 then
			local play_reload_animation = false

			ammo_extension:start_reload(play_reload_animation)
		end
	end
end

ActionCatch.finish = function (self, reason)
	return
end
