require("scripts/settings/dlcs/morris/deus_blessing_settings")

local BOSS_BUFF = "blessing_of_grimnir_boss_buff"
local PLAYER_BUFF = "blessing_of_grimnir_player_buff"
local SOUND_EVENTS = {
	monster_killed = "Play_blessing_challenge_of_grimnir_activate"
}

local function buff_all_players(buff_name)
	local side = Managers.state.side:get_side_from_name("heroes")
	local current_player_units = side.PLAYER_UNITS
	local num_current_player_units = #current_player_units
	local unit_alive = AiUtils.unit_alive
	local buff_system = Managers.state.entity:system("buff_system")
	local server_controlled = false

	for i = 1, num_current_player_units do
		local unit = current_player_units[i]
		local is_alive = unit_alive(unit)

		if is_alive then
			buff_system:add_buff(unit, buff_name, unit, server_controlled)
		end
	end
end

return {
	display_name = DeusBlessingSettings.blessing_of_grimnir.display_name,
	description = DeusBlessingSettings.blessing_of_grimnir.description,
	icon = DeusBlessingSettings.blessing_of_grimnir.icon,
	server_start_function = function (context, data, unit)
		local conflict_director = Managers.state.conflict

		if not conflict_director.enemy_recycler then
			return
		end

		local existing_events = conflict_director.enemy_recycler.main_path_events

		for _, event in ipairs(existing_events) do
			if event[4].event_kind == "event_boss" then
				return
			end
		end

		local boss_spawners = conflict_director.level_analysis.terror_spawners.event_boss.spawners

		if #boss_spawners <= 0 then
			return
		end

		local spawner = boss_spawners[1]
		local spawner_pos = Unit.local_position(spawner[1], 0)
		local boxed_pos = Vector3Box(spawner_pos)
		local event_data = {
			event_kind = "event_boss"
		}
		local terror_events = CurrentBossSettings.boss_events.event_lookup.event_boss
		local seed = Managers.mechanism:get_level_seed("mutator")
		local _, index = Math.next_random(seed, 1, #terror_events)
		local terror_event_name = terror_events[index]

		conflict_director.enemy_recycler:add_main_path_terror_event(boxed_pos, terror_event_name, 45, event_data)
	end,
	server_update_function = function (context, data, dt, t)
		if data.unit_to_mark and Managers.state.network:game_object_or_level_id(data.unit_to_mark) then
			local unit = data.unit_to_mark
			data.marked_unit = unit
			data.unit_to_mark = nil
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(unit, "objective_unit", unit)
			buff_system:add_buff(unit, BOSS_BUFF, unit)

			local blackboard = BLACKBOARDS[unit]
			blackboard.optional_spawn_data = blackboard.optional_spawn_data or {}
			blackboard.optional_spawn_data.prevent_killed_enemy_dialogue = true
			local player_unit = DialogueSystem:get_random_player()

			if player_unit then
				local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("blessing_grimnir_monster_spotted", event_data)
			end
		end
	end,
	server_ai_spawned_function = function (context, data, unit)
		if data.boss_spawned then
			return
		end

		local breed = Unit.get_data(unit, "breed")

		if breed.boss then
			data.boss_spawned = true
			data.unit_to_mark = unit
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit)
		if killed_unit == data.marked_unit then
			buff_all_players(PLAYER_BUFF)

			data.marked_unit = nil
			local unit = DialogueSystem:get_random_player()

			if unit then
				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("blessing_grimnir_monster_killed", event_data)
			end

			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_2d_audio_event(SOUND_EVENTS.monster_killed)

			local peer_id = Network.peer_id()
			local player = Managers.player:player_from_peer_id(peer_id)
			local local_human = player and player.local_player

			if local_human then
				Managers.state.event:trigger("add_coop_feedback", player:stats_id(), local_human, "collected_grimnir_reward", player, player)
			end
		end
	end
}
