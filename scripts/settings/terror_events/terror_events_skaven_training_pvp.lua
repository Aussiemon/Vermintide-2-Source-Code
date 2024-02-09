-- chunkname: @scripts/settings/terror_events/terror_events_skaven_training_pvp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local terror_event_blueprints = {
	stronghold_pacing_off = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	stronghold_pacing_on = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
