-- chunkname: @scripts/settings/mutators/mutator_whiterun.lua

return {
	description = "description_mutator_whiterun",
	display_name = "display_name_mutator_whiterun",
	icon = "mutator_icon_whiterun",
	check_dependencies = function ()
		if not BackendUtils.get_total_power_level then
			return false
		end

		if not GearUtils.get_property_and_trait_buffs then
			return false
		end

		return true
	end,
}
