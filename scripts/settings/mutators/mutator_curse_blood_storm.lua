local base_nurgle_storm = require("scripts/settings/mutators/mutator_nurgle_storm_v2")
local curse_blood_storm = table.clone(base_nurgle_storm)
curse_blood_storm.display_name = "curse_blood_storm_name"
curse_blood_storm.description = "curse_blood_storm_desc"
curse_blood_storm.icon = "deus_curse_khorne_01"
local DIFFICULTY_POWER_LEVEL = {
	harder = 60,
	hard = 45,
	normal = 30,
	hardest = 80,
	cataclysm = 100,
	cataclysm_3 = 130,
	cataclysm_2 = 110,
	easy = 20
}

curse_blood_storm.server_start_function = function (context, data)
	local time = Managers.time:time("game")
	data.spawn_nurgle_storm_at = time + 30
	data.next_bleed_time = 0
	data.bleed_rate = 0.2
	data.bleed_buff = "curse_blood_storm_dot"
	data.bleed_buff_bots = "curse_blood_storm_dot_bots"
	data.vortex_template_name = "blood_storm"
	data.vortex_template = VortexTemplates[data.vortex_template_name]
	data.inner_decal_unit_name = "units/decals/deus_decal_bloodstorm_inner"
	data.outer_decal_unit_name = "units/decals/deus_decal_bloodstorm_outer"
	data.storm_spawn_position = Vector3Box()
	data.offset_spawn_distance = 3
	data.delay_between_spawns = 2
	data.unchecked_positions = {}
	data.astar = GwNavAStar.create()
end

local base_update_function = curse_blood_storm.server_update_function

curse_blood_storm.server_update_function = function (context, data, dt, t)
	base_update_function(context, data)

	if t < data.next_bleed_time then
		return
	else
		data.next_bleed_time = t + data.bleed_rate
	end

	local vortex_unit = data.summoned_vortex_unit
	local vortex_extension = ALIVE[vortex_unit] and ScriptUnit.has_extension(vortex_unit, "ai_supplementary_system")

	if not vortex_extension then
		return
	end

	local players = Managers.player:players()

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local position = POSITION_LOOKUP[player_unit]
			local is_inside = vortex_extension:is_position_inside(position)

			if is_inside then
				local buff_system = Managers.state.entity:system("buff_system")
				local difficulty = Managers.state.difficulty:get_difficulty()
				local power_level = DIFFICULTY_POWER_LEVEL[difficulty]
				local buff = (player.bot_player and data.bleed_buff_bots) or data.bleed_buff

				buff_system:add_buff(player_unit, buff, vortex_unit, false, power_level)
			end
		end
	end
end

curse_blood_storm.server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
	local damage_type = hit_data[2]

	if damage_type == "blood_storm" then
		local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
	end
end

return curse_blood_storm
