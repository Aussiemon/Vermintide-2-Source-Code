-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_troll_downed_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTrollDownedAction = class(BTTrollDownedAction, BTNode)
BTTrollDownedAction.name = "BTTrollDownedAction"

local script_data = script_data

BTTrollDownedAction.init = function (self, ...)
	BTTrollDownedAction.super.init(self, ...)
end

BTTrollDownedAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "downed_intro")
	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.troll_incapacitaded_broadcast_range, "attack_tag", "troll_incapacitaded")

	local downed_duration = AiUtils.downed_duration(action)

	blackboard.downed_end_time = t + downed_duration
	blackboard.minimum_downed_end_time = t + action.min_downed_duration

	local health_extension = ScriptUnit.extension(unit, "health_system")

	blackboard.downed_end_finished = false
	blackboard.downed_state = "downed"

	self:trigger_dialogue_event(unit, "chaos_troll_incapacitaded")
	self:effects_on_downed(unit, blackboard, t)

	blackboard.num_regen = blackboard.num_regen and blackboard.num_regen + 1 or 1

	if action.rage_buff_on_wounded and action.remove_leaving_buff_on_enter then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff = buff_extension:get_buff_type(action.rage_buff_on_wounded)

		if buff then
			buff_extension:remove_buff(buff.id)
		end
	end

	if action.downed_buff then
		local buff_system = Managers.state.entity:system("buff_system")

		blackboard.downed_buff = buff_system:add_buff(unit, action.downed_buff, unit, true)
	end
end

BTTrollDownedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	BTStaggerAction.clean_blackboard(nil, blackboard)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.downed_end_finished = false
	blackboard.downed_state = false
	blackboard.waiting_for_rage_anim_cb = false
	blackboard.anim_cb_roar_begin = false
	blackboard.anim_cb_roar_end = false

	if HEALTH_ALIVE[unit] and blackboard.downed_buff then
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:remove_server_controlled_buff(unit, blackboard.downed_buff)

		blackboard.downed_buff = nil
	end
end

BTTrollDownedAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local health_extension = ScriptUnit.extension(unit, "health_system")

	if blackboard.downed_state == "downed" then
		if t > blackboard.downed_end_time then
			if action.buff_during_stand_up then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				blackboard.buff_during_stand_up = buff_extension:add_buff(action.buff_during_stand_up)
			end

			Managers.state.network:anim_event(unit, action.rise_anim or "downed_end")
			self:trigger_dialogue_event(unit, "chaos_troll_rising_regen")

			blackboard.downed_state = "standup"
		elseif t > blackboard.minimum_downed_end_time and health_extension:min_health_reached() then
			if action.buff_during_stand_up then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				blackboard.buff_during_stand_up = buff_extension:add_buff(action.buff_during_stand_up)
			end

			Managers.state.network:anim_event(unit, action.rise_anim_wounded or "downed_end_wounded")
			self:trigger_dialogue_event(unit, "chaos_troll_rising_interrupted")

			blackboard.downed_state = "standup"
		end
	else
		if action.rage_buff_on_wounded and blackboard.anim_cb_roar_begin then
			self:rage(unit, blackboard, t)
		end

		if blackboard.downed_end_finished then
			if not blackboard.waiting_for_rage_anim_cb then
				local rage_event = action.rage_event

				if rage_event then
					blackboard.waiting_for_rage_anim_cb = true

					Managers.state.network:anim_event(unit, rage_event)
				end
			end

			if not blackboard.waiting_for_rage_anim_cb or blackboard.rage_end_finished then
				if blackboard.buff_during_stand_up then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					buff_extension:remove_buff(blackboard.buff_during_stand_up)

					blackboard.buff_during_stand_up = nil
				end

				health_extension:set_downed_finished()

				return "done"
			end
		end
	end

	return "running"
end

BTTrollDownedAction.trigger_dialogue_event = function (self, unit, dialogue_event)
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")

	dialogue_input:trigger_networked_dialogue_event(dialogue_event)
end

BTTrollDownedAction.effects_on_downed = function (self, unit, blackboard, t)
	local action = blackboard.action

	if action.puke_on_downed then
		local unit_pos = Unit.local_position(unit, 0)
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local navmesh_pos = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, unit_pos)
		local rotation = Unit.local_rotation(unit, 0)
		local direction = Quaternion.forward(rotation)

		direction = Vector3.flat(direction)

		if navmesh_pos then
			local extension_init_data = {
				area_damage_system = {
					liquid_template = "bile_troll_chief_downed_vomit",
					flow_dir = direction,
					source_unit = unit,
				},
			}
			local aoe_unit_name = "units/hub_elements/empty"
			local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, navmesh_pos)
			local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

			liquid_area_damage_extension:ready()
		end
	end
end

BTTrollDownedAction.rage = function (self, unit, blackboard, t)
	blackboard.anim_cb_roar_begin = false

	local action = blackboard.action
	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:add_buff_synced(unit, action.rage_buff_on_wounded, BuffSyncType.All)

	if action.rage_explosion_template then
		local world = blackboard.world
		local explosion_position = Unit.local_position(unit, 0) + Vector3.up()
		local explosion_template = ExplosionUtils.get_template(action.rage_explosion_template)
		local scale = 1
		local damage_source = blackboard.breed.name

		DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, scale, damage_source, true, false, unit, 0, false)

		local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
		local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
		local damage_source_id = NetworkLookup.damage_sources[damage_source]

		Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
	end
end
