require("scripts/unit_extensions/weapons/actions/action_base")
require("scripts/unit_extensions/weapons/actions/action_ranged_base")
require("scripts/unit_extensions/weapons/actions/action_charge")
require("scripts/unit_extensions/weapons/actions/action_dummy")
require("scripts/unit_extensions/weapons/actions/action_inspect")
require("scripts/unit_extensions/weapons/actions/action_melee_start")
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
require("scripts/unit_extensions/weapons/actions/action_bullet_spray")
require("scripts/unit_extensions/weapons/actions/action_flamethrower")
require("scripts/unit_extensions/weapons/actions/action_aim")
require("scripts/unit_extensions/weapons/actions/action_reload")
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
require("scripts/unit_extensions/weapons/actions/action_career_aim")
require("scripts/unit_extensions/weapons/actions/action_career_dummy")
require("scripts/unit_extensions/weapons/actions/action_career_true_flight_aim")
require("scripts/unit_extensions/weapons/actions/action_career_dr_ranger")
require("scripts/unit_extensions/weapons/actions/action_career_bw_scholar")
require("scripts/unit_extensions/weapons/actions/action_career_we_waywatcher")
require("scripts/unit_extensions/weapons/actions/action_career_we_waywatcher_piercing")
require("scripts/unit_extensions/weapons/actions/action_career_wh_bountyhunter")

if Development.parameter("debug_weapons") then
	script_data.debug_weapons = true
end

local action_classes = {
	career_aim = ActionCareerAim,
	career_dummy = ActionCareerDummy,
	career_true_flight_aim = ActionCareerTrueFlightAim,
	charge = ActionCharge,
	dummy = ActionDummy,
	inspect = ActionInspect,
	melee_start = ActionMeleeStart,
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
	bullet_spray = ActionBulletSpray,
	aim = ActionAim,
	reload = ActionReload,
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
	career_dr_three = ActionCareerDRRanger,
	career_bw_one = ActionCareerBWScholar,
	career_we_three = ActionCareerWEWaywatcher,
	career_we_three_piercing = ActionCareerWEWaywatcherPiercing,
	career_wh_two = ActionCareerWHBountyhunter
}

DLCUtils.require_list("action_template_file_names")
DLCUtils.map("action_classes_lookup", function (action_classes_lookup)
	for key, class_name in pairs(action_classes_lookup) do
		action_classes[key] = _G[class_name]
	end
end)

local function create_attack(item_name, attack_kind, world, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	return action_classes[attack_kind]:new(world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

local function is_within_damage_window(current_time_in_action, action, owner_unit)
	local damage_window_start = action.damage_window_start
	local damage_window_end = action.damage_window_end

	if not damage_window_start and not damage_window_end then
		return false
	end

	local damage_time_scale = ActionUtils.get_action_time_scale(owner_unit, action, false)
	damage_window_start = damage_window_start / damage_time_scale
	damage_window_end = damage_window_end or action.total_time or math.huge
	damage_window_end = damage_window_end / damage_time_scale
	local after_start = damage_window_start < current_time_in_action
	local before_end = current_time_in_action < damage_window_end

	return after_start and before_end
end

local function get_skin_action_override_data(skin_anim_data, action_settings)
	if skin_anim_data then
		local lookup_data = action_settings.lookup_data
		local action_overrides = skin_anim_data[lookup_data.action_name]

		return action_overrides and action_overrides[lookup_data.sub_action_name]
	end

	return nil
end

WeaponUnitExtension = class(WeaponUnitExtension)

WeaponUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.weapon_system = extension_init_data.weapon_system
	local world = extension_init_context.world
	self.world = world
	self.wwise_world = Managers.world:wwise_world(world)
	self.unit = unit
	local owner_unit = extension_init_data.owner_unit
	self.owner_unit = owner_unit
	self.item_name = extension_init_data.item_name
	local first_person_unit = extension_init_data.first_person_rig
	self.first_person_unit = first_person_unit
	local weapon_skin_name = extension_init_data.skin_name
	local weapon_skin_data = WeaponSkins.skins[weapon_skin_name]
	self.weapon_skin_anim_overrides = weapon_skin_data and weapon_skin_data.action_anim_overrides
	local actual_damage_unit = World.spawn_unit(world, "units/weapons/player/wpn_damage/wpn_damage")

	Unit.disable_physics(actual_damage_unit)
	Unit.set_unit_visibility(actual_damage_unit, false)

	if first_person_unit then
		local attach_nodes = extension_init_data.attach_nodes
		local attachment_nodes = attach_nodes[1]
		local source_node = attachment_nodes.source
		local target_node = 0
		local source_node_index = type(source_node) == "string" and Unit.node(first_person_unit, source_node) or source_node
		local target_node_index = type(target_node) == "string" and Unit.node(actual_damage_unit, target_node) or target_node

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
	self.cooldown_timer = {}
	self.chain_action_sound_played = {}
	self.is_server = Managers.state.network.network_transmit.is_server
	local player_manager = Managers.player
	local player = player_manager:unit_owner(owner_unit)

	if player and player.bot_player then
		self.bot_attack_data = {
			request = {}
		}
	end

	self.looping_audio_events = {}
	self._current_weapon_buffs = {}
	self._custom_data = {}
	self._passive_update_actions = nil
	self._passive_update_actions_n = 0
	local item_data = rawget(ItemMasterList, self.item_name)
	local weapon_template_name = item_data and item_data.template

	if weapon_template_name then
		local template = Weapons[weapon_template_name]
		local custom_data = template.custom_data

		if custom_data then
			for key, value in pairs(custom_data) do
				if type(value) == "table" then
					self._custom_data[key] = Script.new_table(value.array_size or 0, value.map_size or 0)
				else
					self._custom_data[key] = value
				end
			end
		end

		self._weapon_update = template and template.update
		self._weapon_wield = template and template.on_wield
		self._weapon_unwield = template and template.on_unwield
		self._weapon_template = template
	end

	Managers.state.event:register(self, "on_game_options_changed", "update_game_options")
	self:update_game_options()
end

WeaponUnitExtension.update_game_options = function (self)
	local weapon_trails = Application.user_setting("weapon_trails")

	Unit.set_data(self.unit, "trails_enabled", weapon_trails ~= "none")
end

WeaponUnitExtension.cb_game_session_disconnect = function (self)
	self.sync_data_game_object_id = nil
end

WeaponUnitExtension.extensions_ready = function (self, world, unit)
	self.ammo_extension = ScriptUnit.has_extension(unit, "ammo_system")
	local owner_unit = self.owner_unit
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._talent_extension = ScriptUnit.has_extension(owner_unit, "talent_system")
end

WeaponUnitExtension.destroy = function (self)
	Managers.state.event:unregister("on_game_options_changed", self)

	if self.current_action_settings then
		local buff_data = self.current_action_settings.buff_data

		if buff_data then
			ActionUtils.remove_action_buff_data(self.action_buff_data, buff_data, self.owner_unit)
		end

		local action_kind = self.current_action_settings.kind
		local attack_prev = self.actions[action_kind]

		if attack_prev.destroy then
			attack_prev:destroy()
		end
	end

	for id in pairs(self.looping_audio_events) do
		self:stop_looping_audio(id)
	end
end

WeaponUnitExtension.get_action = function (self, action_name, sub_action_name, actions)
	local sub_actions = actions[action_name]
	local action = sub_actions[sub_action_name]

	return action
end

local interupting_action_data = {}

local function get_action_anim_event(previous_action_settings, current_action_settings, skin_data, anim_key)
	if previous_action_settings then
		local anim_event_from_chain = current_action_settings.anim_event_from_chain

		if anim_event_from_chain then
			local lookup_data = previous_action_settings.lookup_data
			local action_anim_data = anim_event_from_chain[lookup_data.action_name]

			if action_anim_data then
				local sub_action_anim_data = action_anim_data[lookup_data.sub_action_name]

				if sub_action_anim_data and sub_action_anim_data[anim_key] then
					return sub_action_anim_data[anim_key]
				end
			end
		end
	end

	return skin_data and skin_data[anim_key] or current_action_settings[anim_key]
end

WeaponUnitExtension.start_action = function (self, action_name, sub_action_name, actions, t, power_level, action_init_data)
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local talent_extension = ScriptUnit.has_extension(owner_unit, "talent_system")
	local first_person_extension = self.first_person_extension
	local status_extension = ScriptUnit.extension(owner_unit, "status_system")
	local current_action_settings = self.current_action_settings
	local new_action = action_name
	local new_sub_action = sub_action_name

	if not self.player then
		local player_manager = Managers.player
		local player = player_manager:unit_owner(owner_unit)
		self.is_bot = player and not player:is_player_controlled()
		self.is_local = player and not player.remote
		self.player = player
	end

	table.clear(interupting_action_data)

	if new_action then
		local action_settings = self:get_action(new_action, new_sub_action, actions)
		action_settings, new_action, new_sub_action = ActionUtils.resolve_action_selector(action_settings, talent_extension, buff_extension, self, owner_unit)
		local action_kind = action_settings.kind

		if not self.actions[action_kind] then
			local new_action_instance = create_attack(self.item_name, action_kind, self.world, self.is_server, owner_unit, self.actual_damage_unit, self.first_person_unit, self.unit, self.weapon_system)
			self.actions[action_kind] = new_action_instance

			if new_action_instance.passive_update then
				if not self._passive_update_actions then
					self._passive_update_actions = {
						new_action_instance
					}
					self._passive_update_actions_n = 1
				else
					local passive_update_actions_n = self._passive_update_actions_n + 1
					self._passive_update_actions[passive_update_actions_n] = new_action_instance
					self._passive_update_actions_n = passive_update_actions_n
				end
			end
		end
	end

	local ammo_extension = self.ammo_extension

	if ammo_extension ~= nil and new_action then
		local action = self:get_action(new_action, new_sub_action, actions)
		local ammo_requirement = action.ammo_requirement or action.ammo_usage or 0
		local ammo_count = ammo_extension:ammo_count()
		local action_can_abort_reload = action.can_abort_reload == nil and true or action.can_abort_reload

		if ammo_extension:is_reloading() then
			if ammo_requirement <= ammo_count and action_can_abort_reload then
				ammo_extension:abort_reload()
			else
				new_action, new_sub_action = nil
			end
		elseif ammo_count < ammo_requirement then
			if ammo_extension:total_remaining_ammo() == 0 and (not self.reload_failed_timer or self.reload_failed_timer < t) and (not action.interaction_type or action.interaction_type ~= "heal") and not action.no_out_of_ammo_vo then
				local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.fail_reason = "out_of_ammo"
				event_data.item_name = "ranged_weapon"
				local event_name = "reload_failed"

				dialogue_input:trigger_networked_dialogue_event(event_name, event_data)

				self.reload_failed_timer = t + 5
			end

			new_action, new_sub_action = nil
		end
	end

	local chain_action_data, previous_action_settings = nil

	if new_action and current_action_settings then
		previous_action_settings = current_action_settings
		interupting_action_data.new_action = new_action
		interupting_action_data.new_sub_action = new_sub_action
		interupting_action_data.new_action_settings = self:get_action(new_action, new_sub_action, actions)
		chain_action_data = self:_finish_action("new_interupting_action", interupting_action_data)
	end

	if new_action then
		local locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")

		if locomotion_extension:is_stood_still() then
			local look_rotation = first_person_extension:current_rotation()

			locomotion_extension:set_stood_still_target_rotation(look_rotation)
		end

		local chain_action = current_action_settings ~= nil
		current_action_settings = self:get_action(new_action, new_sub_action, actions)

		first_person_extension:set_weapon_sway_settings(current_action_settings.weapon_sway_settings)

		if not chain_action and current_action_settings.aim_at_gaze_setting then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:set_is_aiming(true)

			if ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
				local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

				eyetracking_extension:set_is_aiming(true)

				if eyetracking_extension:get_is_feature_enabled("tobii_aim_at_gaze") then
					local gaze_rotation = eyetracking_extension:gaze_rotation()

					first_person_extension:force_look_rotation(gaze_rotation, 1)
				end
			end
		end

		self.current_action_name = new_action
		self.current_sub_action_name = new_sub_action
		self.current_action_settings = current_action_settings
		local first_person_unit = self.first_person_unit

		if not current_action_settings.looping_anim then
			local equip_event = current_action_settings.wield_blend_event or "equip_interrupt"

			Unit.animation_event(first_person_unit, equip_event)
		end

		table.clear(self.chain_action_sound_played)

		local allowed_chain_actions = current_action_settings.allowed_chain_actions
		local num_chain_actions = #allowed_chain_actions

		for i = 1, num_chain_actions do
			self.chain_action_sound_played[i] = false
		end

		local action_kind = current_action_settings.kind
		local action = self.actions[action_kind]
		local time_to_complete = current_action_settings.total_time
		local action_time_scale = ActionUtils.get_action_time_scale(owner_unit, current_action_settings)
		time_to_complete = time_to_complete / action_time_scale
		local skin_data = get_skin_action_override_data(self.weapon_skin_anim_overrides, current_action_settings)
		local event = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event")
		local event_3p = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_3p") or event
		local looping_event = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "looping_anim")

		for _, data in pairs(self.action_buff_data) do
			table.clear(data)
		end

		local buff_data = current_action_settings.buff_data

		if buff_data then
			ActionUtils.init_action_buff_data(self.action_buff_data, buff_data, t)

			self.buff_data = buff_data
		end

		status_extension._current_action = new_action

		action:client_owner_start_action(current_action_settings, t, chain_action_data, power_level, action_init_data)

		local aim_assist_ramp_multiplier = current_action_settings.aim_assist_ramp_multiplier

		if aim_assist_ramp_multiplier then
			local aim_assist_max_ramp_multiplier = current_action_settings.aim_assist_max_ramp_multiplier
			local aim_assist_ramp_decay_delay = current_action_settings.aim_assist_ramp_decay_delay

			first_person_extension:increase_aim_assist_multiplier(aim_assist_ramp_multiplier, aim_assist_max_ramp_multiplier, aim_assist_ramp_decay_delay)
		end

		if self.ammo_extension then
			if self.ammo_extension:total_remaining_ammo() == 0 then
				event = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_no_ammo_left") or event
				event_3p = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_no_ammo_left_3p") or event_3p
			elseif self.ammo_extension:total_remaining_ammo() == 1 then
				event = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_last_ammo") or event
				event_3p = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_last_ammo_3p") or event_3p
			end
		end

		if buff_extension then
			local infinite_ammo = buff_extension:has_buff_perk("infinite_ammo")

			if infinite_ammo then
				event = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_infinite_ammo") or event
				event_3p = get_action_anim_event(previous_action_settings, current_action_settings, skin_data, "anim_event_infinite_ammo_3p") or event_3p
			end
		end

		self.action_time_started = t
		self.action_time_scale = action_time_scale
		self.action_time_done = t + time_to_complete

		if current_action_settings.cooldown then
			local lookup_data = current_action_settings.lookup_data
			self.cooldown_timer[lookup_data.action_name] = t + current_action_settings.cooldown
		end

		if current_action_settings.enter_function then
			local minimum_hold_time = self:get_scaled_min_hold_time(current_action_settings)
			local input_extension = ScriptUnit.extension(owner_unit, "input_system")
			local remaining_time = self.action_time_started + minimum_hold_time - t

			current_action_settings.enter_function(owner_unit, input_extension, remaining_time, self)
		end

		if event then
			local anim_time_scale = ActionUtils.get_action_time_scale(owner_unit, current_action_settings, true)
			anim_time_scale = math.clamp(anim_time_scale, NetworkConstants.animation_variable_float.min, NetworkConstants.animation_variable_float.max)
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

			if not IS_WINDOWS and not IS_LINUX and event == "attack_shoot" then
				anim_time_scale = anim_time_scale * 1.2
			end

			first_person_extension:animation_set_variable("attack_speed", anim_time_scale)

			if CharacterStateHelper.is_enemy_character(owner_unit) then
				local first_person_variable_id = 1

				Unit.animation_set_variable(first_person_unit, first_person_variable_id, anim_time_scale)
			end

			if not looping_event or looping_event and not self._looping_anim_event_started then
				Unit.animation_event(first_person_unit, event)

				if looping_event then
					self._looping_anim_event_started = true
				end
			end

			if not script_data.disable_third_person_weapon_animation_events then
				local third_person_variable_id = nil
				local hero_player = true

				if CharacterStateHelper.is_enemy_character(owner_unit) then
					third_person_variable_id = 1
					hero_player = false
				end

				if hero_player then
					third_person_variable_id = Unit.animation_find_variable(owner_unit, "attack_speed")
				end

				Unit.animation_set_variable(owner_unit, third_person_variable_id, anim_time_scale)

				if not looping_event or looping_event and not self._looping_anim_event_started then
					Unit.animation_event(owner_unit, event_3p)

					if looping_event then
						self._looping_anim_event_started = true
					end
				end
			end

			if current_action_settings.apply_recoil then
				first_person_extension:apply_recoil()
				first_person_extension:play_camera_recoil(current_action_settings.recoil_settings, t)
			end
		end
	end
end

WeaponUnitExtension.stop_action = function (self, reason, data)
	if self:has_current_action() and not self._currently_stopping_action then
		self._currently_stopping_action = true

		self:_finish_action(reason, data)

		self._currently_stopping_action = false
	end
end

WeaponUnitExtension._finish_action = function (self, reason, data)
	local current_action_settings = self.current_action_settings
	local action_kind = current_action_settings.kind
	local action = self.actions[action_kind]

	if Application.user_setting("tobii_eyetracking") and ScriptUnit.has_extension(self.owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(self.owner_unit, "eyetracking_system")

		if reason == "hold_input_released" then
			eyetracking_extension:set_is_aiming(false)
			eyetracking_extension:set_aim_at_gaze_cancelled(false)
		end
	end

	if reason == "hold_input_released" then
		local status_extension = ScriptUnit.has_extension(self.owner_unit, "status_system")

		status_extension:set_is_aiming(false)
	end

	local buff_data = current_action_settings.buff_data

	if buff_data then
		ActionUtils.remove_action_buff_data(self.action_buff_data, buff_data, self.owner_unit)
	end

	for _, action_buff_data in pairs(self.action_buff_data) do
		table.clear(action_buff_data)
	end

	local chain_action_data = action:finish(reason, data)

	self:anim_end_event(reason, current_action_settings)

	local next_action_settings = data and data.new_action_settings
	local on_chain_keep_audio_loops = next_action_settings and next_action_settings.on_chain_keep_audio_loops

	if on_chain_keep_audio_loops then
		for id in pairs(self.looping_audio_events) do
			if not table.contains(on_chain_keep_audio_loops, id) then
				self:stop_looping_audio(id)
			end
		end
	else
		for id in pairs(self.looping_audio_events) do
			self:stop_looping_audio(id)
		end
	end

	if current_action_settings.finish_function then
		current_action_settings.finish_function(self.owner_unit, reason, self)
	end

	local first_person_extension = self.first_person_extension

	if first_person_extension then
		local weapon_template = self._weapon_template
		local sway_settings = weapon_template and weapon_template.weapon_sway_settings

		first_person_extension:set_weapon_sway_settings(sway_settings)
	end

	if self.bot_attack_data then
		self:clear_bot_attack_request()
	end

	self.current_action_settings = nil
	self.action_time_scale = nil

	return chain_action_data
end

WeaponUnitExtension.anim_end_event = function (self, reason, current_action_settings)
	local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
	local skin_data = get_skin_action_override_data(self.weapon_skin_anim_overrides, current_action_settings)
	local event = skin_data and skin_data.anim_end_event or current_action_settings.anim_end_event
	local anim_end_event_condition_func = current_action_settings.anim_end_event_condition_func
	local do_event = not anim_end_event_condition_func and true or anim_end_event_condition_func(self.owner_unit, reason, self.ammo_extension)

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

		if not script_data.disable_third_person_weapon_animation_events then
			Unit.animation_event(self.owner_unit, event)
		end

		self._looping_anim_event_started = nil
	end
end

WeaponUnitExtension.trigger_anim_event = function (self, event)
	if event then
		local event_id = NetworkLookup.anims[event]

		if not LEVEL_EDITOR_TEST then
			local go_id = Managers.state.unit_storage:go_id(self.owner_unit)

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end

		Unit.animation_event(self.first_person_unit, event)

		if not script_data.disable_third_person_weapon_animation_events then
			Unit.animation_event(self.owner_unit, event)
		end

		self._looping_anim_event_started = nil
	end
end

WeaponUnitExtension.update = function (self, unit, input, dt, context, t)
	local current_action_settings = self.current_action_settings

	if current_action_settings then
		local owner_unit = self.owner_unit
		local wwise_world = Managers.world:wwise_world(self.world)
		local allowed_chain_actions = current_action_settings.allowed_chain_actions
		local num_chain_actions = #allowed_chain_actions

		for i = 1, num_chain_actions do
			local chain_info = allowed_chain_actions[i]
			local chain_ready_sound = chain_info.chain_ready_sound

			if chain_ready_sound then
				local time_offset = chain_info.sound_time_offset or 0
				local sound_ready = self:is_chain_action_available(chain_info, t, time_offset)

				if sound_ready and not self.chain_action_sound_played[i] then
					WwiseWorld.trigger_event(wwise_world, chain_ready_sound)

					self.chain_action_sound_played[i] = true
				end
			end
		end

		if self.action_time_done < t then
			self:_finish_action("action_complete")
		else
			local current_time_in_action = t - self.action_time_started
			local can_damage = is_within_damage_window(current_time_in_action, self.current_action_settings, owner_unit)
			local action_kind = current_action_settings.kind
			local action = self.actions[action_kind]
			local buff_data = current_action_settings.buff_data

			if buff_data then
				ActionUtils.update_action_buff_data(self.action_buff_data, buff_data, owner_unit, t)
			end

			action:client_owner_post_update(dt, t, self.world, can_damage, current_time_in_action)

			if current_action_settings.cooldown and not current_action_settings.cooldown_from_start then
				local lookup_data = current_action_settings.lookup_data
				self.cooldown_timer[lookup_data.action_name] = t + current_action_settings.cooldown
			end
		end
	end

	local passive_update_actions = self._passive_update_actions

	for i = 1, self._passive_update_actions_n do
		passive_update_actions[i]:passive_update(dt, t)
	end

	if self._weapon_update then
		self:_weapon_update(dt, t)
	end
end

WeaponUnitExtension.is_streak_action_available = function (self, streak_action, t, time_offset)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local action = self.actions[current_action_settings.kind]
	local current_time_in_action = t - self.action_time_started

	if action.streak_available and action:streak_available(current_time_in_action, streak_action) and self:is_chain_action_available(streak_action, t, time_offset) then
		return true
	end

	return false
end

WeaponUnitExtension.is_chain_action_available = function (self, next_chain_action, t, time_offset)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = t - self.action_time_started
	local max_time = current_action_settings.total_time + 2
	time_offset = time_offset or 0
	local chain_time_scale = self.action_time_scale or ActionUtils.get_action_time_scale(self.owner_unit, current_action_settings)

	if next_chain_action.auto_chain then
		return current_time_in_action >= (next_chain_action.start_time and next_chain_action.start_time / chain_time_scale or max_time) + time_offset
	else
		local end_time = next_chain_action.end_time and next_chain_action.end_time / chain_time_scale or max_time

		return current_time_in_action >= next_chain_action.start_time / chain_time_scale + time_offset and current_time_in_action <= end_time
	end
end

WeaponUnitExtension.time_to_next_chain_action = function (self, next_chain_action, t, time_offset, action_settings)
	action_settings = action_settings or self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = self:has_current_action() and t - self.action_time_started or 0
	local max_time = action_settings.total_time + 2
	time_offset = time_offset or 0
	local chain_time_scale = ActionUtils.get_action_time_scale(self.owner_unit, action_settings)
	local start_time = (next_chain_action.start_time and next_chain_action.start_time / chain_time_scale or max_time) + time_offset

	return start_time - current_time_in_action
end

WeaponUnitExtension.get_scaled_min_hold_time = function (self, action)
	local minimum_hold_time = action.minimum_hold_time

	if not minimum_hold_time then
		return 0
	end

	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")
	local scaled_min_hold_time = minimum_hold_time

	if buff_extension then
		scaled_min_hold_time = buff_extension:apply_buffs_to_value(scaled_min_hold_time, "reload_speed")

		if scaled_min_hold_time > 0 then
			local action_time_scale = ActionUtils.get_action_time_scale(self.owner_unit, action, false, 1)
			scaled_min_hold_time = scaled_min_hold_time / action_time_scale
		end
	end

	return scaled_min_hold_time
end

WeaponUnitExtension.can_stop_hold_action = function (self, t)
	local current_time_in_action = t - self.action_time_started
	local current_action_settings = self.current_action_settings
	local minimum_hold_time = current_action_settings.minimum_hold_time

	if not minimum_hold_time then
		return true
	end

	local scaled_minimum_hold_time = self:get_scaled_min_hold_time(current_action_settings)

	return scaled_minimum_hold_time < current_time_in_action
end

WeaponUnitExtension.get_action_cooldown = function (self, action)
	local action_cooldown = self.cooldown_timer[action]

	return action_cooldown
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

WeaponUnitExtension.is_after_damage_window = function (self)
	local action = self.current_action_settings

	if not action then
		return false
	end

	local damage_window_start = action.damage_window_start
	local damage_window_end = action.damage_window_end

	if not damage_window_start and not damage_window_end then
		return false
	end

	local owner_unit = self.owner_unit
	local t = Managers.time:time("game")
	local current_time_in_action = t - self.action_time_started
	local damage_time_scale = ActionUtils.get_action_time_scale(owner_unit, action, false)
	damage_window_end = damage_window_end or action.total_time or math.huge
	damage_window_end = damage_window_end / damage_time_scale

	return current_time_in_action >= damage_window_end
end

WeaponUnitExtension.bot_should_stop_attack_on_leave = function (self)
	local current_action_settings = self.current_action_settings

	if current_action_settings then
		return current_action_settings.stop_action_on_leave_for_bot
	end
end

WeaponUnitExtension._is_before_end_time = function (self, next_chain_action, t)
	local current_action_settings = self.current_action_settings or self.temporary_action_settings
	local current_time_in_action = t - self.action_time_started
	local max_time = current_action_settings.total_time + 2
	local chain_time_scale = ActionUtils.get_action_time_scale(self.owner_unit, current_action_settings)
	local end_time = next_chain_action.end_time and next_chain_action.end_time / chain_time_scale or max_time

	return current_time_in_action < end_time
end

WeaponUnitExtension._find_chain_action = function (self, actions, allowed_chain_actions, t, wanted_input, wanted_occurrence_number)
	local current_occurrence_number = 0
	local num_chain_actions = #allowed_chain_actions
	local found_chain_info, found_action_settings = nil

	for i = 1, num_chain_actions do
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
		found_action_settings, action_name, sub_action_name = ActionUtils.resolve_action_selector(found_action_settings, self._talent_extension, self._buff_extension, self, self.unit)
		local current_action_settings = self.current_action_settings

		if current_action_settings and not self:_is_before_end_time(found_chain_info, t) then
			return nil
		end
	end

	return found_chain_info, found_action_settings
end

WeaponUnitExtension._get_attack_chain_data = function (self, actions, attack_chain, t)
	local found_chain_action, found_action_settings, action_settings = nil
	local bot_wait_input = "hold_attack"
	local bot_wanted_input = nil
	local current_action_settings = self.current_action_settings

	if current_action_settings then
		action_settings = current_action_settings
	else
		local start_action_name = attack_chain.start_action_name
		local start_sub_action_name = attack_chain.start_sub_action_name
		action_settings = actions[start_action_name][start_sub_action_name]
	end

	local lookup_data = action_settings.lookup_data
	local action_name = lookup_data.action_name
	local sub_action_name = lookup_data.sub_action_name
	local attack_chain_data = attack_chain.transitions[action_name][sub_action_name]

	if attack_chain_data == nil then
		return nil
	end

	found_chain_action = attack_chain_data.chain_action

	if current_action_settings and not self:_is_before_end_time(found_chain_action, t) then
		return nil
	end

	found_action_settings = actions[found_chain_action.action][found_chain_action.sub_action_name]
	bot_wait_input = attack_chain_data.bot_wait_input or bot_wait_input
	bot_wanted_input = attack_chain_data.bot_wanted_input or bot_wanted_input

	return found_chain_action, found_action_settings, action_settings, bot_wait_input, bot_wanted_input
end

WeaponUnitExtension._process_bot_attack_request = function (self, attack_type, actions, weapon_name, t, attack_chain)
	if attack_chain then
		return self:_get_attack_chain_data(actions, attack_chain, t)
	end

	local found_chain_action, found_action_settings, action_settings = nil
	local wanted_input = "action_one_release"
	local bot_wait_input = "hold_attack"
	local bot_wanted_input = nil
	local wanted_occurrence_number = attack_type == "tap_attack" and 1 or attack_type == "hold_attack" and 2

	if self.current_action_settings then
		action_settings = self.current_action_settings
		local allowed_chain_actions = action_settings.allowed_chain_actions
		found_chain_action, found_action_settings = self:_find_chain_action(actions, allowed_chain_actions, t, wanted_input, wanted_occurrence_number)

		if found_chain_action == nil and action_settings.kind ~= "block" then
			bot_wait_input = nil
			bot_wanted_input = "tap_attack"
			found_chain_action, found_action_settings = self:_find_chain_action(actions, allowed_chain_actions, t, "action_one", 1)
		end
	else
		action_settings = ActionUtils.resolve_action_selector(actions.action_one.default)
		found_chain_action, found_action_settings = self:_find_chain_action(actions, action_settings.allowed_chain_actions, t, wanted_input, wanted_occurrence_number)
	end

	return found_chain_action, found_action_settings, action_settings, bot_wait_input, bot_wanted_input
end

WeaponUnitExtension.update_bot_attack_request = function (self, t)
	local bot_attack_data = self.bot_attack_data
	local request = bot_attack_data.request

	if request.attack_type then
		local chain_action, chain_action_settings, action_settings, wait_input, wanted_input = self:_process_bot_attack_request(request.attack_type, request.actions, request.weapon_name, t, request.attack_chain)

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

	if self.current_action_settings and self:is_chain_action_available(chain_action, t) then
		input = bot_attack_data.wanted_input

		self:clear_bot_attack_request()
	else
		input = bot_attack_data.wait_input
	end

	if input then
		local owner_unit = self.owner_unit
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		input_extension[input](input_extension)
	end
end

WeaponUnitExtension.request_bot_attack_action = function (self, attack_type, actions, weapon_name, attack_chain)
	local bot_attack_data = self.bot_attack_data
	local attack_request = bot_attack_data.request

	if bot_attack_data.chain_action or attack_request.attack_type then
		return false
	else
		attack_request.attack_type = attack_type
		attack_request.actions = actions
		attack_request.weapon_name = weapon_name
		attack_request.attack_chain = attack_chain

		return true
	end
end

WeaponUnitExtension.clear_bot_attack_request = function (self)
	local bot_attack_data = self.bot_attack_data
	local attack_request = bot_attack_data.request

	table.clear(attack_request)
	table.clear(bot_attack_data)

	bot_attack_data.request = attack_request
end

WeaponUnitExtension.is_starting_attack = function (self)
	local current_action_settings = self.current_action_settings

	return ActionUtils.is_melee_start_sub_action(current_action_settings)
end

WeaponUnitExtension.time_to_next_attack = function (self, wanted_attack_type, current_actions, current_weapon_name, t, attack_chain)
	local bot_attack_data = self.bot_attack_data
	local chain_action, _, action_settings = nil

	if bot_attack_data.chain_action then
		chain_action = bot_attack_data.chain_action
		action_settings = bot_attack_data.action_settings
	else
		local attack_request = bot_attack_data.request
		local attack_type = attack_request.attack_type or wanted_attack_type
		local actions = attack_request.actions or current_actions
		local weapon_name = attack_request.weapon_name or current_weapon_name
		attack_chain = attack_request.attack_chain or attack_chain
		chain_action, _, action_settings = self:_process_bot_attack_request(attack_type, actions, weapon_name, t, attack_chain)
	end

	if chain_action then
		local chain_action_time = self:time_to_next_chain_action(chain_action, t, nil, action_settings)

		return chain_action_time
	else
		return nil
	end
end

WeaponUnitExtension.set_mode = function (self, new_mode)
	self.weapon_mode = new_mode
end

WeaponUnitExtension.get_mode = function (self)
	return self.weapon_mode
end

WeaponUnitExtension.get_custom_data = function (self, key)
	fassert(self._custom_data[key] ~= nil, "Custom data key '%s' does not exist, add it to the weapon template", key)

	return self._custom_data[key]
end

WeaponUnitExtension.set_custom_data = function (self, key, value)
	fassert(self._custom_data[key] ~= nil, "Custom data key '%s' does not exist, add it to the weapon template", key)

	self._custom_data[key] = value
end

WeaponUnitExtension.set_weapon_buffs = function (self, buffs)
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local current_buffs = self._current_weapon_buffs

	for i = 1, #current_buffs do
		buff_extension:remove_buff(current_buffs[i])
	end

	table.clear(current_buffs)

	if buffs then
		for i = 1, #buffs do
			local buff_name = buffs[i]
			local buff_id = buff_extension:add_buff(buff_name)
			current_buffs[i] = buff_id
		end
	end
end

WeaponUnitExtension.add_looping_audio = function (self, id, start_event_id, end_event_id, start_event_husk_id, end_event_husk_id, auto_start)
	fassert(start_event_id, "tried to add looping audio with no start event, id: %s", id)
	fassert(end_event_id, "tried to add looping audio with no end event, id: %s", id)

	local data = self.looping_audio_events[id]

	if data and data.is_playing then
		self:stop_looping_audio(id)
	end

	local data = {
		is_playing = false,
		start_event_id = start_event_id,
		end_event_id = end_event_id,
		start_event_husk_id = start_event_husk_id,
		end_event_husk_id = end_event_husk_id
	}
	self.looping_audio_events[id] = data

	if auto_start then
		self:start_looping_audio(id)
	end
end

WeaponUnitExtension.start_looping_audio = function (self, id)
	local audio_data = self.looping_audio_events[id]

	if not audio_data or audio_data.is_playing then
		return
	end

	if self.is_local and not self.is_bot and not audio_data.wwise_playing_id then
		local wwise_source_id = WwiseWorld.make_auto_source(self.wwise_world, self.unit)
		audio_data.wwise_playing_id = WwiseWorld.trigger_event(self.wwise_world, audio_data.start_event_id, wwise_source_id)
	end

	ActionUtils.play_husk_sound_event(self.wwise_world, audio_data.start_event_husk_id, self.owner_unit, self.is_bot)

	audio_data.is_playing = true
end

WeaponUnitExtension.stop_looping_audio = function (self, id)
	local audio_data = self.looping_audio_events[id]

	if not audio_data or not audio_data.is_playing then
		return
	end

	if self.is_local and not self.is_bot then
		if audio_data.wwise_playing_id and WwiseWorld.is_playing(self.wwise_world, audio_data.wwise_playing_id) then
			local wwise_source_id = WwiseWorld.make_auto_source(self.wwise_world, self.unit)

			WwiseWorld.trigger_event(self.wwise_world, audio_data.end_event_id, wwise_source_id)
		end

		audio_data.wwise_playing_id = nil
	end

	ActionUtils.play_husk_sound_event(self.wwise_world, audio_data.end_event_husk_id, self.owner_unit, self.is_bot)

	audio_data.is_playing = false
end

WeaponUnitExtension.is_playing_looping_audio = function (self, id)
	local audio_data = self.looping_audio_events[id]

	if audio_data then
		return audio_data.is_playing
	end

	return false
end

WeaponUnitExtension.set_looping_audio_switch = function (self, id, group, state)
	local audio_data = self.looping_audio_events[id]

	if not audio_data or not group or not state then
		return
	end

	local wwise_source_id = WwiseWorld.make_auto_source(self.wwise_world, self.unit)

	WwiseWorld.set_switch(self.wwise_world, group, state, wwise_source_id)
end

WeaponUnitExtension.update_looping_audio_parameter = function (self, id, parameter_name, parameter_value)
	local audio_data = self.looping_audio_events[id]

	if not audio_data or not parameter_name or not parameter_value then
		return
	end

	local wwise_source_id = WwiseWorld.make_auto_source(self.wwise_world, self.unit)

	WwiseWorld.set_source_parameter(self.wwise_world, wwise_source_id, parameter_name, parameter_value)
end

WeaponUnitExtension.on_wield = function (self, hand_name)
	local first_person_extension = self.first_person_extension

	if first_person_extension then
		local weapon_template = self._weapon_template
		local sway_settings = weapon_template and weapon_template.weapon_sway_settings

		first_person_extension:set_weapon_sway_settings(sway_settings)
	end

	if self._weapon_wield then
		self:_weapon_wield(hand_name)
	end
end

WeaponUnitExtension.on_unwield = function (self, hand_name)
	if self._weapon_unwield then
		self:_weapon_unwield(hand_name)
	end
end
