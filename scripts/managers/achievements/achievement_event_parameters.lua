-- chunkname: @scripts/managers/achievements/achievement_event_parameters.lua

local AchievementEventParameters = {}

AchievementEventParameters.on_hit = table.mirror_array_inplace({
	"hit_unit",
	"attack_type",
	"hit_zone_name",
	"target_number",
	"buff_type",
	"is_critical",
	"unmodified",
	"unit",
	"damage_source",
})

return AchievementEventParameters
