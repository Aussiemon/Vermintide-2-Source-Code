local settings = DLCSettings.geheimnisnacht_2021
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
settings.buff_templates = {
	geheimnisnacht_2021_event_horde_buff = {
		buffs = {
			{
				multiplier = 0.25,
				name = "geheimnisnacht_2021_event_damage",
				stat_buff = "damage_dealt"
			},
			{
				multiplier = 1.25,
				name = "geheimnisnacht_2021_event_health",
				stat_buff = "max_health"
			},
			{
				remove_buff_func = "ai_update_max_health",
				name = "geheimnisnacht_2021_event_health_update",
				apply_buff_func = "ai_update_max_health"
			},
			{
				remove_buff_func = "geheimnisnacht_2021_remove_eye_glow",
				name = "geheimnisnacht_2021_event_eye_glow",
				apply_buff_func = "geheimnisnacht_2021_apply_eye_glow"
			},
			{
				multiplier = 1.1,
				name = "geheimnisnacht_2021_event_stagger",
				stat_buff = "stagger_resistance"
			},
			{
				multiplier = 0.9,
				name = "geheimnisnacht_2021_event_hit_mass",
				stat_buff = "hit_mass_amount"
			}
		}
	},
	geheimnisnacht_2021_event_cultist_buff = {
		buffs = {
			{
				multiplier = 0.25,
				name = "geheimnisnacht_2021_event_damage",
				stat_buff = "damage_dealt"
			},
			{
				multiplier = 1.25,
				name = "geheimnisnacht_2021_event_health",
				stat_buff = "max_health"
			},
			{
				remove_buff_func = "ai_update_max_health",
				name = "geheimnisnacht_2021_event_health_update",
				apply_buff_func = "ai_update_max_health"
			},
			{
				remove_buff_func = "geheimnisnacht_2021_remove_eye_glow",
				name = "geheimnisnacht_2021_event_eye_glow",
				apply_buff_func = "geheimnisnacht_2021_apply_eye_glow"
			},
			{
				multiplier = 1.1,
				name = "geheimnisnacht_2021_event_stagger",
				stat_buff = "stagger_resistance"
			},
			{
				multiplier = 0.9,
				name = "geheimnisnacht_2021_event_hit_mass",
				stat_buff = "hit_mass_amount"
			}
		}
	}
}
settings.buff_function_templates = {
	geheimnisnacht_2021_apply_eye_glow = function (unit, buff, params)
		local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

		if not ALIVE[unit] then
			return
		end

		if not buff_ext.reset_material_cache then
			buff_ext.reset_material_cache = Unit.get_material_resource_id(unit, "mtr_eyes")
		end

		Unit.set_material(unit, "mtr_eyes", "units/beings/enemies/mtr_eyes_geheimnisnacht")
	end,
	geheimnisnacht_2021_remove_eye_glow = function (unit, buff, params)
		local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

		if not ALIVE[unit] or not buff_ext.reset_material_cache then
			return
		end

		Unit.set_material_from_id(unit, "mtr_eyes", buff_ext.reset_material_cache)
	end
}
settings.proc_functions = {}
settings.stacking_buff_functions = {}
