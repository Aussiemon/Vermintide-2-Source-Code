local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local STATUS_REASON = "BUFF_PERK"
local buff_perk_functions = {
	[buff_perk_names.overpowered] = {
		added = function (buff_ext, unit, template, is_server)
			if is_server then
				StatusUtils.set_overpowered_network(unit, true, "slow_bomb", unit)
			end
		end,
		removed = function (buff_ext, unit, template, is_server)
			if is_server then
				StatusUtils.set_overpowered_network(unit, false, "slow_bomb", nil)
			end
		end
	},
	[buff_perk_names.poisoned] = {
		added = function (buff_ext, unit, template, is_server)
			Managers.state.status_effect:set_status(unit, StatusEffectNames.poisoned, STATUS_REASON, true)
		end,
		removed = function (buff_ext, unit, template, is_server)
			if not HEALTH_ALIVE[unit] then
				Managers.state.status_effect:add_timed_status(unit, StatusEffectNames.poisoned)
			end

			Managers.state.status_effect:set_status(unit, StatusEffectNames.poisoned, STATUS_REASON, false)
		end
	},
	[buff_perk_names.burning] = {
		added = function (buff_ext, unit, template, is_server)
			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning, STATUS_REASON, true)
		end,
		removed = function (buff_ext, unit, template, is_server)
			if not HEALTH_ALIVE[unit] then
				Managers.state.status_effect:add_timed_status(unit, StatusEffectNames.burning)
			end

			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning, STATUS_REASON, false)
		end
	},
	[buff_perk_names.burning_balefire] = {
		added = function (buff_ext, unit, template, is_server)
			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_balefire, STATUS_REASON, true)
		end,
		removed = function (buff_ext, unit, template, is_server)
			if not HEALTH_ALIVE[unit] then
				Managers.state.status_effect:add_timed_status(unit, StatusEffectNames.burning_balefire)
			end

			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_balefire, STATUS_REASON, false)
		end
	},
	[buff_perk_names.burning_elven_magic] = {
		added = function (buff_ext, unit, template, is_server)
			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_elven_magic, STATUS_REASON, true)
		end,
		removed = function (buff_ext, unit, template, is_server)
			if not HEALTH_ALIVE[unit] then
				Managers.state.status_effect:add_timed_status(unit, StatusEffectNames.burning_elven_magic)
			end

			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_elven_magic, STATUS_REASON, false)
		end
	},
	[buff_perk_names.burning_warpfire] = {
		added = function (buff_ext, unit, template, is_server)
			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_warpfire, STATUS_REASON, true)
		end,
		removed = function (buff_ext, unit, template, is_server)
			if not HEALTH_ALIVE[unit] then
				Managers.state.status_effect:add_timed_status(unit, StatusEffectNames.burning_warpfire)
			end

			Managers.state.status_effect:set_status(unit, StatusEffectNames.burning_warpfire, STATUS_REASON, false)
		end
	}
}

return buff_perk_functions
