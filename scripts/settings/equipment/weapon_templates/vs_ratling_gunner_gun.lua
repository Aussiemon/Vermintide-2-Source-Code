-- chunkname: @scripts/settings/equipment/weapon_templates/vs_ratling_gunner_gun.lua

local action_one = "dark_pact_action_one"
local action_one_release = "dark_pact_action_one_release"
local action_one_hold = "dark_pact_action_one_hold"
local action_two = "dark_pact_action_two"
local action_reload = "dark_pact_reload"
local spinup_time = 1
local windup_decay = 0.2
local initial_rps = 15
local max_rps = 20
local time_at_max_rps = 3
local max_ammo = 120
local reload_time = 4
local SPINUP_ANIMATION_TIME = 2.1666666666666665
local SPINUP_ANIMATION_SCALE = SPINUP_ANIMATION_TIME / spinup_time
local WINDUP_SPEED = 1 / spinup_time
local INCREASED_RPS_PER_SHOT = (max_rps - initial_rps) / time_at_max_rps

local function shoot_condition_func(action_user, input_extension, ammo_extension)
	local status_extension = ScriptUnit.extension(action_user, "status_system")

	if status_extension:is_climbing() then
		return false
	end

	local ghost_mode_extension = ScriptUnit.extension(action_user, "ghost_mode_system")

	if ghost_mode_extension:is_in_ghost_mode() then
		return false
	end

	return not ammo_extension or ammo_extension:ammo_count() > 0
end

local function reload_condition_func(action_user, input_extension, ammo_extension)
	local status_extension = ScriptUnit.extension(action_user, "status_system")

	if status_extension:is_climbing() then
		return false
	end

	return ammo_extension and ammo_extension:can_reload()
end

local function update_ammo(owner_unit, weapon_unit)
	local ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	local current_ammo = ammo_extension:ammo_count()

	Managers.state.event:trigger("on_dark_pact_ammo_changed", owner_unit, current_ammo)
end

local weapon_template = {}

weapon_template.actions = {
	[action_one] = {
		default = {
			anim_event = "attack_shoot_start",
			charge_sound_husk_name = "Play_player_engineer_engine_charge_husk",
			charge_sound_husk_stop_event = "Stop_player_engineer_engine_loop_husk",
			charge_sound_name = "Play_player_engineer_engine_charge",
			charge_sound_stop_event = "Stop_player_engineer_engine_loop",
			disallow_ghost_mode = true,
			initial_windup = 0,
			kind = "minigun_spin",
			reload_when_out_of_ammo = true,
			weapon_action_hand = "left",
			windup_max = 1,
			windup_start_on_zero = true,
			anim_time_scale = SPINUP_ANIMATION_SCALE,
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_extension)
				input_extension:clear_input_buffer()
				input_extension:reset_release_input()
				weapon_extension:change_synced_state("winding")
			end,
			finish_function = function (owner_unit, reason, weapon_extension)
				if reason ~= "new_interupting_action" then
					weapon_extension:change_synced_state(nil)
				end
			end,
			total_time = spinup_time * SPINUP_ANIMATION_SCALE,
			hold_input = action_one_hold,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.35,
					start_time = 0,
					end_time = math.huge,
				},
			},
			allowed_chain_actions = {
				{
					auto_chain = true,
					sub_action = "fire",
					start_time = spinup_time * SPINUP_ANIMATION_SCALE,
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
			condition_func = shoot_condition_func,
			windup_speed = WINDUP_SPEED,
		},
		fire = {
			ammo_usage = 1,
			critical_hit_effect = "bullet_critical_impact",
			disallow_ghost_mode = true,
			dont_shoot_near_wall = true,
			hit_effect = "bullet_impact",
			kind = "minigun",
			looping_anim = true,
			near_wall_anim = "",
			power_level = 100,
			rps_loss_per_second = 1.5,
			shot_count = 1,
			spread_template_override = "vs_ratling_gunner_gun_shooting",
			weapon_action_hand = "left",
			hold_input = action_one_hold,
			chain_condition_func = shoot_condition_func,
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
				weapon_extension:change_synced_state("firing")
			end,
			finish_function = function (owner_unit, reason, weapon_extension)
				weapon_extension:change_synced_state(nil)
			end,
			initial_rounds_per_second = initial_rps,
			max_rps = max_rps,
			rps_gain_per_shot = INCREASED_RPS_PER_SHOT,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.4,
					start_time = 0,
					end_time = math.huge,
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
			lightweight_projectile_info = {
				collision_filter = "filter_enemy_player_afro_ray_projectile",
				template_name = "ratling_gunner_vs",
			},
		},
	},
	[action_reload] = {
		default = {
			anim_end_event = "cooldown_ready",
			anim_event = "wind_up_start",
			crosshair_style = "dot",
			kind = "dummy",
			weapon_action_hand = "either",
			condition_func = reload_condition_func,
			chain_condition_func = reload_condition_func,
			enter_function = function (owner_unit, input_extension, remaining_time, weapon_unit_extension)
				weapon_unit_extension:change_synced_state("reloading")

				local wwise_world = Managers.world:wwise_world(weapon_unit_extension.world)

				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_weapon_reload")
			end,
			finish_function = function (owner_unit, reason, weapon_unit_extension)
				weapon_unit_extension:change_synced_state(nil)

				local wwise_world = Managers.world:wwise_world(weapon_unit_extension.world)

				WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_weapon_reload")

				if reason == "action_complete" then
					local ammo_extension = ScriptUnit.extension(weapon_unit_extension.unit, "ammo_system")

					ammo_extension:add_ammo()
					update_ammo(owner_unit, weapon_unit_extension.unit)
				end
			end,
			total_time = reload_time,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.6,
					start_time = 0,
					end_time = math.huge,
				},
			},
			allowed_chain_actions = {
				{
					start_time = 0,
					sub_action = "default",
					input = action_two,
					action = action_two,
				},
			},
		},
	},
	[action_two] = {
		default = {
			kind = "dummy",
			total_time = 0,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	action_wield = ActionTemplates.wield,
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
weapon_template.crosshair_style = "default"
weapon_template.default_spread_template = "vs_ratling_gunner_gun"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.custom_data = {
	reload_progress = 0,
	windup = 0,
	windup_loss_per_second = windup_decay,
}

weapon_template.update = function (weapon_extension, dt, t)
	local windup = weapon_extension:get_custom_data("windup")
	local windup_loss_per_second = weapon_extension:get_custom_data("windup_loss_per_second")

	windup = windup - windup_loss_per_second * dt

	weapon_extension:set_custom_data("windup", windup)
end

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

local function set_windup_progress(career_extension, weapon_unit, override_value)
	local ability_name = "fire"
	local ability_id = career_extension:ability_id(ability_name)
	local ability_data = career_extension:get_activated_ability_data(ability_id)
	local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ability_data.priming_progress = override_value or weapon_extension:get_custom_data("windup")
end

weapon_template.synced_states = {
	winding = {
		clear_data_on_enter = true,
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			local wwise_world = Managers.world:wwise_world(world)

			if is_local_player then
				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_weapon_ready", weapon_unit)
			end
		end,
		update = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, dt)
			if not is_local_player then
				return
			end

			local career_extension = ScriptUnit.extension(owner_unit, "career_system")
			local ability_name = "fire"
			local ability_id = career_extension:ability_id(ability_name)
			local ability_data = career_extension:get_activated_ability_data(ability_id)
			local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

			ability_data.priming_progress = weapon_extension:get_custom_data("windup")

			set_windup_progress(career_extension, weapon_unit)
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			local wwise_world = Managers.world:wwise_world(world)

			if is_local_player then
				WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_weapon_ready", weapon_unit)

				if not is_destroy then
					local career_extension = ScriptUnit.extension(owner_unit, "career_system")

					set_windup_progress(career_extension, weapon_unit, 0)
				end
			end

			if not is_destroy and next_state ~= "firing" then
				if is_local_player then
					local fp_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					CharacterStateHelper.play_animation_event_first_person(fp_extension, "attack_finished")
					CharacterStateHelper.play_animation_event_first_person(fp_extension, "barrel_spin_finished")
				end

				Unit.animation_event(owner_unit, "no_anim_upperbody")
				Unit.animation_event(owner_unit, "to_combat")
				Unit.animation_event(owner_unit, "idle")
			end
		end,
	},
	firing = {
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			state_data.shoot_time = 0

			local use_occlusion = true
			local node_id = 0
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, weapon_unit, node_id)

			if is_local_player then
				Managers.state.vce:trigger_vce(owner_unit, wwise_world, "Play_player_enemy_vce_ratling_gunner_shoot_start", use_occlusion, wwise_source_id)
				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)
			else
				Managers.state.vce:trigger_vce(owner_unit, wwise_world, "Play_player_enemy_vce_ratling_gunner_shoot_start_husk", use_occlusion, wwise_source_id)
				WwiseWorld.trigger_event(wwise_world, "Play_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)
			end

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", 0)

			state_data.shoot_sound_source_id = wwise_source_id
		end,
		update = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, dt)
			if is_local_player then
				update_ammo(owner_unit, weapon_unit)
			end

			if state_data.shoot_time > time_at_max_rps then
				return
			end

			state_data.shoot_time = state_data.shoot_time + dt

			local wwise_source_id = state_data.shoot_sound_source_id
			local time_shooting_percent = state_data.shoot_time / time_at_max_rps
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", time_shooting_percent)
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			if not is_destroy then
				if is_local_player then
					local fp_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					CharacterStateHelper.play_animation_event_first_person(fp_extension, "attack_finished")
					update_ammo(owner_unit, weapon_unit)
				end

				Unit.animation_event(owner_unit, "no_anim_upperbody")
				Unit.animation_event(owner_unit, "to_combat")
			end

			local wwise_world = Managers.world:wwise_world(world)

			if is_local_player then
				WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_shooting_loop", weapon_unit)
			else
				WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", weapon_unit)
			end

			state_data.shoot_sound_source_id = nil
			state_data.shoot_time = nil
		end,
	},
	reloading = {
		enter = function (self, owner_unit, weapon_unit, state_data, is_local_player, world)
			if is_local_player then
				state_data.time_in_reload = 0
			end

			local owner_player = Managers.player:owner(owner_unit)

			if owner_player.remote or owner_player.bot_player then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_weapon_reload_husk", weapon_unit)
			end
		end,
		update = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, dt)
			if not is_local_player then
				return
			end

			state_data.time_in_reload = state_data.time_in_reload + dt

			local reload_fraction = state_data.time_in_reload / reload_time
			local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

			weapon_extension:set_custom_data("reload_progress", reload_fraction)
		end,
		leave = function (self, owner_unit, weapon_unit, state_data, is_local_player, world, next_state, is_destroy)
			if not is_destroy then
				if is_local_player then
					local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

					weapon_extension:set_custom_data("reload_progress", 0)
				end

				local owner_player = Managers.player:owner(owner_unit)

				if owner_player.remote or owner_player.bot_player then
					Unit.animation_event(owner_unit, "no_anim_upperbody")
					Unit.animation_event(owner_unit, "to_combat")
					Unit.animation_event(owner_unit, "idle")

					local wwise_world = Managers.world:wwise_world(world)

					WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_weapon_reload_husk", weapon_unit)
				end
			end
		end,
	},
}
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.vs_ratling_gunner_gun.left
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_immediately_available = true,
	infinite_ammo = true,
	play_reload_anim_on_wield_reload = true,
	reload_time = 0,
	ammo_per_reload = max_ammo,
	starting_reserve_ammo = max_ammo,
	ammo_per_clip = max_ammo,
	max_ammo = max_ammo,
}

return {
	vs_ratling_gunner_gun = weapon_template,
}
