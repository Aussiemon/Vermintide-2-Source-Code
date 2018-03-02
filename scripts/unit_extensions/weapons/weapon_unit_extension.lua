require("scripts/unit_extensions/weapons/actions/action_charge")
require("scripts/unit_extensions/weapons/actions/action_dummy")
require("scripts/unit_extensions/weapons/actions/action_melee_start")
require("scripts/unit_extensions/weapons/actions/action_chain_action_passthrough")
require("scripts/unit_extensions/weapons/actions/action_wield")
require("scripts/unit_extensions/weapons/actions/action_bounty_hunter_handgun")
require("scripts/unit_extensions/weapons/actions/action_handgun")
require("scripts/unit_extensions/weapons/actions/action_interaction")
require("scripts/unit_extensions/weapons/actions/action_self_interaction")
require("scripts/unit_extensions/weapons/actions/action_push_stagger")
require("scripts/unit_extensions/weapons/actions/action_sweep")
require("scripts/unit_extensions/weapons/actions/action_block")
require("scripts/unit_extensions/weapons/actions/action_throw")
require("scripts/unit_extensions/weapons/actions/action_instant_wield")
require("scripts/unit_extensions/weapons/actions/action_staff")
require("scripts/unit_extensions/weapons/actions/action_bow")
require("scripts/unit_extensions/weapons/actions/action_true_flight_bow")
require("scripts/unit_extensions/weapons/actions/action_true_flight_bow_aim")
require("scripts/unit_extensions/weapons/actions/action_handgun_lock")
require("scripts/unit_extensions/weapons/actions/action_handgun_lock_targeting")
require("scripts/unit_extensions/weapons/actions/action_bullet_spray")
require("scripts/unit_extensions/weapons/actions/action_bullet_spray_targeting")
require("scripts/unit_extensions/weapons/actions/action_flamethrower")
require("scripts/unit_extensions/weapons/actions/action_flamepatch")
require("scripts/unit_extensions/weapons/actions/action_aim")
require("scripts/unit_extensions/weapons/actions/action_shotgun")
require("scripts/unit_extensions/weapons/actions/action_crossbow")
require("scripts/unit_extensions/weapons/actions/action_cancel")
require("scripts/unit_extensions/weapons/actions/action_potion")
require("scripts/unit_extensions/weapons/actions/action_shield_slam")
require("scripts/unit_extensions/weapons/actions/action_charged_projectile")
require("scripts/unit_extensions/weapons/actions/action_beam")
require("scripts/unit_extensions/weapons/actions/action_geiser")
require("scripts/unit_extensions/weapons/actions/action_geiser_targeting")
require("scripts/unit_extensions/weapons/actions/action_throw_grimoire")
require("scripts/unit_extensions/weapons/actions/action_healing_draught")
require("scripts/unit_extensions/weapons/actions/action_career_base")
require("scripts/unit_extensions/weapons/actions/action_career_cancel")
require("scripts/unit_extensions/weapons/actions/action_career_dr_ranger")
require("scripts/unit_extensions/weapons/actions/action_career_bw_scholar")
require("scripts/unit_extensions/weapons/actions/action_career_we_waywatcher")
require("scripts/unit_extensions/weapons/actions/action_career_wh_bountyhunter")

function weapon_printf(...)
	if script_data.debug_weapons then
		printf(...)
	end

	return 
end

if Development.parameter("debug_weapons") then
	script_data.debug_weapons = true
end

local action_classes = {
	career_cancel = ActionCareerCancel,
	charge = ActionCharge,
	dummy = ActionDummy,
	melee_start = ActionMeleeStart,
	chain_action_passthrough = ChainActionPassthrough,
	wield = ActionWield,
	bounty_hunter_handgun = ActionBountyHunterHandgun,
	handgun = ActionHandgun,
	interaction = ActionInteraction,
	self_interaction = ActionSelfInteraction,
	push_stagger = ActionPushStagger,
	sweep = ActionSweep,
	block = ActionBlock,
	throw = ActionThrow,
	staff = ActionStaff,
	bow = ActionBow,
	true_flight_bow = ActionTrueFlightBow,
	true_flight_bow_aim = ActionTrueFlightBowAim,
	crossbow = ActionCrossbow,
	cancel = ActionCancel,
	buff = ActionPotion,
	handgun_lock_targeting = ActionHandgunLockTargeting,
	handgun_lock = ActionHandgunLock,
	bullet_spray_targeting = ActionBulletSprayTargeting,
	bullet_spray = ActionBulletSpray,
	aim = ActionAim,
	shotgun = ActionShotgun,
	shield_slam = ActionShieldSlam,
	charged_projectile = ActionChargedProjectile,
	beam = ActionBeam,
	geiser_targeting = ActionGeiserTargeting,
	geiser = ActionGeiser,
	instant_wield = ActionInstantWield,
	throw_grimoire = ActionThrowGrimoire,
	healing_draught = ActionHealingDraught,
	flamethrower = ActionFlamethrower,
	flamepatch = ActionFlamepatch,
	career_dr_three = ActionCareerDRRanger,
	career_bw_one = ActionCareerBWScholar,
	career_we_three = ActionCareerWEWaywatcher,
	career_wh_two = ActionCareerWHBountyhunter
}

local function create_attack(item_name, attack_kind, world, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	return action_classes[attack_kind]:new(world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

local function is_within_damage_window(current_time_in_action, action, owner_unit)
	local damage_window_start = action.damage_window_start
	local damage_window_end = action.damage_window_end

	if not damage_window_start and not damage_window_end then
		return false
	end

	local anim_time_scale = action.anim_time_scale or 1
	anim_time_scale = ActionUtils.apply_attack_speed_buff(anim_time_scale, owner_unit)
	damage_window_start = damage_window_start/anim_time_scale
	damage_window_end = damage_window_end or action.total_time or math.huge
	damage_window_end = damage_window_end/anim_time_scale
	local after_start = damage_window_start < current_time_in_action
	local before_end = current_time_in_action < damage_window_end

	return after_start and before_end
end

local function is_within_a_chain_window(current_time_in_action, action, owner_unit)
	local attack_speed_modifier = action.anim_time_scale or 1
	attack_speed_modifier = ActionUtils.apply_attack_speed_buff(attack_speed_modifier, owner_unit)
	local allowed_chain_actions = action.allowed_chain_actions
	local num_chain_actions = #allowed_chain_actions

	for i = 1, num_chain_actions, 1 do
		local chain_info = allowed_chain_actions[i]
		local start_time = chain_info.start_time or 0
		local end_time = chain_info.end_time or math.huge
		local modified_start_time = start_time/attack_speed_modifier
		local after_start = modified_start_time < current_time_in_action
		local before_end = current_time_in_action < end_time

		if after_start and before_end then
			return true
		end
	end

	return false
end

WeaponUnitExtension = class(WeaponUnitExtension)
WeaponUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.weapon_system = extension_init_data.weapon_system
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	local owner_unit = extension_init_data.owner_unit
	self.owner_unit = owner_unit
	self.item_name = extension_init_data.item_name
	local first_person_unit = extension_init_data.first_person_rig
	self.first_person_unit = first_person_unit
	local actual_damage_unit = World.spawn_unit(world, "units/weapons/player/wpn_damage/wpn_damage")

	Unit.disable_physics(actual_damage_unit)
	Unit.set_unit_visibility(actual_damage_unit, false)

	if first_person_unit then
		local attach_nodes = extension_init_data.attach_nodes
		local attachment_nodes = attach_nodes[1]
		local source_node = attachment_nodes.source
		local target_node = "root_point"
		local target_node = 0
		local source_node_index = (type(source_node) == "string" and Unit.node(first_person_unit, source_node)) or source_node
		local target_node_index = (type(target_node) == "string" and Unit.node(actual_damage_unit, target_node)) or target_node

		World.link_unit(world, actual_damage_unit, target_node_index, first_person_unit, source_node_index)
	end

	self.actual_damage_unit = actual_damage_unit
	self.actions = {}
	self.action_buff_data = {
		buff_start_times = {},
		buff_end_times = {},
		action_buffs_in_progress = {},
		buff_identifiers = {}
	}
	self.cooldown_timer = 0
	self.chain_action_sound_played = {}
	self.is_server = Managers.state.network.network_transmit.is_server
	local player_manager = Managers.player
	local player = player_manager.unit_owner(player_manager, owner_unit)

	if player and player.bot_player then
		self.bot_attack_data = {
			request = {}
		}
	end

	return 
end
WeaponUnitExtension.extensions_ready = function (self, world, unit)
	if ScriptUnit.has_extension(unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(unit, "ammo_system")
	end

	return 
end
WeaponUnitExtension.destroy = function (self)
	if self.current_action_settings then
		local action_kind = self.current_action_settings.kind
		local attack_prev = self.actions[action_kind]

		if attack_prev.destroy then
			attack_prev.destroy(attack_prev)
		end
	end

	return 
end
WeaponUnitExtension.get_action = function (self, action_name, sub_action_name, actions)
	local sub_actions = actions[action_name]
	local action = sub_actions[sub_action_name]

	return action
end
local interupting_action_data = {}
WeaponUnitExtension.start_action = function (self, action_name, sub_action_name, actions, t, power_level, action_init_data)
	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")
	local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
	local status_extension = ScriptUnit.extension(self.owner_unit, "status_system")
	local current_action_settings = self.current_action_settings
	local new_action = action_name
	local new_sub_action = sub_action_name

	table.clear(interupting_action_data)

	if t < self.cooldown_timer and new_action then
		local action_settings = self.get_action(self, new_action, new_sub_action, actions)

		if action_settings.cooldown ~= nil then
			new_action, new_sub_action = nil
		end
	end

	if new_action then
		local action_settings = self.get_action(self, new_action, new_sub_action, actions)
		local action_kind = action_settings.kind
		self.actions[action_kind] = self.actions[action_kind] or create_attack(self.item_name, action_kind, self.world, self.is_server, self.owner_unit, self.actual_damage_unit, self.first_person_unit, self.unit, self.weapon_system)
	end

	local ammo_extension = self.ammo_extension

	if ammo_extension ~= nil and new_action then
		local action = self.get_action(self, new_action, new_sub_action, actions)
		local ammo_requirement = action.ammo_requirement or action.ammo_usage or 0
		local ammo_count = ammo_extension.ammo_count(ammo_extension)
		local action_can_abort_reload = (action.can_abort_reload == nil and true) or action.can_abort_reload

		if ammo_extension.is_reloading(ammo_extension) then
			if ammo_requirement <= ammo_count and action_can_abort_reload then
				ammo_extension.abort_reload(ammo_extension)
			else
				new_action, new_sub_action = nil
			end
		elseif ammo_count < ammo_requirement then
			if ammo_extension.total_remaining_ammo(ammo_extension) == 0 and (not self.reload_failed_timer or self.reload_failed_timer < t) and (not action.interaction_type or action.interaction_type ~= "heal") then
				local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.fail_reason = "out_of_ammo"
				event_data.item_name = "ranged_weapon"
				local event_name = "reload_failed"

				dialogue_input.trigger_networked_dialogue_event(dialogue_input, event_name, event_data)

				self.reload_failed_timer = t + 5
			end

			new_action, new_sub_action = nil
		end
	end

	local chain_action_data = nil

	if new_action and current_action_settings then
		interupting_action_data.new_action = new_action
		interupting_action_data.new_sub_action = new_sub_action
		chain_action_data = self._finish_action(self, "new_interupting_action", interupting_action_data)
	end

	if new_action then
		local owner_unit = self.owner_unit
		local locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")

		if locomotion_extension.is_stood_still(locomotion_extension) then
			local look_rotation = first_person_extension.current_rotation(first_person_extension)

			locomotion_extension.set_stood_still_target_rotation(locomotion_extension, look_rotation)
		end

		chain_action = current_action_settings ~= nil
		current_action_settings = self.get_action(self, new_action, new_sub_action, actions)

		if not chain_action and current_action_settings.aim_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			eyetracking_extension.set_is_aiming(eyetracking_extension, true)

			if eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_aim_at_gaze") then
				local gaze_rotation = eyetracking_extension.gaze_rotation(eyetracking_extension)
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension.force_look_rotation(first_person_extension, gaze_rotation, 1)
			end
		end

		self.current_action_settings = current_action_settings
		local first_person_unit = self.first_person_unit

		if not current_action_settings.looping_anim then
			Unit.animation_event(first_person_unit, "equip_interrupt")
		end

		table.clear(self.chain_action_sound_played)

		local allowed_chain_actions = current_action_settings.allowed_chain_actions
		local num_chain_actions = #allowed_chain_actions

		for i = 1, num_chain_actions, 1 do
			local chain_info = allowed_chain_actions[i]
			self.chain_action_sound_played[i] = false
		end

		local action_kind = current_action_settings.kind
		local action = self.actions[action_kind]
		local time_to_complete = current_action_settings.total_time

		if current_action_settings.scale_total_time_on_mastercrafted and buff_extension then
			time_to_complete = buff_extension.apply_buffs_to_value(buff_extension, time_to_complete, StatBuffIndex.RELOAD_SPEED)
		end

		local event = current_action_settings.anim_event
		local event_3p = current_action_settings.anim_event_3p or event
		local looping_event = current_action_settings.looping_anim

		for _, data in pairs(self.action_buff_data) do
			table.clear(data)
		end

		local buff_data = current_action_settings.buff_data

		if buff_data then
			ActionUtils.init_action_buff_data(self.action_buff_data, buff_data, t)

			self.buff_data = buff_data
		end

		status_extension._current_action = new_action

		action.client_owner_start_action(action, current_action_settings, t, chain_action_data, power_level, action_init_data)

		local aim_assist_ramp_multiplier = current_action_settings.aim_assist_ramp_multiplier

		if aim_assist_ramp_multiplier then
			local aim_assist_max_ramp_multiplier = current_action_settings.aim_assist_max_ramp_multiplier
			local aim_assist_ramp_decay_delay = current_action_settings.aim_assist_ramp_decay_delay

			first_person_extension.increase_aim_assist_multiplier(first_person_extension, aim_assist_ramp_multiplier, aim_assist_max_ramp_multiplier, aim_assist_ramp_decay_delay)
		end

		if self.ammo_extension then
			if self.ammo_extension:total_remaining_ammo() == 0 then
				if not current_action_settings.anim_event_no_ammo_left then
				end
			elseif self.ammo_extension:total_remaining_ammo() == 1 and not current_action_settings.anim_event_last_ammo then
			end
		end

		self.action_time_started = t
		self.action_time_done = t + time_to_complete

		if current_action_settings.cooldown then
			self.cooldown_timer = t + current_action_settings.cooldown
		end

		if current_action_settings.enter_function then
			local input_extension = ScriptUnit.extension(owner_unit, "input_system")

			current_action_settings.enter_function(owner_unit, input_extension)
		end

		if event then
			local anim_time_scale = current_action_settings.anim_time_scale or 1
			anim_time_scale = ActionUtils.apply_attack_speed_buff(anim_time_scale, owner_unit)
			local go_id = Managers.state.unit_storage:go_id(owner_unit)
			local event_id = NetworkLookup.anims[event_3p]
			local variable_id = NetworkLookup.anims.attack_speed

			if not LEVEL_EDITOR_TEST then
				if self.is_server then
					Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event_variable_float", event_id, go_id, variable_id, anim_time_scale)
				else
					Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event_variable_float", event_id, go_id, variable_id, anim_time_scale)
				end
			end

			if PLATFORM ~= "win32" and event == "attack_shoot" then
				anim_time_scale = anim_time_scale*1.2
			end

			local first_person_variable_id = Unit.animation_find_variable(first_person_unit, "attack_speed")

			Unit.animation_set_variable(first_person_unit, first_person_variable_id, anim_time_scale)

			if not looping_event or (looping_event and not self._looping_anim_event_started) then
				Unit.animation_event(first_person_unit, event)

				if looping_event then
					self._looping_anim_event_started = true
				end
			end

			local third_person_variable_id = Unit.animation_find_variable(owner_unit, "attack_speed")

			Unit.animation_set_variable(owner_unit, third_person_variable_id, anim_time_scale)

			if not looping_event or (looping_event and not self._looping_anim_event_started) then
				Unit.animation_event(owner_unit, event_3p)

				if looping_event then
					self._looping_anim_event_started = true
				end
			end

			if current_action_settings.apply_recoil then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension.apply_recoil(first_person_extension)
				first_person_extension.play_camera_recoil(first_person_extension, current_action_settings.recoil_settings, t)
			end
		end
	end

	return 
end
WeaponUnitExtension.stop_action = function (self, reason, data)
	if self.has_current_action(self) then
		self._finish_action(self, reason, data)
	end

	return 
end
WeaponUnitExtension._finish_action = function (self, reason, data)
	local current_action_settings = self.current_action_settings
	local action_kind = current_action_settings.kind
	local action = self.actions[action_kind]

	if Application.user_setting("tobii_eyetracking") and ScriptUnit.has_extension(self.owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(self.owner_unit, "eyetracking_system")

		if reason == "hold_input_released" then
			eyetracking_extension.set_is_aiming(eyetracking_extension, false)
			eyetracking_extension.set_aim_at_gaze_cancelled(eyetracking_extension, false)
		end
	end

	local buff_data = current_action_settings.buff_data

	if buff_data then
		ActionUtils.remove_action_buff_data(self.action_buff_data, buff_data, self.owner_unit)
	end

	for _, data in pairs(self.action_buff_data) do
		table.clear(data)
	end

	self._handle_proc_events(self, current_action_settings, reason)

	local chain_action_data = action.finish(action, reason, data)

	self.anim_end_event(self, reason, current_action_settings)

	if self.bot_attack_data then
		self.clear_bot_attack_request(self)
	end

	self.current_action_settings = nil

	return chain_action_data
end
WeaponUnitExtension._handle_proc_events = function (self, current_action_settings, reason)
	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")

	if current_action_settings.is_spell then
		buff_extension.trigger_procs(buff_extension, "on_spell_used", current_action_settings)
	end

	return 
end
WeaponUnitExtension.anim_end_event = function (self, reason, current_action_settings)
	local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
	local event = current_action_settings.anim_end_event
	local anim_end_event_condition_func = current_action_settings.anim_end_event_condition_func
	local do_event = (not anim_end_event_condition_func and true) or anim_end_event_condition_func(self.owner_unit, reason)

	if event and do_event then
		local event_id = NetworkLookup.anims[event]

		if not LEVEL_EDITOR_TEST then
			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end

		Unit.animation_event(self.first_person_unit, event)
		Unit.animation_event(self.owner_unit, event)

		self._looping_anim_event_started = nil
	end

	return 
end
WeaponUnitExtension.update = function (self, unit, input, dt, context, t)
	local current_action_settings = self.current_action_settings

	if current_action_settings then
		local owner_unit = self.owner_unit

		if script_data.debug_weapons then
			local player_manager = Managers.player
			local player = player_manager.owner(player_manager, owner_unit)
			local profile_display_name = player.profile_display_name(player)
			local lookup_data = current_action_settings.lookup_data
			local current_time_in_action = t - self.action_time_started

			Debug.text("Action time:    %.2f", current_time_in_action)
			Debug.text("Current Action: %s/%s", lookup_data.action_name, lookup_data.sub_action_name)
			Debug.text("Can chain:      %s", tostring(is_within_a_chain_window(current_time_in_action, self.current_action_settings, owner_unit)))
			Debug.text("Can do damage:  %s", tostring(is_within_damage_window(current_time_in_action, self.current_action_settings, owner_unit)))
			Debug.text("Weapon Template: %s", lookup_data.item_template_name)
			Debug.text("Player:  %s", tostring(profile_display_name))
		end

		local wwise_world = Managers.world:wwise_world(self.world)
		local allowed_chain_actions = current_action_settings.allowed_chain_actions
		local num_chain_actions = #allowed_chain_actions

		for i = 1, num_chain_actions, 1 do
			local chain_info = allowed_chain_actions[i]
			local chain_ready_sound = chain_info.chain_ready_sound

			if chain_ready_sound then
				local time_offset = chain_info.sound_time_offset or 0
				local sound_ready = self.is_chain_action_available(self, chain_info, t, time_offset)

				if sound_ready and not self.chain_action_sound_played[i] then
					WwiseWorld.trigger_event(wwise_world, chain_ready_sound)

					self.chain_action_sound_played[i] = true
				end
			end
		end

		if self.action_time_done < t then
			self._finish_action(self, "action_complete")
		else
			local current_time_in_action = t - self.action_time_started
			local can_damage = is_within_damage_window(current_time_in_action, self.current_action_settings, owner_unit)
			local action_kind = current_action_settings.kind
			local action = self.actions[action_kind]
			local buff_data = current_action_settings.buff_data

			if buff_data then
				Profiler.start("buff")
				ActionUtils.update_action_buff_data(self.action_buff_data, buff_data, owner_unit, t)
				Profiler.stop("buff")
			end

			Profiler.start(action_kind)
			action.client_owner_post_update(action, dt, t, self.world, can_damage, current_time_in_action)
			Profiler.stop(action_kind)

			if current_action_settings.cooldown then
				self.cooldown_timer = t + current_action_settings.cooldown
			end
		end
	end

	return 
end
WeaponUnitExtension.is_streak_action_available = function (self, streak_action, t, time_offset)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local action = self.actions[current_action_settings.kind]
	local current_time_in_action = t - self.action_time_started

	if action.streak_available and action.streak_available(action, current_time_in_action, streak_action) and self.is_chain_action_available(self, streak_action, t, time_offset) then
		return true
	end

	return false
end
WeaponUnitExtension.is_chain_action_available = function (self, next_chain_action, t, time_offset)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = t - self.action_time_started
	local max_time = current_action_settings.total_time + 2
	time_offset = time_offset or 0
	local anim_time_scale_multiplier = current_action_settings.anim_time_scale or 1
	local attack_speed_modifier = ActionUtils.apply_attack_speed_buff(anim_time_scale_multiplier, self.owner_unit)

	if next_chain_action.auto_chain then
		return ((next_chain_action.start_time and next_chain_action.start_time/attack_speed_modifier) or max_time) + time_offset <= current_time_in_action
	else
		local end_time = (next_chain_action.end_time and next_chain_action.end_time/attack_speed_modifier) or max_time

		return next_chain_action.start_time/attack_speed_modifier + time_offset <= current_time_in_action and current_time_in_action <= end_time
	end

	return 
end
WeaponUnitExtension.time_to_next_chain_action = function (self, next_chain_action, t, time_offset, action_settings)
	action_settings = action_settings or self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = (self.has_current_action(self) and t - self.action_time_started) or 0
	local max_time = action_settings.total_time + 2
	time_offset = time_offset or 0
	local anim_time_scale_multiplier = action_settings.anim_time_scale or 1
	local attack_speed_modifier = ActionUtils.apply_attack_speed_buff(anim_time_scale_multiplier, self.owner_unit)
	local start_time = ((next_chain_action.start_time and next_chain_action.start_time/attack_speed_modifier) or max_time) + time_offset

	return start_time - current_time_in_action
end
WeaponUnitExtension.can_stop_hold_action = function (self, t)
	local current_time_in_action = t - self.action_time_started
	local current_action_settings = self.current_action_settings
	local minimum_hold_time = current_action_settings.minimum_hold_time

	if not minimum_hold_time then
		return true
	end

	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")

	if buff_extension then
		minimum_hold_time = buff_extension.apply_buffs_to_value(buff_extension, minimum_hold_time, StatBuffIndex.RELOAD_SPEED)
	end

	return minimum_hold_time < current_time_in_action
end
WeaponUnitExtension.get_current_action = function (self)
	return self.actions[self.current_action_settings.kind]
end
WeaponUnitExtension.has_current_action = function (self)
	return self.current_action_settings ~= nil
end
WeaponUnitExtension.get_current_action_settings = function (self)
	return self.current_action_settings
end
WeaponUnitExtension._is_before_end_time = function (self, next_chain_action, t)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = t - self.action_time_started
	local max_time = current_action_settings.total_time + 2
	local anim_time_scale_multiplier = current_action_settings.anim_time_scale or 1
	local attack_speed_modifier = ActionUtils.apply_attack_speed_buff(anim_time_scale_multiplier, self.owner_unit)
	local end_time = (next_chain_action.end_time and next_chain_action.end_time/attack_speed_modifier) or max_time

	return current_time_in_action < end_time
end
WeaponUnitExtension._find_chain_action = function (self, actions, allowed_chain_actions, t, wanted_input, wanted_occurrence_number, wanted_action_kind)
	local current_occurrence_number = 0
	local num_chain_actions = #allowed_chain_actions
	local found_chain_info, found_action_settings = nil

	for i = 1, num_chain_actions, 1 do
		local chain_info = allowed_chain_actions[i]

		if chain_info.input == wanted_input then
			current_occurrence_number = current_occurrence_number + 1

			if current_occurrence_number == wanted_occurrence_number then
				found_chain_info = chain_info

				break
			end
		end
	end

	if found_chain_info then
		local action_name = found_chain_info.action
		local sub_action_name = found_chain_info.sub_action
		found_action_settings = actions[action_name][sub_action_name]

		if wanted_action_kind and found_action_settings.kind ~= wanted_action_kind then
			return nil
		end

		local current_action_settings = self.current_action_settings

		if current_action_settings and not self._is_before_end_time(self, found_chain_info, t) then
			return nil
		end
	end

	return found_chain_info, found_action_settings
end
WeaponUnitExtension._process_bot_attack_request = function (self, attack_type, actions, weapon_name, t)
	local found_chain_action, found_action_settings, action_settings = nil
	local wanted_input = "action_one_release"
	local bot_wait_input = "hold_attack"
	local bot_wanted_input = nil
	local wanted_occurrence_number = (attack_type == "tap_attack" and 1) or (attack_type == "hold_attack" and 2)

	if self.current_action_settings then
		action_settings = self.current_action_settings
		local allowed_chain_actions = action_settings.allowed_chain_actions
		found_chain_action, found_action_settings = self._find_chain_action(self, actions, allowed_chain_actions, t, wanted_input, wanted_occurrence_number)

		if found_chain_action == nil then
			bot_wait_input = nil
			bot_wanted_input = "tap_attack"
			found_chain_action, found_action_settings = self._find_chain_action(self, actions, allowed_chain_actions, t, "action_one", 1, "melee_start")
		end
	else
		local action_one = actions.action_one
		action_settings = action_one.default
		found_chain_action, found_action_settings = self._find_chain_action(self, actions, action_settings.allowed_chain_actions, t, wanted_input, wanted_occurrence_number)
	end

	return found_chain_action, found_action_settings, action_settings, bot_wait_input, bot_wanted_input
end
WeaponUnitExtension.update_bot_attack_request = function (self, t)
	local bot_attack_data = self.bot_attack_data
	local request = bot_attack_data.request

	if request.attack_type then
		local chain_action, chain_action_settings, action_settings, wait_input, wanted_input = self._process_bot_attack_request(self, request.attack_type, request.actions, request.weapon_name, t)

		if chain_action then
			bot_attack_data.chain_action = chain_action
			bot_attack_data.chain_action_settings = chain_action_settings
			bot_attack_data.action_settings = action_settings
			bot_attack_data.wait_input = wait_input
			bot_attack_data.wanted_input = wanted_input
		end

		table.clear(request)
	end

	local chain_action = bot_attack_data.chain_action

	if chain_action == nil then
		return 
	end

	local input = nil

	if self.current_action_settings and self.is_chain_action_available(self, chain_action, t) then
		input = bot_attack_data.wanted_input

		self.clear_bot_attack_request(self)
	else
		input = bot_attack_data.wait_input
	end

	if input then
		local owner_unit = self.owner_unit
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		input_extension[input](input_extension)
	end

	return 
end
WeaponUnitExtension.request_bot_attack_action = function (self, attack_type, actions, weapon_name)
	local bot_attack_data = self.bot_attack_data
	local attack_request = bot_attack_data.request

	if bot_attack_data.chain_action or attack_request.attack_type then
		return false
	else
		attack_request.attack_type = attack_type
		attack_request.actions = actions
		attack_request.weapon_name = weapon_name

		return true
	end

	return 
end
WeaponUnitExtension.clear_bot_attack_request = function (self)
	local bot_attack_data = self.bot_attack_data
	local attack_request = bot_attack_data.request

	table.clear(attack_request)
	table.clear(bot_attack_data)

	bot_attack_data.request = attack_request

	return 
end
WeaponUnitExtension.is_starting_attack = function (self)
	local current_action_settings = self.current_action_settings

	return current_action_settings and current_action_settings.kind == "melee_start"
end
WeaponUnitExtension.time_to_next_attack = function (self, wanted_attack_type, current_actions, current_weapon_name, t)
	local bot_attack_data = self.bot_attack_data
	local chain_action, chain_action_settings, action_settings = nil

	if bot_attack_data.chain_action then
		chain_action = bot_attack_data.chain_action
		chain_action_settings = bot_attack_data.chain_action_settings
		action_settings = bot_attack_data.action_settings
	else
		local attack_request = bot_attack_data.request
		local attack_type = attack_request.attack_type or wanted_attack_type
		local actions = attack_request.actions or current_actions
		local weapon_name = attack_request.weapon_name or current_weapon_name
		chain_action, chain_action_settings, action_settings = self._process_bot_attack_request(self, attack_type, actions, weapon_name, t)
	end

	if chain_action then
		local chain_action_time = self.time_to_next_chain_action(self, chain_action, t, nil, action_settings)

		return chain_action_time
	else
		return nil
	end

	return 
end

return 
