-- chunkname: @scripts/settings/versus_custom_settings_templates.lua

local function numeric_incremented_value_table(min_val, max_val, step, optional_additional_values)
	local settings = {}

	settings[1] = min_val

	local num_steps = (max_val - min_val) / step

	for i = 1, num_steps do
		settings[i + 1] = min_val + step * i
	end

	if optional_additional_values then
		for k, v in pairs(optional_additional_values) do
			settings[#settings + 1] = v
		end

		table.clear(optional_additional_values)
	end

	return settings
end

local custom_game_settings_template = {
	{
		default = true,
		setting_name = "early_win_enabled",
		values = {
			true,
			false,
		},
	},
	{
		default = true,
		setting_name = "hero_bots_enabled",
		values = {
			true,
			false,
		},
	},
	{
		default = "random",
		setting_name = "starting_as_heroes",
		values = {
			1,
			2,
			"random",
		},
	},
	{
		default = 3,
		setting_name = "wounds_amount",
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
		},
	},
	{
		default = 250,
		setting_name = "knockdown_hp",
		values = numeric_incremented_value_table(0, 500, 50),
	},
	{
		default = false,
		setting_name = "round_time_limit",
		values = numeric_incremented_value_table(3, 20, 1, {
			false,
		}),
	},
	{
		default = 100,
		setting_name = "horde_ability_recharge_rate_percent",
		values = numeric_incremented_value_table(0, 500, 25),
	},
	{
		default = false,
		setting_name = "friendly_fire",
		values = {
			false,
			"harder",
			"hardest",
		},
	},
	{
		default = "default",
		setting_name = "pactsworn_respawn_timer",
		values = numeric_incremented_value_table(0, 60, 5, {
			"default",
		}),
	},
	{
		default = 40,
		setting_name = "catch_up_with_heroes",
		values = numeric_incremented_value_table(0, 100, 10),
	},
	{
		default = 1,
		setting_name = "hero_damage_taken",
		values = numeric_incremented_value_table(0.1, 5, 0.1),
	},
	{
		default = false,
		setting_name = "hero_rescues_enabled",
		values = {
			true,
			false,
		},
	},
	{
		default = 8,
		setting_name = "special_spawn_range_distance",
		values = numeric_incremented_value_table(0, 100, 2),
	},
	{
		default = 12,
		setting_name = "boss_spawn_range_distance",
		values = numeric_incremented_value_table(0, 100, 2),
	},
	{
		default = false,
		setting_name = "pactsworn_stagger_immunity",
		values = {
			true,
			false,
		},
	},
	{
		default = 2,
		setting_name = "num_pactsworn_picking_options",
		values = numeric_incremented_value_table(1, 7, 1),
	},
	{
		default = 1,
		setting_name = "vs_ratling_gunner_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0, 1, 0.1),
	},
	{
		default = 1,
		setting_name = "vs_packmaster_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0, 1, 0.1),
	},
	{
		default = 1,
		setting_name = "vs_gutter_runner_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0, 1, 0.1),
	},
	{
		default = 1,
		setting_name = "vs_poison_wind_globadier_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0, 1, 0.1),
	},
	{
		default = 1,
		setting_name = "vs_warpfire_thrower_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0, 1, 0.1),
	},
	{
		default = "default",
		setting_name = "vs_chaos_troll_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0.1, 1, 0.1, {
			false,
			"default",
		}),
	},
	{
		default = "default",
		setting_name = "vs_rat_ogre_spawn_chance_multiplier",
		values = numeric_incremented_value_table(0.1, 1, 0.1, {
			false,
			"default",
		}),
	},
	{
		default = 50,
		setting_name = "vs_ratling_gunner_hp",
		values = numeric_incremented_value_table(10, 1000, 10),
	},
	{
		default = 50,
		setting_name = "vs_packmaster_hp",
		values = numeric_incremented_value_table(10, 1000, 10),
	},
	{
		default = 30,
		setting_name = "vs_gutter_runner_hp",
		values = numeric_incremented_value_table(10, 1000, 10),
	},
	{
		default = 30,
		setting_name = "vs_poison_wind_globadier_hp",
		values = numeric_incremented_value_table(10, 1000, 10),
	},
	{
		default = 50,
		setting_name = "vs_warpfire_thrower_hp",
		values = numeric_incremented_value_table(10, 1000, 10),
	},
	{
		default = 800,
		setting_name = "vs_chaos_troll_hp",
		values = numeric_incremented_value_table(100, 5000, 100),
	},
	{
		default = 800,
		setting_name = "vs_rat_ogre_hp",
		values = numeric_incremented_value_table(100, 5000, 100),
	},
}
local id = 0

for _, setting in ipairs(custom_game_settings_template) do
	id = id + 1
	setting.id = id
	custom_game_settings_template[setting.setting_name] = setting

	local values = setting.values

	setting.values_reverse_lookup = {}

	for k, v in pairs(values) do
		setting.values_reverse_lookup[v] = k
	end
end

return custom_game_settings_template
