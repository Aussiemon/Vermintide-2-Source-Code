-- chunkname: @scripts/settings/mutators/mutator_whiterun.lua

local function resync_loadout()
	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local local_player = Managers.player:local_player()

	if not local_player then
		return
	end

	local talent_extension = ScriptUnit.has_extension(local_player.player_unit, "talent_system")

	if talent_extension then
		talent_extension:talents_changed()
	else
		local is_bot = local_player.bot_player

		profile_synchronizer:resync_loadout(local_player:network_id(), local_player:local_player_id(), is_bot)
	end
end

return {
	description = "description_mutator_whiterun",
	display_name = "display_name_mutator_whiterun",
	icon = "mutator_icon_whiterun",
	client_start_function = resync_loadout,
	client_stop_function = resync_loadout,
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
