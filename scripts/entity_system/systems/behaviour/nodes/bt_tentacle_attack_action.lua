-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_tentacle_attack_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTentacleAttackAction = class(BTTentacleAttackAction, BTNode)
BTTentacleAttackAction.name = "BTTentacleAttackAction"

local swipe_attack = false

BTTentacleAttackAction.init = function (self, ...)
	BTTentacleAttackAction.super.init(self, ...)
end

BTTentacleAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action

	local target_unit = blackboard.target_unit
	local tentacle_extension = ScriptUnit.has_extension(unit, "ai_supplementary_system")

	tentacle_extension:set_target("attack", target_unit, 0)

	blackboard.tentacle_spline_extension = tentacle_extension
	blackboard.current_target = target_unit

	self:sync_state_to_clients(unit, blackboard, "attack", 0, t)

	blackboard.tentacle_satisfied = false
end

BTTentacleAttackAction.sync_state_to_clients = function (self, unit, blackboard, template_name, reach_dist, t)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local target_unit_id = network_manager:unit_game_object_id(blackboard.current_target)
	local template_id = NetworkLookup.tentacle_template[template_name]

	reach_dist = math.clamp(reach_dist, 0, 31)

	network_manager.network_transmit:send_rpc_clients("rpc_change_tentacle_state", unit_id, target_unit_id, template_id, reach_dist, t)
end

BTTentacleAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.tentacle_satisfied = true
end

local Unit_alive = Unit.alive

BTTentacleAttackAction.run = function (self, unit, blackboard, t, dt)
	if self:update_tentacle(unit, blackboard, t, dt) then
		return "running"
	end

	return "done"
end

local evade_length = 10

BTTentacleAttackAction.update_tentacle = function (self, unit, blackboard, t, dt)
	local data = blackboard.tentacle_data
	local target_unit = blackboard.current_target

	if not Unit.alive(target_unit) then
		return true
	end

	local hips_node = Unit.node(target_unit, "j_hips")
	local player_pos = Unit.world_position(target_unit, hips_node)
	local tentacle_extension = blackboard.tentacle_spline_extension
	local action = blackboard.action

	if data.state == "spline_update" then
		local breed = blackboard.breed
		local spline = data.spline
		local root_pos = data.root_pos:unbox()
		local to_player_from_root = player_pos - root_pos
		local current_length = data.current_length
		local lock_point_dist = tentacle_extension.lock_point_dist

		if data.unit then
			if data.sub_state == "grabbed" then
				current_length = current_length - breed.drag_speed * dt
				data.current_length = current_length

				local root_dist_sq = Vector3.length_squared(to_player_from_root)
				local new_pos = POSITION_LOOKUP[target_unit]

				data.last_target_pos:store(new_pos)
				tentacle_extension:set_target("attack", target_unit, current_length)

				local is_consumed = self:target_tentacle_status_check(target_unit, "portal_consume")

				if not is_consumed and root_dist_sq < 2 then
					StatusUtils.set_grabbed_by_tentacle_status_network(target_unit, "portal_consume")

					data.wait_for_player_death = t + breed.time_before_consume_kill_player
					data.wait_for_consume_end = t + breed.time_before_consume_end
					data.sub_state = "portal_consume"
				end
			elseif data.sub_state == "portal_hanging" then
				if t > data.wait_for_consume then
					StatusUtils.set_grabbed_by_tentacle_status_network(target_unit, "portal_consume")

					data.wait_for_player_death = t + breed.time_before_consume_kill_player
					data.wait_for_consume_end = t + breed.time_before_consume_end
					data.sub_state = "portal_consume"
					data.wait_for_consume = nil
				end
			elseif data.sub_state == "portal_consume" then
				local target_health_extension = ScriptUnit.has_extension(target_unit, "health_system")

				target_health_extension:die()

				if data.wait_for_player_death and t > data.wait_for_player_death then
					StatusUtils.set_grabbed_by_tentacle_network(target_unit, false, unit)

					local portal_unit = data.portal_unit
					local audio_system = Managers.state.entity:system("audio_system")

					audio_system:play_audio_unit_event("Play_enemy_sorcerer_portal_puke", portal_unit, "a_surface_center")

					data.wait_for_player_death = nil
				end

				if t > data.wait_for_consume_end then
					data.sub_state = "attacking"

					self:sync_state_to_clients(unit, blackboard, "attack", current_length, t)

					local health_extension = ScriptUnit.has_extension(unit, "health_system")

					health_extension:die()

					data.state = "done"
					data.wait_for_consume_end = nil

					return false
				end
			elseif data.sub_state == "swipe_attack" then
				Debug.text("Swipe Attack")

				if t > blackboard.swipe_attack_timer then
					data.sub_state = nil
					blackboard.next_attack_time = t + 2 + math.random()

					return false
				end
			elseif data.sub_state == "target_evaded" then
				local target_dist = Vector3.length(to_player_from_root)
				local wanted_length = target_dist + evade_length
				local full_length = data.max_length

				current_length = current_length + dt * 25

				if full_length <= current_length then
					current_length = full_length
				elseif wanted_length < current_length then
					current_length = wanted_length
				end

				tentacle_extension:set_target("evaded", target_unit, current_length)

				if t > blackboard.evaded_timer then
					data.sub_state = nil
					blackboard.next_attack_time = t + 2 + math.random()

					return false
				end
			elseif data.sub_state == "target_too_far_away" then
				current_length = current_length - breed.fail_retract_speed * dt

				if current_length <= 0 then
					current_length = 0
					data.sub_state = nil
					blackboard.next_attack_time = t + 2 + math.random()
					data.current_length = current_length

					return false
				end

				data.current_length = current_length
				blackboard.tentacle_satisfied = true

				local new_pos = POSITION_LOOKUP[target_unit]

				data.last_target_pos:store(new_pos)
				tentacle_extension:set_target("attack", target_unit, current_length)
			else
				local target_dist = Vector3.length(to_player_from_root)
				local wanted_length = (lock_point_dist or target_dist) + data.spiral_length
				local is_at_full_length
				local full_length = data.max_length

				current_length = current_length + dt * 35

				if full_length <= current_length then
					current_length = full_length
					is_at_full_length = true
				elseif wanted_length < current_length then
					current_length = wanted_length
				end

				data.current_length = current_length

				tentacle_extension:set_target("attack", target_unit, current_length)

				local dist_to_tip_sqr = self:dist_sqr_to_tentacle_tip(unit, data, target_unit)

				if dist_to_tip_sqr < 4 then
					if swipe_attack then
						local attack_animation = "attack_swipe"

						Managers.state.network:anim_event(unit, attack_animation)

						data.sub_state = "swipe_attack"
						blackboard.swipe_attack_timer = t + 3

						print("FANCY ANIM")

						return true
					end

					local audio_system = Managers.state.entity:system("audio_system")
					local successful_evade = self:target_evade_through_dodge_check(action, data, target_unit, dist_to_tip_sqr)

					if successful_evade then
						data.sub_state = "target_evaded"

						self:sync_state_to_clients(unit, blackboard, "evaded", current_length, t)
						audio_system:play_audio_unit_event("Play_enemy_sorcerer_tentacle_foley_attack_swing", unit, breed.sound_head_node)

						blackboard.evaded_timer = t + 1 + math.random()
					elseif current_length > wanted_length - 1 then
						StatusUtils.set_grabbed_by_tentacle_network(target_unit, true, unit)

						data.sub_state = "grabbed"

						self:sync_state_to_clients(unit, blackboard, "attack", current_length, t)

						data.grabbed_timer = t + 2

						audio_system:play_audio_unit_event("Play_enemy_sorcerer_tentacle_foley_player_grabbed", unit, breed.sound_head_node)
					elseif is_at_full_length then
						data.sub_state = "target_too_far_away"

						self:sync_state_to_clients(unit, blackboard, "attack", current_length, t)
					end
				end
			end
		end
	end

	return true
end

BTTentacleAttackAction.dist_sqr_to_tentacle_tip = function (self, unit, tentacle_data, target_unit)
	local tip_node = tentacle_data.bone_nodes[tentacle_data.num_bone_nodes]
	local tentacle_tip_pos = Unit.world_position(unit, tip_node)
	local to_target = Vector3.flat(POSITION_LOOKUP[target_unit] - tentacle_tip_pos)
	local dist_sqr = Vector3.length_squared(to_target)

	return dist_sqr
end

BTTentacleAttackAction.target_evade_through_dodge_check = function (self, action, tentacle_data, target_unit, dist_to_tip_sqr)
	local target_status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if target_status_extension and target_status_extension.is_dodging and dist_to_tip_sqr > action.dodge_mitigation_radius_squared then
		return true
	end
end

BTTentacleAttackAction.target_tentacle_status_check = function (self, target_unit, status)
	local target_status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if target_status_extension and target_status_extension.grabbed_by_tentacle_status == status then
		return true
	end
end
