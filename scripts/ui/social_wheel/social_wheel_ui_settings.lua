-- chunkname: @scripts/ui/social_wheel/social_wheel_ui_settings.lua

local function fetch_player_from_profile_display_name(wanted_profile_name)
	local player_manager = Managers.player
	local players = player_manager:players()

	for _, player in pairs(players) do
		local profile_display_name = player:profile_display_name()

		if profile_display_name == wanted_profile_name then
			return player
		end
	end
end

local function get_pickup_event_text(target_unit, event_settings)
	local callee_profile_name = event_settings.data
	local callee_player = fetch_player_from_profile_display_name(callee_profile_name)

	if callee_player then
		local pickup_extension = ScriptUnit.extension(target_unit, "pickup_system")
		local settings = pickup_extension:get_pickup_settings()
		local parameters = FrameTable.alloc_table()
		local event_text_id

		if settings.type == "ammo" then
			event_text_id = "social_wheel_pickup_item_ammo_event"
		else
			event_text_id = "social_wheel_pickup_item_event"

			local item_name = Unit.get_data(target_unit, "interaction_data", "hud_description")

			parameters[#parameters + 1] = item_name
		end

		local profile_index = callee_player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name_short = profile.ingame_short_display_name

		parameters[#parameters + 1] = display_name_short

		return event_text_id, parameters
	end
end

local function get_drop_event_text(target_unit, event_settings)
	local player_manager = Managers.player
	local callee_player = player_manager:owner(target_unit)

	if callee_player then
		local event_text_id = "social_wheel_player_drop_event"
		local item_name = event_settings.data
		local item_data = AllPickups[item_name]
		local item_hud_description = item_data.hud_description
		local profile_index = callee_player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name_short = profile.ingame_short_display_name
		local parameters = FrameTable.alloc_table()

		parameters[1] = item_hud_description
		parameters[2] = display_name_short

		return event_text_id, parameters
	end
end

local function pickup_item(callee_profile_name, item_unit, caller_player, settings)
	local callee_player = fetch_player_from_profile_display_name(callee_profile_name)

	if callee_player and item_unit then
		local callee_player_unit = callee_player.player_unit
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

		ai_bot_group_system:order("pickup", callee_player_unit, item_unit, caller_player)
	end
end

local function play_emote(social_wheel_event_data, pinged_unit, sender_player, social_wheel_category)
	local unit = sender_player and sender_player.player_unit

	if unit then
		local cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

		if cosmetic_extension then
			cosmetic_extension:queue_3p_emote(social_wheel_event_data.anim_event, social_wheel_event_data.hide_weapons)
		end
	end
end

local function drop_item(item_name, callee_player_unit, caller_player)
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	ai_bot_group_system:order("drop", callee_player_unit, item_name, caller_player)
end

local function has_item(item_name, active_context)
	local player_unit = active_context.unit
	local player_unit_alive = Unit.alive(player_unit)

	if not player_unit_alive then
		return false
	end

	local item = AllPickups[item_name]
	local slot_name = item.slot_name
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")
	local slot_data = inventory_extension:get_slot_data(slot_name)

	if slot_data then
		local item_template = inventory_extension:get_item_template(slot_data)

		if item_name == "grimoire" then
			return item_template.is_grimoire
		else
			local pickup_data = item_template.pickup_data

			return pickup_data.pickup_name == item_name
		end
	else
		return false
	end
end

local function is_valid_player_and_target_unit_exclude_local_player(player_profile_name, active_context)
	local target_unit = active_context.unit

	if not Unit.alive(target_unit) then
		return false
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local player = fetch_player_from_profile_display_name(player_profile_name)

	if not player or player == local_player or not Unit.alive(player.player_unit) then
		return false
	end

	local status_extension = ScriptUnit.extension(player.player_unit, "status_system")

	if status_extension:is_ready_for_assisted_respawn() or status_extension:is_dead() then
		return false
	end

	local is_bot = not player:is_player_controlled()
	local pickup_extension = ScriptUnit.extension(target_unit, "pickup_system")
	local settings = pickup_extension:get_pickup_settings()

	if is_bot and (settings.slot_name == "slot_level_event" or settings.disallow_bot_pickup) then
		return false
	else
		return true
	end
end

local function is_weapon_pose_available(data, active_context, content, style)
	local pose_index = data.pose_index
	local player = Managers.player:local_player()
	local player_unit = player.player_unit

	if not ALIVE[player_unit] then
		return false
	end

	local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")
	local wielded_slot_data = inventory_ext:get_wielded_slot_data()
	local item_data = wielded_slot_data.item_data
	local item_name = item_data.name
	local pose_name = item_data.pose_name
	local backend_crafting = Managers.backend:get_interface("items")
	local unlocked_weapon_poses = backend_crafting:get_unlocked_weapon_poses()

	return unlocked_weapon_poses[item_name] and unlocked_weapon_poses[item_name][pose_name]
end

local function get_ping_hero_event_text(target_unit, event_settings)
	local player_manager = Managers.player
	local callee_player = player_manager:owner(target_unit)

	if callee_player then
		local event_text_id = event_settings.event_text
		local profile_index = callee_player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name_short = profile.ingame_short_display_name
		local parameters = FrameTable.alloc_table()

		parameters[1] = display_name_short

		return event_text_id, parameters
	end
end

SocialWheelPriority = {
	{
		"item",
		function (active_context, player, social_wheel_unit)
			if not social_wheel_unit then
				return false
			end

			if not ScriptUnit.has_extension(social_wheel_unit, "pickup_system") then
				return false
			end

			local interactable_ext = ScriptUnit.has_extension(social_wheel_unit, "interactable_system")

			if not interactable_ext then
				return false
			end

			local game_mode = Managers.state.game_mode:game_mode()

			if game_mode.allowed_interactions and not game_mode:allowed_interactions(player.player_unit, interactable_ext.interactable_type) then
				return false
			end

			return true
		end,
	},
	{
		"friendly_hero_player",
		function (active_context, player, social_wheel_unit)
			local target_player = social_wheel_unit and Managers.player:owner(social_wheel_unit)

			if not target_player then
				return false
			end

			if target_player.player_unit == player.player_unit then
				return false
			end

			local player_side = Managers.state.side.side_by_unit[player.player_unit]

			if player_side:name() ~= "heroes" then
				return false
			end

			local target_side = Managers.state.side.side_by_unit[target_player.player_unit]

			return not Managers.state.side:is_enemy_by_side(player_side, target_side)
		end,
	},
	{
		"enemy_hero_player",
		function (active_context, player, social_wheel_unit)
			local target_player = social_wheel_unit and Managers.player:owner(social_wheel_unit)

			if not target_player then
				return false
			end

			local player_side = Managers.state.side.side_by_unit[player.player_unit]

			if player_side:name() ~= "dark_pact" then
				return false
			end

			local target_side = Managers.state.side.side_by_unit[target_player.player_unit]

			return Managers.state.side:is_enemy_by_side(player_side, target_side)
		end,
	},
}

local general_emotes = {
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_01",
		text = "social_wheel_pose_test_01",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_01",
			hide_weapons = false,
			pose_index = 1,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_02",
		text = "social_wheel_pose_test_02",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_02",
			hide_weapons = false,
			pose_index = 2,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_03",
		text = "social_wheel_pose_test_03",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_03",
			hide_weapons = false,
			pose_index = 3,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_04",
		text = "social_wheel_pose_test_04",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_04",
			hide_weapons = false,
			pose_index = 4,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_05",
		text = "social_wheel_pose_test_05",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_05",
			hide_weapons = false,
			pose_index = 5,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_icon_thank_you",
		name = "social_wheel_general_pose_06",
		text = "social_wheel_pose_test_06",
		execute_func = play_emote,
		is_valid_func = is_weapon_pose_available,
		data = {
			anim_event = "anim_pose_06",
			hide_weapons = false,
			pose_index = 6,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	emotes = true,
}
local unarmed_emotes = {
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_01",
		text = "social_wheel_pose_unarmed_01",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_01",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_02",
		text = "social_wheel_pose_unarmed_02",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_02",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_03",
		text = "social_wheel_pose_unarmed_03",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_03",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_04",
		text = "social_wheel_pose_unarmed_04",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_04",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_05",
		text = "social_wheel_pose_unarmed_05",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_05",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	{
		icon = "radial_chat_pose_wheel_icon_unarmed",
		name = "social_wheel_general_pose_unarmed_06",
		text = "social_wheel_pose_unarmed_06",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_06",
			hide_weapons = true,
		},
		ping_type = PingTypes.LOCAL_ONLY,
	},
	emotes = true,
}

local function clone_wheel_settings(settings, unique_name_postfix)
	local new_settings = table.clone(settings)

	for i = 1, #new_settings do
		new_settings[i].name = new_settings[i].name .. unique_name_postfix
	end

	return new_settings
end

local general_emotes_gamepad = clone_wheel_settings(general_emotes, "_gp")
local unarmed_emotes_gamepad = clone_wheel_settings(unarmed_emotes, "_gp")
local unarmed_emotes_gamepad_versus = clone_wheel_settings(unarmed_emotes, "_gp_versus")

SocialWheelSettings = {
	general = {
		angle = 1.7 * math.pi,
		size = {
			500,
			250,
		},
		{
			{
				event_text = "social_wheel_general_no",
				icon = "radial_chat_icon_no",
				name = "social_wheel_general_no",
				text = "social_wheel_general_no",
				vo_event_name = "vw_negation",
				data = {},
				ping_type = PingTypes.DENY,
			},
			{
				event_text = "social_wheel_general_come_here",
				icon = "radial_chat_icon_come_here",
				name = "social_wheel_general_come_here",
				text = "social_wheel_general_come_here",
				vo_event_name = "vw_gather",
				data = {},
				ping_type = PingTypes.MOVEMENTY_COME_HERE,
			},
			{
				event_text = "social_wheel_general_patrol",
				icon = "radial_chat_icon_patrol",
				name = "social_wheel_general_patrol",
				text = "social_wheel_general_patrol",
				vo_event_name = "vw_patrol",
				data = {},
				ping_type = PingTypes.ENEMY_PATROL,
			},
			{
				event_text = "social_wheel_general_help",
				icon = "radial_chat_icon_help",
				name = "social_wheel_general_help",
				text = "social_wheel_general_help",
				vo_event_name = "vw_help",
				data = {},
				ping_type = PingTypes.PLAYER_HELP,
			},
			{
				event_text = "social_wheel_general_boss",
				icon = "radial_chat_icon_boss",
				name = "social_wheel_general_boss",
				text = "social_wheel_general_boss",
				vo_event_name = "vw_boss",
				data = {},
				ping_type = PingTypes.ENEMY_BOSS,
			},
			{
				event_text = "social_wheel_general_thank_you",
				icon = "radial_chat_icon_thank_you",
				name = "social_wheel_general_thank_you",
				text = "social_wheel_general_thank_you",
				vo_event_name = "vw_thank_you",
				data = {},
				ping_type = PingTypes.PLAYER_THANK_YOU,
			},
			{
				event_text = "social_wheel_general_yes",
				icon = "radial_chat_icon_yes",
				name = "social_wheel_general_yes",
				text = "social_wheel_general_yes",
				vo_event_name = "vw_affirmative",
				data = {},
				ping_type = PingTypes.ACKNOWLEDGE,
			},
		},
		unarmed_emotes,
		has_pages = true,
		individual_bg = true,
		wedge_adjustment = 0.85,
	},
	general_gamepad = {
		angle = 2 * math.pi,
		size = {
			250,
			250,
		},
		{
			{
				event_text = "social_wheel_general_no",
				icon = "radial_chat_icon_no",
				name = "social_wheel_general_no_gp",
				text = "social_wheel_general_no",
				data = {},
			},
			{
				event_text = "social_wheel_general_come_here",
				icon = "radial_chat_icon_come_here",
				name = "social_wheel_general_come_here_gp",
				text = "social_wheel_general_come_here",
				data = {},
			},
			{
				event_text = "social_wheel_general_patrol",
				icon = "radial_chat_icon_patrol",
				name = "social_wheel_general_patrol_gp",
				text = "social_wheel_general_patrol",
				data = {},
			},
			{
				event_text = "social_wheel_general_help",
				icon = "radial_chat_icon_help",
				name = "social_wheel_general_help_gp",
				text = "social_wheel_general_help",
				data = {},
			},
			{
				event_text = "social_wheel_general_boss",
				icon = "radial_chat_icon_boss",
				name = "social_wheel_general_boss_gp",
				text = "social_wheel_general_boss",
				data = {},
			},
			{
				event_text = "social_wheel_general_thank_you",
				icon = "radial_chat_icon_thank_you",
				name = "social_wheel_general_thank_you_gp",
				text = "social_wheel_general_thank_you",
				data = {},
			},
			{
				event_text = "social_wheel_general_yes",
				icon = "radial_chat_icon_yes",
				name = "social_wheel_general_yes_gp",
				text = "social_wheel_general_yes",
				data = {},
			},
		},
		unarmed_emotes_gamepad,
		has_pages = true,
		individual_bg = false,
		wedge_adjustment = 0.85,
	},
	item = {
		size = {
			250,
			250,
		},
		angle = math.pi * 2,
		{
			data = "witch_hunter",
			icon = "radial_chat_icon_saltzpyre",
			name = "social_wheel_item_pick_up_witch_hunter",
			text = "witch_hunter_short",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP,
		},
		{
			data = "bright_wizard",
			icon = "radial_chat_icon_sienna",
			name = "social_wheel_item_pick_up_bright_wizard",
			text = "bright_wizard_short",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP,
		},
		{
			data = "dwarf_ranger",
			icon = "radial_chat_icon_bardin",
			name = "social_wheel_item_pick_up_dwarf_ranger",
			text = "dwarf_ranger_short",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP,
		},
		{
			data = "wood_elf",
			icon = "radial_chat_icon_kerillian",
			name = "social_wheel_item_pick_up_wood_elf",
			text = "wood_elf_short",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP,
		},
		{
			data = "empire_soldier",
			icon = "radial_chat_icon_kruber",
			name = "social_wheel_item_pick_up_empire_soldier",
			text = "empire_soldier_short",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP,
		},
		ping = true,
		wedge_adjustment = 0.9,
	},
	friendly_hero_player = {
		size = {
			250,
			250,
		},
		angle = math.pi,
		{
			data = "grimoire",
			icon = "radial_chat_icon_drop_grimoire",
			name = "social_wheel_player_drop_grimoire",
			text = "social_wheel_player_drop_grimoire",
			event_text_func = get_drop_event_text,
			execute_func = drop_item,
			is_valid_func = has_item,
			ping_type = PingTypes.CHAT_ONLY,
		},
		ping = false,
		wedge_adjustment = 1,
	},
	versus_heroes_gamepad = {
		angle = 2 * math.pi,
		size = {
			250,
			250,
		},
		validation_function = function ()
			local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

			if not is_versus then
				return false
			end

			local game_mode = Managers.state.game_mode:game_mode_key()
			local mechanism_settings = MechanismSettings[Managers.mechanism:current_mechanism_name()]
			local is_in_versus_gamemode = mechanism_settings.gamemode_lookup.default == game_mode

			return is_in_versus_gamemode
		end,
		{
			{
				event_text = "social_wheel_heroes_general_help",
				icon = "radial_chat_icon_help",
				name = "social_wheel_heroes_general_help",
				ping_sound_effect = "versus_ping_marker_imminent",
				text = "social_wheel_heroes_general_help",
				vo_event_name = "vw_cover_me",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_need_ammunition",
				icon = "radial_chat_icon_need_ammo",
				name = "social_wheel_heroes_general_need_ammunition",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "social_wheel_heroes_general_need_ammunition",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_come_here",
				icon = "radial_chat_icon_come_here",
				name = "social_wheel_heroes_general_come_here",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "social_wheel_heroes_general_come_here",
				vo_event_name = "vw_gather",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_yes",
				icon = "radial_chat_icon_yes",
				name = "social_wheel_heroes_general_yes",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "social_wheel_heroes_general_yes",
				vo_event_name = "vw_affirmative",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_thank_you",
				icon = "radial_chat_icon_thank_you",
				name = "social_wheel_heroes_general_thank_you",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "social_wheel_heroes_general_thank_you",
				vo_event_name = "vw_thank_you",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_no",
				icon = "radial_chat_icon_no",
				name = "social_wheel_heroes_general_no",
				ping_sound_effect = "versus_ping_marker_communication_no",
				text = "social_wheel_heroes_general_no",
				vo_event_name = "vw_negation",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_boss",
				icon = "radial_chat_icon_boss",
				name = "social_wheel_heroes_general_boss",
				ping_sound_effect = "versus_ping_marker_imminent",
				text = "social_wheel_heroes_general_boss",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_heroes_general_need_healing",
				icon = "radial_chat_icon_need_healing",
				name = "social_wheel_heroes_general_need_healing",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "social_wheel_heroes_general_need_healing",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
		},
		unarmed_emotes_gamepad_versus,
		has_pages = true,
		individual_bg = false,
		wedge_adjustment = 0.85,
	},
	dark_pact_gamepad = {
		angle = 2 * math.pi,
		size = {
			250,
			250,
		},
		validation_function = function ()
			local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

			if not is_versus then
				return false
			end

			local game_mode = Managers.state.game_mode:game_mode_key()
			local mechanism_settings = MechanismSettings[Managers.mechanism:current_mechanism_name()]
			local is_in_versus_gamemode = mechanism_settings.gamemode_lookup.default == game_mode

			return is_in_versus_gamemode
		end,
		{
			{
				event_text = "vs_social_wheel_dark_pact_general_attack",
				icon = "radial_chat_icon_attack",
				name = "vs_social_wheel_dark_pact_general_attack",
				ping_sound_effect = "versus_ping_marker_imminent",
				text = "vs_social_wheel_dark_pact_general_attack",
				vo_event_name = "vw_attack_now",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_ready",
				icon = "radial_chat_icon_ready",
				name = "vs_social_wheel_dark_pact_general_ready",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "vs_social_wheel_dark_pact_general_ready",
				vo_event_name = "vw_affirmative",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_group_up",
				icon = "radial_chat_icon_gather",
				name = "vs_social_wheel_dark_pact_general_group_up",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "vs_social_wheel_dark_pact_general_group_up",
				vo_event_name = "vw_gather",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_yes",
				icon = "radial_chat_icon_yes",
				name = "vs_social_wheel_dark_pact_general_yes",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "vs_social_wheel_dark_pact_general_yes",
				vo_event_name = "vw_affirmative",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "social_wheel_dark_pact_general_thank_you",
				icon = "radial_chat_icon_thank_you",
				name = "social_wheel_dark_pact_general_thank_you",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "social_wheel_dark_pact_general_thank_you",
				vo_event_name = "vw_thank_you",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_no",
				icon = "radial_chat_icon_no",
				name = "vs_social_wheel_dark_pact_general_no",
				ping_sound_effect = "versus_ping_marker_communication",
				text = "vs_social_wheel_dark_pact_general_no",
				vo_event_name = "vw_negation",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_cover_me",
				icon = "radial_chat_icon_cover",
				name = "vs_social_wheel_dark_pact_general_cover_me",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "vs_social_wheel_dark_pact_general_cover_me",
				vo_event_name = "vw_cover_me",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
			{
				event_text = "vs_social_wheel_dark_pact_general_wait",
				icon = "radial_chat_icon_wait",
				name = "vs_social_wheel_dark_pact_general_wait",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "vs_social_wheel_dark_pact_general_wait",
				vo_event_name = "vw_wait",
				data = {},
				ping_type = PingTypes.VO_ONLY,
			},
		},
		has_pages = true,
		individual_bg = false,
		wedge_adjustment = 0.85,
	},
	enemy_hero_player = {
		angle = 2 * math.pi,
		size = {
			250,
			250,
		},
		validation_function = function ()
			local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

			if not is_versus then
				return false
			end

			local game_mode = Managers.state.game_mode:game_mode_key()
			local mechanism_settings = MechanismSettings[Managers.mechanism:current_mechanism_name()]
			local is_in_versus_gamemode = mechanism_settings.gamemode_lookup.default == game_mode

			return is_in_versus_gamemode
		end,
		{
			{
				event_text = "vs_social_wheel_dark_pact_player_ambush",
				icon = "radial_chat_icon_ambush",
				name = "vs_social_wheel_dark_pact_player_ambush",
				ping_sound_effect = "versus_ping_marker_imminent",
				text = "vs_social_wheel_dark_pact_general_ambush",
				vo_event_name = "vw_ambush",
				event_text_func = get_ping_hero_event_text,
				data = {},
				ping_type = PingTypes.ENEMY_AMBUSH,
			},
			{
				event_text = "vs_social_wheel_dark_pact_player_cover_me",
				icon = "radial_chat_icon_cover",
				name = "vs_social_wheel_dark_pact_player_cover_me",
				ping_sound_effect = "versus_ping_marker_tactical",
				text = "vs_social_wheel_dark_pact_general_cover_me",
				vo_event_name = "vw_cover_me",
				event_text_func = get_ping_hero_event_text,
				data = {},
				ping_type = PingTypes.PLAYER_COVER_ME,
			},
			{
				event_text = "vs_social_wheel_dark_pact_player_attack",
				icon = "radial_chat_icon_attack",
				name = "vs_social_wheel_dark_pact_player_attack",
				ping_sound_effect = "versus_ping_marker_imminent",
				text = "vs_social_wheel_dark_pact_general_attack",
				vo_event_name = "vw_attack_now",
				event_text_func = get_ping_hero_event_text,
				data = {},
				ping_type = PingTypes.ENEMY_ATTACK,
			},
		},
		{},
		has_pages = true,
		individual_bg = false,
		wedge_adjustment = 0.85,
	},
}

DLCUtils.dofile("social_wheel_settings")

for category_name, category_settings in pairs(SocialWheelSettings) do
	for idx, setting in ipairs(category_settings) do
		setting.index = idx
		setting.category_name = category_name
	end
end

if not rawget(_G, "SocialWheelSettingsLookup") then
	SocialWheelSettingsLookup = {}

	for _, category_settings in pairs(SocialWheelSettings) do
		if category_settings.has_pages then
			for i = 1, #category_settings do
				for _, setting in ipairs(category_settings[i]) do
					local name = setting.name or settings.category_name

					fassert(SocialWheelSettingsLookup[name] == nil, "You have a duplicate entry in SocialWheelSettings (%s), each entry must have a unique name!", name)

					SocialWheelSettingsLookup[name] = setting
				end
			end
		else
			for _, setting in ipairs(category_settings) do
				local name = setting.name or setting.category_name

				fassert(SocialWheelSettingsLookup[name] == nil, "You have a duplicate entry in SocialWheelSettings (%s), each entry must have a unique name!", name)

				SocialWheelSettingsLookup[name] = setting
			end
		end
	end

	SocialWheelSettingsNetworkLookupBase = {
		"n/a",
	}

	local MAX_WEAPON_POSES = 13

	for i = 1, MAX_WEAPON_POSES do
		SocialWheelSettingsNetworkLookupBase[#SocialWheelSettingsNetworkLookupBase + 1] = string.format("social_wheel_weapon_pose_general_pose_%02d", i)
	end
end

return {
	functions = {
		play_emote = play_emote,
		is_weapon_pose_available = is_weapon_pose_available,
		clone_wheel_settings = clone_wheel_settings,
	},
}
