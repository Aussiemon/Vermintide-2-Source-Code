-- chunkname: @scripts/settings/equipment/weapon_templates/vs_warpfire_thrower_gun.lua

local action_one = "dark_pact_action_one"
local action_one_release = "dark_pact_action_one_release"
local action_one_hold = "dark_pact_action_one_hold"
local action_two = "dark_pact_action_two"
local action_reload = "dark_pact_reload"
local action_reload_hold = "dark_pact_reload_hold"
local push_radius = 2
local time_mod = 0.9
local fire_time = 0.1

local function shoot_condition_func(action_user, input_extension)
	local status_extension = ScriptUnit.extension(action_user, "status_system")

	if status_extension:is_climbing() then
		return false
	end

	local ghost_mode_extension = ScriptUnit.extension(action_user, "ghost_mode_system")

	if ghost_mode_extension:is_in_ghost_mode() then
		return false
	end

	return true
end

local weapon_template = {}

weapon_template.actions = {
	[action_one] = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_shoot_start",
			anim_time_scale = 1,
			disallow_ghost_mode = true,
			kind = "dummy",
			minimum_hold_time = 0.1,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			hold_input = action_one_hold,
			fire_time = fire_time,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.75,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					auto_chain = true,
					sub_action = "fire",
					start_time = fire_time,
					action = action_one,
				},
				{
					hold_allowed = true,
					start_time = 0,
					sub_action = "default",
					input = action_reload,
					action = action_reload,
				},
			},
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_extension)
				input_extension:clear_input_buffer()
				input_extension:reset_release_input()
				weapon_extension:change_synced_state("priming")
			end,
			finish_function = function (owner_unit, reason, weapon_extension)
				weapon_extension:change_synced_state(nil)
			end,
			condition_func = function (action_user, input_extension)
				local can_start_shooting = shoot_condition_func(action_user, input_extension)

				if not can_start_shooting then
					return false
				end

				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() <= 0
			end,
		},
		fire = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "wind_up_start",
			anim_event = "attack_shoot_start",
			anim_time_scale = 4,
			attack_range = 10,
			buff_name_close = "vs_warpfire_thrower_short_distance_damage",
			buff_name_far = "vs_warpfire_thrower_long_distance_damage",
			close_attack_range = 7,
			cooling_sound_event = "player_enemy_warpfire_steam_after_flame_start",
			damage_interval = 0.25,
			damage_profile = "flamethrower_spray",
			disallow_ghost_mode = true,
			fire_sound_event = "player_enemy_warpfire_thrower_shoot_start",
			fire_sound_on_husk = true,
			fire_time = 0,
			fx_node = "p_fx",
			hit_effect = "fx/wpnfx_flamethrower_hit_01",
			husk_fire_sound_event = "husk_warpfire_thrower_shoot_start",
			husk_stop_sound_event = "husk_warpfire_thrower_shoot_end",
			is_spell = false,
			kind = "warpfire_thrower",
			no_headshot_sound = true,
			overcharge_interval = 0.5,
			overcharge_type = "vs_warpfire_thrower_normal",
			particle_effect_cooling = "fx/wpnfx_warpfire_gun_cooldown_1p",
			particle_effect_flames = "fx/chr_warp_fire_flamethrower_01_1p_versus",
			particle_effect_flames_3p = "fx/chr_warp_fire_flamethrower_01",
			particle_effect_impact = "fx/wpnfx_flamethrower_hit_01",
			shoot_warpfire_attack_range = 10,
			shoot_warpfire_close_attack_cooldown = 0.2,
			shoot_warpfire_close_attack_dot = 0.9,
			shoot_warpfire_close_attack_hit_radius = 1.5,
			shoot_warpfire_close_attack_range = 7,
			shoot_warpfire_max_flame_time = 5,
			shoot_warpfire_minimum_forced_cooldown = 0.6,
			stop_sound_event = "player_enemy_warpfire_thrower_shoot_end",
			using_blob = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			hold_input = action_one_hold,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					external_multiplier = 0.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					start_time = 0,
					sub_action = "default",
					input = action_reload,
					action = action_reload,
				},
			},
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_extension)
				input_extension:clear_input_buffer()
				input_extension:reset_release_input()
				weapon_extension:change_synced_state("shooting")
			end,
			finish_function = function (owner_unit, reason, weapon_extension)
				if reason ~= "new_interupting_action" then
					if reason == "dead" then
						weapon_extension:change_synced_state(nil)
					else
						weapon_extension:change_synced_state("cooling_down")
					end
				end
			end,
		},
	},
	[action_reload] = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "wind_up_start",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_sound_name = "player_enemy_warpfire_steam_after_flame_start",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			crosshair_style = "dot",
			disallow_ghost_mode = true,
			do_not_validate_with_hold = true,
			kind = "charge",
			minimum_hold_time = 0.5,
			particle_effect_cooling = "fx/wpnfx_warpfire_gun_cooldown_1p",
			uninterruptible = true,
			vent_overcharge = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			hold_input = action_reload_hold,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.8,
					start_time = 0,
				},
			},
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
				weapon_extension:change_synced_state("cooling_down")
			end,
			finish_function = function (owner_unit, reason, weapon_extension)
				if reason ~= "new_interupting_action" then
					weapon_extension:change_synced_state(nil)
				end
			end,
			allowed_chain_actions = {},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() > 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() > 0
			end,
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}

local function update_warpfire_vfx(owner_unit, weapon_unit, state_data, world)
	local current_action = state_data.current_action
	local muzzle_node = state_data.muzzle_node
	local muzzle_position = Unit.world_position(weapon_unit, muzzle_node)
	local muzzle_rotation = Unit.world_rotation(weapon_unit, muzzle_node)
	local flamethrower_effect = state_data.flamethrower_effect
	local flamethrower_effect_name = state_data.flamethrower_effect_name
	local physics_world = World.physics_world(world)
	local raycast_filter = "filter_in_line_of_sight_no_players_no_enemies"
	local max_length = current_action.attack_range * 2
	local game = Managers.state.network:game()
	local game_object_id = Managers.state.unit_storage:go_id(owner_unit)
	local aim_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")
	local _, _, length = PhysicsWorld.raycast(physics_world, muzzle_position, aim_direction, max_length, "all", "types", "both", "closest", "collision_filter", raycast_filter)

	length = length or max_length

	local muzzle_forward = Quaternion.forward(muzzle_rotation)
	local effect_variable_id = World.find_particles_variable(world, flamethrower_effect_name, "firepoint_1")

	World.set_particles_variable(world, flamethrower_effect, effect_variable_id, muzzle_position - Vector3.up())

	local end_point = muzzle_position + muzzle_forward * length - Vector3.up()

	effect_variable_id = World.find_particles_variable(world, flamethrower_effect_name, "firepoint_2")

	World.set_particles_variable(world, flamethrower_effect, effect_variable_id, end_point)

	effect_variable_id = World.find_particles_variable(world, flamethrower_effect_name, "firelife_1")

	local lifetime = length / 4
	local particle_life_time = state_data.particle_life_time
	local particle_life_time_vector = particle_life_time and particle_life_time:unbox() or Vector3(1, 0, 0)

	particle_life_time_vector.x = lifetime

	World.set_particles_variable(world, flamethrower_effect, effect_variable_id, particle_life_time_vector)
end

weapon_template.synced_states = {
	priming = {
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			local node_id = 0

			if is_local_player then
				Managers.state.vce:trigger_vce_unit(owner_unit, world, "player_enemy_vce_warpfire_shoot_start_sequence", weapon_unit, node_id)
			else
				Managers.state.vce:trigger_vce_unit(owner_unit, world, "husk_vce_warpfire_shoot_start_sequence", weapon_unit, node_id)
			end
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			if next_state ~= "shooting" and owner_unit and is_local_player then
				-- Nothing
			end
		end,
	},
	shooting = {
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			local current_action = weapon_template.actions.dark_pact_action_one.fire
			local node_name = current_action.fx_node
			local muzzle_node = Unit.node(weapon_unit, node_name)
			local muzzle_position = Unit.world_position(weapon_unit, muzzle_node)
			local muzzle_rotation = Unit.world_rotation(weapon_unit, muzzle_node)
			local flamethrower_effect_name = current_action.particle_effect_flames
			local flamethrower_effect = World.create_particles(world, flamethrower_effect_name, muzzle_position, muzzle_rotation)

			World.link_particles(world, flamethrower_effect, weapon_unit, muzzle_node, Matrix4x4.identity(), "destroy")

			if current_action.fire_sound_event then
				local node_id = 0

				if is_local_player then
					WwiseUtils.trigger_unit_event(world, "player_enemy_warpfire_thrower_shoot_end", weapon_unit, node_id)
					WwiseUtils.trigger_unit_event(world, "player_enemy_warpfire_thrower_shoot_start", weapon_unit, node_id)
				else
					WwiseUtils.trigger_unit_event(world, "husk_warpfire_thrower_shoot_end", weapon_unit, node_id)
					WwiseUtils.trigger_unit_event(world, "husk_warpfire_thrower_shoot_start", weapon_unit, node_id)
				end
			end

			if is_local_player and not Managers.player:owner(owner_unit).bot_player and not state_data.rumble_effect_id then
				state_data.rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
					rumble_effect = "reload_start",
				})
			end

			state_data.flamethrower_effect_name = flamethrower_effect_name
			state_data.flamethrower_effect = flamethrower_effect
			state_data.muzzle_node = muzzle_node
			state_data.weapon_unit = weapon_unit
			state_data.current_action = current_action
			state_data.particle_life_time = Vector3Box(1, 0, 0)

			if is_local_player then
				state_data.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
			end
		end,
		update = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, dt)
			update_warpfire_vfx(owner_unit, weapon_unit, state_data, world)
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			if is_local_player and state_data.rumble_effect_id then
				Managers.state.controller_features:stop_effect(state_data.rumble_effect_id)

				state_data.rumble_effect_id = nil
			end

			if not is_destroy and state_data.flamethrower_effect then
				World.stop_spawning_particles(world, state_data.flamethrower_effect)
			end

			local node_id = 0

			if Unit.alive(weapon_unit) then
				if is_local_player then
					WwiseUtils.trigger_unit_event(world, "player_enemy_warpfire_thrower_shoot_end", weapon_unit, node_id)
				else
					WwiseUtils.trigger_unit_event(world, "husk_warpfire_thrower_shoot_end", weapon_unit, node_id)
				end
			end

			if not is_destroy then
				if is_local_player then
					CharacterStateHelper.play_animation_event(owner_unit, "wind_up_start")
					CharacterStateHelper.play_animation_event_first_person(state_data.first_person_extension, "wind_up_start")
				else
					CharacterStateHelper.play_animation_event(owner_unit, "wind_up_start")
				end
			end
		end,
	},
	cooling_down = {
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			if is_local_player and state_data.rumble_effect_id then
				Managers.state.controller_features:stop_effect(state_data.rumble_effect_id)

				state_data.rumble_effect_id = nil
			end

			local fire_action = weapon_template.actions.dark_pact_action_one.fire
			local node_id = 0

			if is_local_player then
				WwiseUtils.trigger_unit_event(world, fire_action.stop_sound_event, owner_unit, node_id)
			else
				WwiseUtils.trigger_unit_event(world, fire_action.husk_stop_sound_event, owner_unit, node_id)
			end

			Unit.flow_event(weapon_unit, "wind_up_start")

			if Unit.alive(owner_unit) then
				if is_local_player then
					state_data.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					state_data.first_person_extension:play_hud_sound_event(fire_action.cooling_sound_event)
				end

				local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

				state_data.prev_overcharge = math.huge
				state_data.overcharge_extension = overcharge_extension
			end
		end,
		update = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, dt, weapon_extension)
			local overcharge_extension = state_data.overcharge_extension
			local current_overcharge = overcharge_extension:get_overcharge_value()

			if current_overcharge <= 0 and state_data.prev_overcharge ~= 0 and is_local_player then
				weapon_extension:change_synced_state(nil)
			else
				state_data.prev_overcharge = current_overcharge
			end
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			if Unit.alive(owner_unit) then
				if is_local_player then
					CharacterStateHelper.play_animation_event_first_person(state_data.first_person_extension, "cooldown_ready")
					CharacterStateHelper.play_animation_event(owner_unit, "cooldown_ready")
				else
					CharacterStateHelper.play_animation_event(owner_unit, "cooldown_ready")
				end
			end

			if is_local_player then
				WwiseUtils.trigger_unit_event(world, "player_enemy_warpfire_steam_after_flame_stop", weapon_unit, 0)
				Unit.flow_event(weapon_unit, "cooldown_ready")
			else
				Unit.flow_event(weapon_unit, "cooldown_ready")
			end
		end,
	},
}
weapon_template.left_hand_unit = "units/weapons/player/dark_pact/wpn_skaven_warpfiregun/wpn_skaven_warpfiregun"
weapon_template.right_hand_attachment_node_linking = nil
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.vs_warpfire_thrower_gun.left
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_axes"
weapon_template.wield_anim = "idle"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 6
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.sound_event_block_within_arc = "weapon_foley_blunt_1h_block_wood"
weapon_template.crosshair_style = "shotgun"
weapon_template.default_spread_template = "vs_warpfire_thrower_gun"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.overcharge_data = {
	max_value = 100,
	overcharge_threshold = 25,
	overcharge_value_decrease_rate = 10,
	time_until_overcharge_decreases = 0.1,
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
	},
	hold_attack = {
		arc = 0,
	},
}
weapon_template.aim_assist_settings = {
	base_multiplier = 0,
	effective_max_range = 4,
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	breed_scalars = {
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5,
		skaven_storm_vermin = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 4,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_shield_breaking",
}
weapon_template.tooltip_compare = {
	light = {
		sub_action_name = "light_attack_left",
		action_name = action_one,
	},
}
weapon_template.tooltip_detail = {
	light = {
		sub_action_name = "default",
		action_name = action_one,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_axes",
}

return {
	vs_warpfire_thrower_gun = weapon_template,
}
