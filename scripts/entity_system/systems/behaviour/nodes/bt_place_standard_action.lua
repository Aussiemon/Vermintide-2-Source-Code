-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_place_standard_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPlaceStandardAction = class(BTPlaceStandardAction, BTNode)

BTPlaceStandardAction.init = function (self, ...)
	BTPlaceStandardAction.super.init(self, ...)
end

BTPlaceStandardAction.name = "BTPlaceStandardAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTPlaceStandardAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTPlaceStandardAction

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))

	blackboard.attacking_target = blackboard.target_unit
	blackboard.anim_cb_placed_standard = nil
	blackboard.anim_cb_place_standard = nil
	blackboard.attack_aborted = nil
end

BTPlaceStandardAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(default_move_speed)

	blackboard.active_node = nil
	blackboard.action = nil
	blackboard.attacking_target = nil
	blackboard.attack_aborted = nil

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	if blackboard.anim_cb_place_standard then
		blackboard.has_placed_standard = true
		blackboard.switching_weapons = 2
	end

	if blackboard.move_state ~= "idle" and HEALTH_ALIVE[unit] then
		blackboard.move_state = "idle"
	end

	blackboard.anim_cb_placed_standard = nil
	blackboard.anim_cb_place_standard = nil
end

BTPlaceStandardAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.anim_cb_placed_standard or blackboard.attack_aborted then
		return "done"
	end

	if blackboard.move_state ~= "attacking" then
		Managers.state.network:anim_event(unit, randomize(blackboard.action.place_standard_animation))

		blackboard.move_state = "attacking"
	end

	return "running"
end

BTPlaceStandardAction.anim_cb_place_standard = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		local self_pos = POSITION_LOOKUP[unit]
		local position = self_pos + Quaternion.forward(Unit.local_rotation(unit, 0))
		local position_on_navmesh
		local nav_world = blackboard.nav_world
		local above, below = 1, 1
		local is_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, position, above, below)

		if is_on_navmesh then
			position_on_navmesh = Vector3.copy(position)
			position_on_navmesh.z = altitude
		else
			local horizontal_limit = 1
			local distance_from_nav_border = 0.05

			position_on_navmesh = GwNavQueries.inside_position_from_outside_position(nav_world, position, above, below, horizontal_limit, distance_from_nav_border)
		end

		if position_on_navmesh then
			local action = blackboard.action
			local extension_init_data = {
				health_system = {
					health = action.standard_health,
				},
				death_system = {
					death_reaction_template = "standard",
				},
				ai_supplementary_system = {
					standard_template_name = action.standard_template_name,
					standard_bearer_unit = unit,
				},
				ping_system = {
					always_pingable = true,
				},
			}
			local unit_name = "units/weapons/enemy/wpn_bm_standard_01/wpn_bm_standard_01_placed"
			local standard_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "standard_unit", extension_init_data, position_on_navmesh)

			blackboard.standard_unit = standard_unit

			local world = blackboard.world
			local explosion_position = Unit.local_position(standard_unit, 0)
			local explosion_template = ExplosionUtils.get_template("standard_bearer_explosion")
			local damage_source = blackboard.breed.name
			local broadphase = blackboard.group_blackboard.broadphase
			local radius = explosion_template.explosion.radius
			local broadphase_results = FrameTable.alloc_table()
			local nearby_beastmen_blackboards = FrameTable.alloc_table()
			local num_results = Broadphase.query(broadphase, self_pos, radius, broadphase_results)

			for i = 1, num_results do
				local nearby_unit = broadphase_results[i]

				if HEALTH_ALIVE[nearby_unit] then
					local nearby_unit_blackboard = BLACKBOARDS[nearby_unit]

					if nearby_unit_blackboard.breed.race == "beastmen" then
						nearby_unit_blackboard.standard_bearer_stagger = true
						nearby_beastmen_blackboards[#nearby_beastmen_blackboards + 1] = nearby_unit_blackboard
					end
				end
			end

			DamageUtils.create_explosion(world, blackboard.target_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, false, nil, unit)

			for i = 1, #nearby_beastmen_blackboards do
				local nearby_beastmen_blackboard = nearby_beastmen_blackboards[i]
			end

			local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
			local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
			local damage_source_id = NetworkLookup.damage_sources[damage_source]

			Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
		end

		blackboard.anim_cb_place_standard = true

		if blackboard.triggered_standard_chanting_sound then
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event(blackboard.action.stop_chanting_sound_event, unit)

			blackboard.triggered_standard_chanting_sound = nil
		end

		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "has_planted_standard", DialogueSettings.special_proximity_distance_heard)
	end
end

BTPlaceStandardAction.anim_cb_placed_standard = function (self, unit, blackboard)
	blackboard.anim_cb_placed_standard = true
end
