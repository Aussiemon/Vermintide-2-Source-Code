-- chunkname: @scripts/settings/dlcs/penny/penny_buff_settings_part_3.lua

local settings = DLCSettings.penny_part_3
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

settings.buff_templates = {
	enemy_penny_curse_pulse = {
		buffs = {
			{
				name = "penny_curse_pulse",
				radius = 3,
				tick_rate = 0.5,
				update_func = "enemy_penny_curse_pulse",
			},
		},
	},
	enemy_penny_curse = {
		buffs = {
			{
				debuff = true,
				duration = 5,
				icon = "troll_vomit_debuff",
				max_stacks = 50,
				name = "penny_curse",
				refresh_durations = true,
				perks = {
					buff_perks.slayer_curse,
				},
			},
		},
	},
}
settings.buff_function_templates = {
	enemy_penny_curse_pulse = function (unit, buff, params, world)
		local t = params.t

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] and (buff.next_tick == nil or buff.next_tick and t > buff.next_tick) then
			local buff_system = Managers.state.entity:system("buff_system")
			local side_manager = Managers.state.side
			local template = buff.template
			local tick_rate = template.tick_rate
			local radius = template.radius
			local nearby_player_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.player_units_broadphase

			Broadphase.query(broadphase, POSITION_LOOKUP[unit], radius, nearby_player_units)

			buff.next_tick = t + tick_rate

			for _, player_unit in pairs(nearby_player_units) do
				local player = Managers.player:owner(player_unit)
				local is_bot = player and not player:is_player_controlled()

				if not is_bot and side_manager:is_enemy(unit, player_unit) then
					buff_system:add_buff(player_unit, "enemy_penny_curse", unit, false)
				end
			end
		end
	end,
}
