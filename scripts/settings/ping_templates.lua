-- chunkname: @scripts/settings/ping_templates.lua

PingTypes = {
	ACKNOWLEDGE = 1,
	CANCEL = 2,
	CHAT_ONLY = 3,
	CONTEXT = 4,
	DENY = 5,
	ENEMY_AMBUSH = 6,
	ENEMY_ATTACK = 7,
	ENEMY_BOSS = 8,
	ENEMY_GENERIC = 9,
	ENEMY_PATROL = 10,
	ENEMY_POSITION = 24,
	LOCAL_ONLY = 23,
	MOVEMENTY_COME_HERE = 14,
	MOVEMENT_GENERIC = 11,
	MOVEMENT_GROUP_UP = 12,
	MOVEMENT_WAIT = 13,
	PING_ONLY = 15,
	PLAYER_COVER_ME = 16,
	PLAYER_HELP = 17,
	PLAYER_PICK_UP = 18,
	PLAYER_PICK_UP_ACKNOWLEDGE = 19,
	PLAYER_THANK_YOU = 20,
	UNIT_DOWNED = 22,
	VO_ONLY = 21,
}
IgnoreCooldownPingTypes = {
	[PingTypes.CONTEXT] = true,
	[PingTypes.PLAYER_PICK_UP] = false,
	[PingTypes.ENEMY_POSITION] = true,
}
IgnoreFreeEvents = {
	[PingTypes.CONTEXT] = true,
}
IgnoreChatPings = {
	[PingTypes.CANCEL] = true,
	[PingTypes.MOVEMENT_GENERIC] = true,
	[PingTypes.PING_ONLY] = true,
	[PingTypes.ENEMY_POSITION] = true,
	[PingTypes.LOCAL_ONLY] = true,
	mechanism_overrides = {
		versus = {
			[PingTypes.ENEMY_GENERIC] = true,
			[PingTypes.PLAYER_PICK_UP] = true,
			[PingTypes.ACKNOWLEDGE] = true,
		},
	},
}
PingMessagesByPingType = {
	versus = {
		[PingTypes.PLAYER_PICK_UP] = {
			ammo = "versus_pickup_lookup_ammo",
			bomb = "versus_pickup_lookup_bomb",
			default = "versus_pickup_lookup_deafult",
			health = "versus_pickup_lookup_health",
			health_flask = "versus_pickup_lookup_health_flask",
			potion = "versus_pickup_lookup_potion",
		},
		[PingTypes.ENEMY_GENERIC] = {
			default = "versus_generic_enemy",
			vs_gutter_runner = "versus_ping_skaven_gutter_runner",
			vs_packmaster = "versus_ping_skaven_pack_master",
			vs_poison_wind_globadier = "versus_ping_skaven_poison_wind_globadier",
			vs_ratling_gunner = "versus_ping_skaven_ratling_gunner",
			vs_warpfire_thrower = "versus_ping_skaven_warpfire_thrower",
		},
	},
}
PingTemplates = {
	generic_item = {
		check_func = function (self, pinger_unit, pinged_unit)
			return pinged_unit and (ScriptUnit.has_extension(pinged_unit, "pickup_system") or Managers.state.network:level_object_id(pinged_unit))
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC",
				},
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC",
				},
				"ping_friendly",
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP",
				},
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL",
				},
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE",
				},
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY",
				},
			},
			mechanism_overrides = {
				versus = {
					[PingTypes.PLAYER_PICK_UP] = {
						true,
						{
							PingMessagesByPingType.versus[PingTypes.PLAYER_PICK_UP].default,
						},
					},
				},
			},
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, mechanism_key)
			local response = self.responses[ping_type]

			if response then
				local ping_messages = PingMessagesByPingType[mechanism_key]
				local messages = ping_messages and ping_messages[ping_type]

				if messages then
					local lookat_tag = pinged_unit and Unit.get_data(pinged_unit, "lookat_tag")

					if lookat_tag then
						local do_ping, chat_messages, ping_icon = unpack(response)

						chat_messages[1] = messages[lookat_tag] or messages.default

						return do_ping, chat_messages, ping_icon
					end
				end

				return unpack(response)
			end

			return true, nil, nil
		end,
	},
	enemy_unit = {
		check_func = function (self, pinger_unit, pinged_unit)
			return pinged_unit and Managers.state.side:is_enemy(pinger_unit, pinged_unit)
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC",
				},
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC",
				},
				"ping_friendly",
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP",
				},
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL",
				},
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE",
				},
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY",
				},
			},
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, mechanism_key)
			local response = self.responses[ping_type]

			if response then
				local ping_messages = PingMessagesByPingType[mechanism_key]
				local messages = ping_messages and ping_messages[ping_type]

				if messages then
					local breed = pinged_unit and Unit.get_data(pinged_unit, "breed")

					if breed then
						local do_ping, chat_messages, ping_icon = unpack(response)
						local breed_name = breed.name

						chat_messages[1] = messages[breed_name] or messages.default

						return do_ping, chat_messages, ping_icon
					end
				end

				return unpack(response)
			end

			return true, nil, nil
		end,
	},
	friendly_unit = {
		check_func = function (self, pinger_unit, pinged_unit)
			return pinged_unit and not Managers.state.side:is_enemy(pinger_unit, pinged_unit)
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC",
				},
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC",
				},
				"ping_friendly",
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP",
				},
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL",
				},
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE",
				},
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY",
				},
			},
			[PingTypes.CHAT_ONLY] = {
				true,
			},
			[PingTypes.UNIT_DOWNED] = {
				true,
			},
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, mechanism_key)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return false, nil, nil
		end,
	},
	position_only = {
		check_func = function (self, pinger_unit, pinged_unit)
			return not pinged_unit
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC",
				},
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC",
				},
				"ping_friendly",
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP",
				},
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL",
				},
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE",
				},
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY",
				},
			},
			[PingTypes.ENEMY_POSITION] = {
				true,
				{
					"ENEMY_POSITION",
				},
				"ping_hostile",
			},
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id, mechanism_key)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return true, nil, nil
		end,
	},
}
