local settings = DLCSettings.scorpion
settings.unlock_settings = {
	scorpion_beta_extended_access = {
		class = "UnlockDlc",
		id = "1093530"
	}
}
settings.unlock_settings_xb1 = {
	scorpion = {
		class = "AlwaysUnlocked"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		scorpion = {
			class = "AlwaysUnlocked"
		}
	},
	CUSA13645_00 = {
		scorpion = {
			class = "AlwaysUnlocked"
		}
	}
}
settings.statistics_lookup = {
	"scorpion_weaves_heavens_season_1",
	"weave_beasts_destroyed_totems",
	"weave_light_low_curse",
	"scorpion_weaves_fire_season_1",
	"weave_shadow_kill_no_shrouded",
	"weave_death_hit_by_spirit"
}
settings.husk_lookup = {
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/wpn_dw_thrown_axe_01_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/prj_dw_thrown_axe_01_t2_magic_01_3ps",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2_magic_01",
	"units/test_unit/light_beacon",
	"units/weave/beasts/beast_totem_mutator",
	"units/gameplay/weave_capture_point",
	"units/gameplay/weave_interaction",
	"units/gameplay/weave_kill_enemies",
	"units/props/generic/weave_target",
	"units/gameplay/weave/weave_prop_skaven_doom_wheel_01"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_scorpion"
}
settings.end_view = {
	"scripts/ui/views/level_end/level_end_view_weave"
}
settings.end_view_state = {
	"scripts/ui/views/level_end/states/end_view_state_weave"
}
local wind_names = {
	"life",
	"metal",
	"beasts",
	"heavens",
	"light",
	"fire",
	"shadow",
	"death"
}
local level_names = {
	"wall",
	"pit",
	"rubble",
	"woods",
	"field",
	"swamp",
	"mine",
	"river",
	"canyon",
	"alleys",
	"arena_castle",
	"arena_temple",
	"arena_void"
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/scorpion/scorpion_interactions"
}
settings.level_packages = {}

for i = 1, #level_names, 1 do
	local level_name = level_names[i]
	local level_key = "dlc_scorpion_" .. level_name

	for j = 1, #wind_names, 1 do
		local wind_name = wind_names[j]
		local wind_level_name = level_key .. "_" .. wind_name
		local package_name = "resource_packages/levels/dlcs/scorpion/" .. level_name
		settings.level_packages[wind_level_name] = {
			package_name
		}
	end
end

return
