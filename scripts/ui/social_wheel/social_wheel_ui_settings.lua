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
		local event_text_id = nil

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

SocialWheelPriority = {
	{
		"response",
		function (active_context, player, social_wheel_unit)
			if not active_context.position then
				return false
			end

			local ping_system = Managers.state.entity:system("ping_system")
			local ping_type = ping_system:is_ping_response(nil, player:unique_id(), active_context.position:unbox())

			return ping_type == PingTypes.ACKNOWLEDGE
		end
	},
	{
		"cancel",
		function (active_context, player, social_wheel_unit)
			if not active_context.position then
				return false
			end

			local ping_system = Managers.state.entity:system("ping_system")
			local ping_type = ping_system:is_ping_response(nil, player:unique_id(), active_context.position:unbox())

			return ping_type == PingTypes.CANCEL
		end
	},
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
		end
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
		end
	}
}
local unarmed_emotes = {
	{
		text = "social_wheel_pose_unarmed_01",
		name = "social_wheel_general_pose_unarmed_01",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_01",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	},
	{
		text = "social_wheel_pose_unarmed_02",
		name = "social_wheel_general_pose_unarmed_02",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_02",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	},
	{
		text = "social_wheel_pose_unarmed_03",
		name = "social_wheel_general_pose_unarmed_03",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_03",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	},
	{
		text = "social_wheel_pose_unarmed_04",
		name = "social_wheel_general_pose_unarmed_04",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_04",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	},
	{
		text = "social_wheel_pose_unarmed_05",
		name = "social_wheel_general_pose_unarmed_05",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_05",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	},
	{
		text = "social_wheel_pose_unarmed_06",
		name = "social_wheel_general_pose_unarmed_06",
		icon = "radial_chat_pose_wheel_icon_unarmed",
		execute_func = play_emote,
		data = {
			anim_event = "anim_pose_unarmed_06",
			hide_weapons = true
		},
		ping_type = PingTypes.LOCAL_ONLY
	}
}

local function clone_wheel_settings(settings, unique_name_postfix)
	local new_settings = table.clone(settings)

	for i = 1, #new_settings do
		new_settings[i].name = new_settings[i].name .. unique_name_postfix
	end

	return new_settings
end

local unarmed_emotes_gamepad = clone_wheel_settings(unarmed_emotes, "_gp")
SocialWheelSettings = {
	general = {
		{
			{
				text = "social_wheel_general_no",
				event_text = "social_wheel_general_no",
				name = "social_wheel_general_no",
				icon = "radial_chat_icon_no",
				vo_event_name = "vw_negation",
				data = {},
				ping_type = PingTypes.DENY
			},
			{
				text = "social_wheel_general_come_here",
				event_text = "social_wheel_general_come_here",
				name = "social_wheel_general_come_here",
				icon = "radial_chat_icon_come_here",
				vo_event_name = "vw_gather",
				data = {},
				ping_type = PingTypes.MOVEMENTY_COME_HERE
			},
			{
				text = "social_wheel_general_patrol",
				event_text = "social_wheel_general_patrol",
				name = "social_wheel_general_patrol",
				icon = "radial_chat_icon_patrol",
				vo_event_name = "vw_patrol",
				data = {},
				ping_type = PingTypes.ENEMY_PATROL
			},
			{
				text = "social_wheel_general_help",
				event_text = "social_wheel_general_help",
				name = "social_wheel_general_help",
				icon = "radial_chat_icon_help",
				vo_event_name = "vw_help",
				data = {},
				ping_type = PingTypes.PLAYER_HELP
			},
			{
				text = "social_wheel_general_boss",
				event_text = "social_wheel_general_boss",
				name = "social_wheel_general_boss",
				icon = "radial_chat_icon_boss",
				vo_event_name = "vw_boss",
				data = {},
				ping_type = PingTypes.ENEMY_BOSS
			},
			{
				text = "social_wheel_general_thank_you",
				event_text = "social_wheel_general_thank_you",
				name = "social_wheel_general_thank_you",
				icon = "radial_chat_icon_thank_you",
				vo_event_name = "vw_thank_you",
				data = {},
				ping_type = PingTypes.PLAYER_THANK_YOU
			},
			{
				text = "social_wheel_general_yes",
				event_text = "social_wheel_general_yes",
				name = "social_wheel_general_yes",
				icon = "radial_chat_icon_yes",
				vo_event_name = "vw_affirmative",
				data = {},
				ping_type = PingTypes.ACKNOWLEDGE
			}
		},
		unarmed_emotes,
		wedge_adjustment = 0.85,
		has_pages = true,
		individual_bg = true,
		angle = 1.7 * math.pi,
		size = {
			500,
			250
		}
	},
	general_gamepad = {
		{
			{
				text = "social_wheel_general_no",
				event_text = "social_wheel_general_no",
				name = "social_wheel_general_no_gp",
				icon = "radial_chat_icon_no",
				data = {}
			},
			{
				text = "social_wheel_general_come_here",
				event_text = "social_wheel_general_come_here",
				name = "social_wheel_general_come_here_gp",
				icon = "radial_chat_icon_come_here",
				data = {}
			},
			{
				text = "social_wheel_general_patrol",
				event_text = "social_wheel_general_patrol",
				name = "social_wheel_general_patrol_gp",
				icon = "radial_chat_icon_patrol",
				data = {}
			},
			{
				text = "social_wheel_general_help",
				event_text = "social_wheel_general_help",
				name = "social_wheel_general_help_gp",
				icon = "radial_chat_icon_help",
				data = {}
			},
			{
				text = "social_wheel_general_boss",
				event_text = "social_wheel_general_boss",
				name = "social_wheel_general_boss_gp",
				icon = "radial_chat_icon_boss",
				data = {}
			},
			{
				text = "social_wheel_general_thank_you",
				event_text = "social_wheel_general_thank_you",
				name = "social_wheel_general_thank_you_gp",
				icon = "radial_chat_icon_thank_you",
				data = {}
			},
			{
				text = "social_wheel_general_yes",
				event_text = "social_wheel_general_yes",
				name = "social_wheel_general_yes_gp",
				icon = "radial_chat_icon_yes",
				data = {}
			}
		},
		unarmed_emotes_gamepad,
		wedge_adjustment = 0.85,
		has_pages = true,
		individual_bg = false,
		angle = 2 * math.pi,
		size = {
			250,
			250
		}
	},
	item = {
		{
			text = "witch_hunter_short",
			name = "social_wheel_item_pick_up_witch_hunter",
			icon = "radial_chat_icon_saltzpyre",
			data = "witch_hunter",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP
		},
		{
			text = "bright_wizard_short",
			name = "social_wheel_item_pick_up_bright_wizard",
			icon = "radial_chat_icon_sienna",
			data = "bright_wizard",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP
		},
		{
			text = "dwarf_ranger_short",
			name = "social_wheel_item_pick_up_dwarf_ranger",
			icon = "radial_chat_icon_bardin",
			data = "dwarf_ranger",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP
		},
		{
			text = "wood_elf_short",
			name = "social_wheel_item_pick_up_wood_elf",
			icon = "radial_chat_icon_kerillian",
			data = "wood_elf",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP
		},
		{
			text = "empire_soldier_short",
			name = "social_wheel_item_pick_up_empire_soldier",
			icon = "radial_chat_icon_kruber",
			data = "empire_soldier",
			event_text_func = get_pickup_event_text,
			execute_func = pickup_item,
			is_valid_func = is_valid_player_and_target_unit_exclude_local_player,
			ping_type = PingTypes.PLAYER_PICK_UP
		},
		wedge_adjustment = 0.9,
		ping = true,
		size = {
			250,
			250
		},
		angle = math.pi * 2
	},
	friendly_hero_player = {
		{
			text = "social_wheel_player_drop_grimoire",
			name = "social_wheel_player_drop_grimoire",
			icon = "radial_chat_icon_drop_grimoire",
			data = "grimoire",
			event_text_func = get_drop_event_text,
			execute_func = drop_item,
			is_valid_func = has_item,
			ping_type = PingTypes.CHAT_ONLY
		},
		wedge_adjustment = 1,
		ping = false,
		size = {
			250,
			250
		},
		angle = math.pi
	},
	cancel = {
		{
			text = "social_wheel_general_cancel",
			event_text = "social_wheel_general_cancel",
			name = "cancel_social_wheel_general_cancel",
			icon = "radial_chat_icon_no",
			vo_event_name = "vw_cancel",
			data = {},
			ping_type = PingTypes.CANCEL
		},
		wedge_adjustment = 0.85,
		individual_bg = true,
		angle = 1.7 * math.pi,
		size = {
			500,
			250
		}
	},
	response = {
		{
			text = "social_wheel_general_no",
			event_text = "social_wheel_general_no",
			name = "response_social_wheel_general_no",
			icon = "radial_chat_icon_no",
			vo_event_name = "vw_cancel",
			data = {},
			ping_type = PingTypes.DENY
		},
		{
			text = "social_wheel_general_yes",
			event_text = "social_wheel_general_yes",
			name = "response_social_wheel_general_yes",
			icon = "radial_chat_icon_yes",
			vo_event_name = "vw_affirmative",
			data = {},
			ping_type = PingTypes.ACKNOWLEDGE
		},
		wedge_adjustment = 0.85,
		individual_bg = true,
		angle = 1.7 * math.pi,
		size = {
			500,
			250
		}
	}
}

DLCUtils.dofile("social_wheel_settings")

for category_name, category_settings in pairs(SocialWheelSettings) do
	for idx, setting in ipairs(category_settings) do
		setting.index = idx
		setting.category_name = category_name
	end
end

SocialWheelSettingsLookup = {}

for _, category_settings in pairs(SocialWheelSettings) do
	if category_settings.has_pages then
		for i = 1, #category_settings do
			for _, setting in ipairs(category_settings[i]) do
				local name = setting.name

				fassert(SocialWheelSettingsLookup[name] == nil, "You have a duplicate entry in SocialWheelSettings (%s), each entry must have a unique name!", name)

				SocialWheelSettingsLookup[name] = setting
			end
		end
	else
		for _, setting in ipairs(category_settings) do
			local name = setting.name

			fassert(SocialWheelSettingsLookup[name] == nil, "You have a duplicate entry in SocialWheelSettings (%s), each entry must have a unique name!", name)

			SocialWheelSettingsLookup[name] = setting
		end
	end
end
