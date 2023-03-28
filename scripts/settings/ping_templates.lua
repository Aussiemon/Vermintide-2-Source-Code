PingTypes = {
	PING_ONLY = 15,
	CONTEXT = 4,
	MOVEMENT_WAIT = 13,
	ENEMY_PATROL = 10,
	ENEMY_BOSS = 8,
	ENEMY_AMBUSH = 6,
	ENEMY_GENERIC = 9,
	PLAYER_PICK_UP = 18,
	CHAT_ONLY = 3,
	VO_ONLY = 21,
	UNIT_DOWNED = 22,
	LOCAL_ONLY = 23,
	CANCEL = 2,
	ACKNOWLEDGE = 1,
	PLAYER_HELP = 17,
	MOVEMENTY_COME_HERE = 14,
	PLAYER_THANK_YOU = 20,
	DENY = 5,
	MOVEMENT_GROUP_UP = 12,
	PLAYER_PICK_UP_ACKNOWLEDGE = 19,
	MOVEMENT_GENERIC = 11,
	PLAYER_COVER_ME = 16,
	ENEMY_ATTACK = 7
}
IgnoreCooldownPingTypes = {
	[PingTypes.PLAYER_PICK_UP] = true
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
					"ENEMY_GENERIC"
				},
				"icon_property_grimoire_resistance"
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC"
				},
				"icon_property_stamina"
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP"
				},
				"twitch_icon_guns_blazing"
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL"
				}
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE"
				}
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY"
				}
			}
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return true, nil, nil
		end
	},
	enemy_unit = {
		check_func = function (self, pinger_unit, pinged_unit)
			return pinged_unit and Managers.state.side:is_enemy(pinger_unit, pinged_unit)
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC"
				},
				"icon_property_grimoire_resistance"
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC"
				},
				"icon_property_stamina"
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP"
				},
				"twitch_icon_guns_blazing"
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL"
				}
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE"
				}
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY"
				}
			}
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return true, nil, nil
		end
	},
	friendly_unit = {
		check_func = function (self, pinger_unit, pinged_unit)
			return pinged_unit and not Managers.state.side:is_enemy(pinger_unit, pinged_unit)
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC"
				},
				"icon_property_grimoire_resistance"
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC"
				},
				"icon_property_stamina"
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP"
				},
				"twitch_icon_guns_blazing"
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL"
				}
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE"
				}
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY"
				}
			},
			[PingTypes.CHAT_ONLY] = {
				true
			},
			[PingTypes.UNIT_DOWNED] = {
				true
			}
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return false, nil, nil
		end
	},
	position_only = {
		check_func = function (self, pinger_unit, pinged_unit)
			return not pinged_unit
		end,
		responses = {
			[PingTypes.ENEMY_GENERIC] = {
				true,
				{
					"ENEMY_GENERIC"
				},
				"icon_property_grimoire_resistance"
			},
			[PingTypes.MOVEMENT_GENERIC] = {
				true,
				{
					"MOVEMENT_GENERIC"
				},
				"icon_property_stamina"
			},
			[PingTypes.PLAYER_PICK_UP] = {
				true,
				{
					"PLAYER_PICK_UP"
				},
				"twitch_icon_guns_blazing"
			},
			[PingTypes.CANCEL] = {
				false,
				{
					"CANCEL"
				}
			},
			[PingTypes.ACKNOWLEDGE] = {
				false,
				{
					"ACKNOWLEDGE"
				}
			},
			[PingTypes.DENY] = {
				false,
				{
					"DENY"
				}
			}
		},
		exec_func = function (self, parent, pinger_unit, pinged_unit, ping_type, social_wheel_event_id)
			local response = self.responses[ping_type]

			if response then
				return unpack(response)
			end

			return true, nil, nil
		end
	}
}
