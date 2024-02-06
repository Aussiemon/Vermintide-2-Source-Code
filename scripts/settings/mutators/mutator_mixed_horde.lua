-- chunkname: @scripts/settings/mutators/mutator_mixed_horde.lua

return {
	description = "description_mutator_mixed_horde",
	display_name = "display_name_mutator_mixed_horde",
	icon = "mutator_icon_specials_frequency",
	update_conflict_settings = function (context, data)
		CurrentHordeSettings.ambush_composition = "mutator_mixed_horde"
		CurrentHordeSettings.vector_composition = "mutator_mixed_horde"
		CurrentHordeSettings.vector_blob_composition = "mutator_mixed_horde"
	end,
}
