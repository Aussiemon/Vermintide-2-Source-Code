-- chunkname: @scripts/imgui/imgui_cat_tester_tools.lua

ImguiCatTesterTools = class(ImguiCatTesterTools)
ImguiCatTesterTools.curated_pickup_list = ImguiCatTesterTools.curated_pickup_list or {
	"all_ammo_small",
	"cooldown_reduction_potion",
	"damage_boost_potion",
	"deus_relic_01",
	"deus_soft_currency",
	"deus_weapon_chest",
	"explosive_barrel",
	"fire_grenade_t1",
	"first_aid_kit",
	"frag_grenade_t1",
	"engineer_grenade_t1",
	"grimoire",
	"healing_draught",
	"lamp_oil",
	"speed_boost_potion",
	"tome",
	"torch",
}
ImguiCatTesterTools.curated_breed_list = ImguiCatTesterTools.curated_breed_list or {
	"beastmen_bestigor",
	"beastmen_gor",
	"beastmen_minotaur",
	"beastmen_standard_bearer",
	"beastmen_ungor_archer",
	"beastmen_ungor",
	"chaos_berzerker",
	"chaos_corruptor_sorcerer",
	"chaos_fanatic",
	"chaos_marauder_with_shield",
	"chaos_marauder",
	"chaos_raider",
	"chaos_spawn",
	"chaos_troll",
	"chaos_vortex_sorcerer",
	"chaos_warrior",
	"critter_pig",
	"skaven_clan_rat_with_shield",
	"skaven_clan_rat",
	"skaven_gutter_runner",
	"skaven_pack_master",
	"skaven_plague_monk",
	"skaven_poison_wind_globadier",
	"skaven_rat_ogre",
	"skaven_ratling_gunner",
	"skaven_slave",
	"skaven_storm_vermin_with_shield",
	"skaven_storm_vermin",
	"skaven_stormfiend",
	"skaven_warpfire_thrower",
}

local localization_placeholders = {
	_UNKNOWN = "Unknown",
	beastmen_bestigor = "Bestigor",
	beastmen_gor = "Gor",
	beastmen_ungor = "Ungor",
	beastmen_ungor_archer = "Ungor Archer",
	chaos_fanatic = "Fanatic",
	critter_pig = "xdd",
	skaven_clan_rat_with_shield = "Clan Rat w/ Shield",
	skaven_storm_vermin_with_shield = "Stormvermin w/ Shield",
}

local function custom_localize(key)
	local val = localization_placeholders[key]

	if not val then
		val = Localize(key)
		localization_placeholders[key] = val
	end

	return val
end

local function cmp_localized_strings(a, b)
	return custom_localize(a) < custom_localize(b)
end

ImguiCatTesterTools.init = function (self)
	table.sort(ImguiCatTesterTools.curated_breed_list, cmp_localized_strings)

	self._breed_index = 0
	self._breed_filter_text = ""
	self._breed_names = table.map(ImguiCatTesterTools.curated_breed_list, custom_localize)
	self._breed_results = table.shallow_copy(self._breed_names)

	table.sort(ImguiCatTesterTools.curated_pickup_list, cmp_localized_strings)

	self._pickup_index = 0
	self._pickup_filter_text = ""
	self._pickup_names = table.map(ImguiCatTesterTools.curated_pickup_list, function (pickup_name)
		local pickup_settings = AllPickups[pickup_name]

		return custom_localize(pickup_settings and pickup_settings.hud_description or "_UNKNOWN")
	end)
	self._pickup_results = table.shallow_copy(self._pickup_names)

	table.sort(self._pickup_names)
end

ImguiCatTesterTools.update = function (self)
	return
end

ImguiCatTesterTools.draw = function (self)
	local do_close = Imgui.begin_window("CAT Tester Tools")

	Imgui.begin_child_window("Pickups", 0, 150, false)

	self._pickup_index, self._pickup_results, self._pickup_filter_text = ImguiX.combo_search(self._pickup_index, self._pickup_results, self._pickup_filter_text, self._pickup_names)

	local pickup_name = ImguiCatTesterTools.curated_pickup_list[self._pickup_index]

	if Imgui.button("Spawn Pickup", 100, 20) and pickup_name then
		self:_spawn_pickup(pickup_name)
	end

	Imgui.end_child_window()
	Imgui.begin_child_window("Breeds", 0, 150, false)

	self._breed_index, self._breed_results, self._breed_filter_text = ImguiX.combo_search(self._breed_index, self._breed_results, self._breed_filter_text, self._breed_names)

	local breed_name = ImguiCatTesterTools.curated_breed_list[self._breed_index]

	if Imgui.button("Spawn Breed", 100, 20) and breed_name then
		self:_spawn_breed(breed_name)
	end

	Imgui.end_child_window()
	Imgui.begin_child_window("Settings", 0, 150, true)

	script_data.disable_ai_perception = Imgui.checkbox("Disable AI Perception", script_data.disable_ai_perception or false)
	script_data.player_invincible = Imgui.checkbox("Player Invincible", script_data.player_invincible or false)
	script_data.infinite_ammo = Imgui.checkbox("Infinite Ammo", script_data.infinite_ammo or false)
	script_data.disable_overcharge = Imgui.checkbox("Disable Overcharge", script_data.disable_overcharge or false)
	script_data.short_ability_cooldowns = Imgui.checkbox("Short Ability Cooldowns", script_data.short_ability_cooldowns or false)

	if Imgui.radio_button("Normal crit", not script_data.no_critical_strikes and not script_data.always_critical_strikes) then
		script_data.no_critical_strikes = false
		script_data.always_critical_strikes = false
	elseif Imgui.radio_button("Never crit", not not script_data.no_critical_strikes) then
		script_data.no_critical_strikes = true
		script_data.always_critical_strikes = false
	elseif Imgui.radio_button("Always crit", not not script_data.always_critical_strikes) then
		script_data.no_critical_strikes = false
		script_data.always_critical_strikes = true
	end

	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiCatTesterTools._spawn_pickup = function (self, pickup_name)
	local world = Application.main_world()
	local position = Managers.state.conflict:player_aim_raycast(world, false, "filter_ray_horde_spawn")

	if position then
		Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", NetworkLookup.pickup_names[pickup_name], position, Quaternion.identity(), NetworkLookup.pickup_spawn_types.dropped)
	end
end

ImguiCatTesterTools._spawn_breed = function (self, breed_name)
	local conflict_director = Managers.state.conflict

	conflict_director:aim_spawning(Breeds[breed_name], true)
end

ImguiCatTesterTools.is_persistent = function (self)
	return false
end
