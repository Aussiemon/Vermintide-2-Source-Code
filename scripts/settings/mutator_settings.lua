require("scripts/helpers/mutator_utils")

local mutators_to_add = {
	"no_ammo",
	"no_pickups",
	"player_dot",
	"instant_death",
	"whiterun",
	"no_respawn",
	"elite_run",
	"specials_frequency",
	"more_specials",
	"same_specials",
	"big_specials",
	"elite_specials",
	"gutter_runner_mayhem",
	"chaos_warriors_trickle",
	"mixed_horde",
	"multiple_bosses",
	"hordes_galore",
	"powerful_elites",
	"corpse_explosion",
	"shared_health_pool",
	"high_intensity",
	"wave_of_plague_monks",
	"wave_of_berzerkers",
	"night_mode",
	"life",
	"metal",
	"heavens",
	"light",
	"shadow",
	"fire",
	"death",
	"beasts",
	"twitch_darkness"
}

DLCUtils.append("mutators", mutators_to_add)

local mutator_settings = {}

for i = 1, #mutators_to_add do
	local name = mutators_to_add[i]
	local path = string.format("scripts/settings/mutators/mutator_%s", name)
	local data = local_require(path)

	fassert(mutator_settings[name] == nil, "Error! Trying to add mutator settings for %s twice!", name)

	mutator_settings[name] = data
end

return mutator_settings
