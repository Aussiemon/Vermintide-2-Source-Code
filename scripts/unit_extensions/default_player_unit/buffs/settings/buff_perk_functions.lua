local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_perk_functions = {
	[buff_perk_names.overpowered] = {
		added = function (buff_ext, unit, is_server)
			if is_server then
				StatusUtils.set_overpowered_network(unit, true, "slow_bomb", unit)
			end
		end,
		removed = function (buff_ext, unit, is_server)
			if is_server then
				StatusUtils.set_overpowered_network(unit, false, "slow_bomb", nil)
			end
		end
	}
}

return buff_perk_functions
