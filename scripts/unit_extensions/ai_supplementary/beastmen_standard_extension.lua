BeastmenStandardExtension = class(BeastmenStandardExtension)

BeastmenStandardExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
	local self_pos = Unit.local_position(unit, 0)
	self.self_position_boxed = Vector3Box(self_pos)
	local standard_template_name = extension_init_data.standard_template_name
	local standard_template = BeastmenStandardTemplates[standard_template_name]
	self.standard_template = standard_template
	self.standard_template_name = standard_template_name
	self.standard_template_buff_name = standard_template.buff_template_name
	self.standard_bearer_unit = extension_init_data.standard_bearer_unit
	self.apply_buff_frequency = 0.5
	local t = Managers.time:time("game")
	self.next_apply_buff_t = t
	self.affected_units_effects = {}
	self.ai_units_broadphase_result = {}
	self.ai_units_inside = {}
	self.standard_data = {
		challenge_time = t + QuestSettings.standard_bearer_alive_seconds,
		is_server = self.is_server,
		standard_bearer_unit = self.standard_bearer_unit
	}
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[self.standard_bearer_unit] or side_manager:get_side_from_name("dark_pact")

	side_manager:add_unit_to_side(self.unit, side.side_id)

	if self.is_server then
		self.astar_check_frequency = standard_template.astar_check_frequency or 15
		self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local astar_to_players_allowed_layers = {
			ledges = 1,
			ledges_with_fence = 1,
			doors = 1,
			bot_poison_wind = 1,
			planks = 1,
			bot_ratling_gun_fire = 1,
			fire_grenade = 1
		}
		local player_astar_navtag_layer_cost_table = GwNavTagLayerCostTable.create()

		table.merge(astar_to_players_allowed_layers, NAV_TAG_VOLUME_LAYER_COST_AI)
		AiUtils.initialize_cost_table(player_astar_navtag_layer_cost_table, astar_to_players_allowed_layers)

		local player_astar_traverse_logic = GwNavTraverseLogic.create(self.nav_world, player_astar_navtag_layer_cost_table)
		self.player_astar_navtag_layer_cost_table = player_astar_navtag_layer_cost_table
		self.player_astar_traverse_logic = player_astar_traverse_logic
		self.player_astar_data = {
			{
				next_astar_check_t = t + self.astar_check_frequency
			},
			{
				next_astar_check_t = t + self.astar_check_frequency
			},
			{
				next_astar_check_t = t + self.astar_check_frequency
			},
			{
				next_astar_check_t = t + self.astar_check_frequency
			}
		}

		Managers.state.conflict:add_unit_to_standards(unit)

		self.next_vo_trigger_event_t = t + 15

		LevelHelper:flow_event(self.world, "standard_placed")
	end

	local sfx_placed = standard_template.sfx_placed
	local sfx_loop = standard_template.sfx_loop

	WwiseUtils.trigger_unit_event(world, sfx_placed, unit, 0)
	WwiseUtils.trigger_unit_event(world, sfx_loop, unit, 0)
end

BeastmenStandardExtension.destroy = function (self)
	Managers.state.side:remove_unit_from_side(self.unit)

	if not self.dead then
		self:on_death()
	end
end

BeastmenStandardExtension.on_death = function (self, killer_unit)
	if self.is_server then
		local buff_system = Managers.state.entity:system("buff_system")

		for ai_unit, buff_id in pairs(self.ai_units_inside) do
			if Unit.alive(ai_unit) then
				local buff_extension = ScriptUnit.extension(ai_unit, "buff_system")

				if buff_extension:has_buff_type(self.standard_template_buff_name) then
					local buff = buff_extension:get_non_stacking_buff(self.standard_template_buff_name)
					buff.standard_is_destroyed = true
				end

				if buff_system:has_server_controlled_buff(ai_unit, buff_id) then
					buff_system:remove_server_controlled_buff(ai_unit, buff_id)
				end
			end
		end

		for i = 1, #self.player_astar_data, 1 do
			local astar_data = self.player_astar_data[i]

			if astar_data.astar then
				local astar = astar_data.astar

				if not GwNavAStar.processing_finished(astar) then
					GwNavAStar.cancel(astar)
					GwNavAStar.destroy(astar)
				else
					GwNavAStar.destroy(astar)
				end
			end
		end

		Managers.state.conflict:remove_unit_from_standards(self.unit)
		GwNavTagLayerCostTable.destroy(self.player_astar_navtag_layer_cost_table)
		GwNavTraverseLogic.destroy(self.player_astar_traverse_logic)
		table.clear(self.ai_units_inside)
		table.clear(self.ai_units_broadphase_result)
		LevelHelper:flow_event(self.world, "standard_destroyed")
	end

	self.dead = true

	table.clear(self.standard_data)

	if Unit.alive(killer_unit) and killer_unit ~= self.unit then
		local explosion_position = Unit.local_position(self.unit, 0)
		local explosion_template = ExplosionTemplates.standard_death_explosion
		local damage_source = "beastmen_standard_bearer"

		DamageUtils.create_explosion(self.world, killer_unit or self.unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, self.is_server, false, self.unit, false)
		Unit.flow_event(self.unit, "destroy")

		if self.is_server then
			Managers.state.entity:system("surrounding_aware_system"):add_system_event(self.unit, "standard_bearer_buff_deactivated", DialogueSettings.special_proximity_distance_heard)
		end
	else
		local vfx_picked_up_standard = self.standard_template.vfx_picked_up_standard

		World.create_particles(self.world, vfx_picked_up_standard, self.self_position_boxed:unbox())
		Unit.flow_event(self.unit, "picked_up")
	end

	local sfx_loop_stop = self.standard_template.sfx_loop_stop
	local sfx_destroyed = self.standard_template.sfx_destroyed

	WwiseUtils.trigger_unit_event(self.world, sfx_loop_stop, self.unit, 0)
	WwiseUtils.trigger_unit_event(self.world, sfx_destroyed, self.unit, 0)

	self.world = nil
	self.self_position_boxed = nil
	self.standard_template = nil
end

BeastmenStandardExtension.update = function (self, unit, input, dt, context, t)
	if self.dead then
		return
	end

	local standard_template = self.standard_template

	if self.is_server and standard_template.apply_buff_to_ai and self.next_apply_buff_t <= t then
		local ai_units_inside = self.ai_units_inside
		local ai_units_broadphase_result = self.ai_units_broadphase_result

		table.clear(ai_units_broadphase_result)

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_template_name = standard_template.buff_template_name
		local radius = standard_template.radius
		local self_position = self.self_position_boxed:unbox()
		local num_ai_units = AiUtils.broadphase_query(self_position, radius, ai_units_broadphase_result)

		for i = 1, num_ai_units, 1 do
			local ai_unit = ai_units_broadphase_result[i]
			local buff_extension = ScriptUnit.has_extension(ai_unit, "buff_system")
			local blackboard = BLACKBOARDS[ai_unit]
			local is_beastmen = blackboard and blackboard.breed.race == "beastmen"

			if is_beastmen and buff_extension and not ai_units_inside[ai_unit] and not buff_extension:get_non_stacking_buff(self.standard_template_buff_name) then
				local buff_id = buff_system:add_buff(ai_unit, buff_template_name, ai_unit, true)
				ai_units_inside[ai_unit] = buff_id
			end
		end

		for ai_unit, buff_id in pairs(ai_units_inside) do
			local is_inside = false

			for i = 1, num_ai_units, 1 do
				local inside_ai_unit = ai_units_broadphase_result[i]

				if ai_unit == inside_ai_unit then
					is_inside = true

					break
				end
			end

			if not is_inside or not AiUtils.unit_alive(ai_unit) then
				if Unit.alive(ai_unit) and buff_system:has_server_controlled_buff(ai_unit, buff_id) then
					buff_system:remove_server_controlled_buff(ai_unit, buff_id)
				end

				ai_units_inside[ai_unit] = nil
			end
		end

		self.next_apply_buff_t = t + self.apply_buff_frequency
	end

	if standard_template.custom_update_func then
		standard_template:custom_update_func(self.standard_data, t, dt, unit, self.ai_units_inside)
	end

	if self.is_server and self.next_vo_trigger_event_t < t then
		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "standard_bearer_buff_active", DialogueSettings.special_proximity_distance_heard)

		self.next_vo_trigger_event_t = t + 15
	end

	if self.is_server then
		self:_update_self_destruction(unit, dt, t)
	end
end

BeastmenStandardExtension._update_self_destruction = function (self, unit, dt, t)
	local player_astar_data = self.player_astar_data
	local nav_world = self.nav_world
	local side = Managers.state.side:get_side_from_name("dark_pact")
	local player_units = side.ENEMY_PLAYER_UNITS
	local num_player_units = #player_units

	for i = 1, num_player_units, 1 do
		local player_unit = player_units[i]

		if AiUtils.unit_alive(player_unit) then
			local data = player_astar_data[i]
			local astar = data.astar
			local traverse_logic = self.player_astar_traverse_logic

			if astar then
				local done = GwNavAStar.processing_finished(astar)

				if done then
					local path_found = GwNavAStar.path_found(astar)
					data.has_calculated_path = true

					if path_found then
						data.path_found = true

						for j = 1, #player_astar_data, 1 do
							local astar_data = player_astar_data[j]
							local player_astar = astar_data.astar

							if player_astar then
								if not GwNavAStar.processing_finished(player_astar) then
									GwNavAStar.cancel(player_astar)
									GwNavAStar.destroy(player_astar)
								else
									GwNavAStar.destroy(player_astar)
								end
							end

							astar_data.astar = nil
						end

						break
					end

					GwNavAStar.destroy(astar)

					data.astar = nil
				end
			elseif data.next_astar_check_t < t then
				local target_position = POSITION_LOOKUP[player_unit]
				local success, z = GwNavQueries.triangle_from_position(nav_world, target_position, 1, 1)

				if success then
					local wanted_position = Vector3(target_position[1], target_position[2], z)
					local new_astar = GwNavAStar.create(nav_world)
					local standard_position = Unit.local_position(unit, 0)

					GwNavAStar.start(new_astar, nav_world, wanted_position, standard_position, traverse_logic)

					data.astar = new_astar
					data.next_astar_check_t = t + self.astar_check_frequency
					data.has_calculated_path = nil
					data.path_found = nil
				else
					data.next_astar_check_t = t + 1.5
				end
			end
		else
			local data = player_astar_data[i]

			if data and data.astar then
				local astar = data.astar

				if not GwNavAStar.processing_finished(astar) then
					GwNavAStar.cancel(astar)
					GwNavAStar.destroy(astar)
				else
					GwNavAStar.destroy(astar)
				end
			end
		end
	end

	local has_path_to_any_player = nil
	local num_path_calculations = 0

	for i = 1, #player_astar_data, 1 do
		local data = player_astar_data[i]

		if data.path_found then
			has_path_to_any_player = true
		elseif data.has_calculated_path then
			num_path_calculations = num_path_calculations + 1
		end
	end

	if not has_path_to_any_player and num_player_units <= num_path_calculations then
		AiUtils.kill_unit(self.unit, self.unit, nil, nil, nil, "suicide")
	end
end

return
