require("scripts/settings/dlcs/morris/deus_blessing_settings")

local STAGGER_RADIUS = 5
local EXPLOSION_TEMPLATE_NAME = "blessing_of_isha_stagger"
local SOUND_EVENTS = {
	player_resurrected = "Play_blessing_of_isha_activate"
}

local function stagger_enemies(radius, player_unit, explosion_template_name)
	local world = Application.main_world()
	local hit_position = POSITION_LOOKUP[player_unit]
	local rotation = Quaternion.identity()
	local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
	local career_power_level = career_extension and career_extension:get_career_power_level()
	local explosion_template = ExplosionTemplates[explosion_template_name]
	explosion_template.explosion.radius = radius

	DamageUtils.create_explosion(world, player_unit, hit_position, rotation, explosion_template, 1, "buff", true, false, player_unit, career_power_level, false)
end

local function remove_blessing(blessing_name)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()

	if deus_run_controller then
		deus_run_controller:remove_blessing(blessing_name)
	end

	local game_mode_manager = Managers.state.game_mode
	local mutator_active = game_mode_manager:has_activated_mutator(blessing_name)

	if mutator_active then
		game_mode_manager:deactivate_mutator(blessing_name)
	end
end

local function remove_invincibility_buffs(buff_ids)
	for player_unit, buff_id in pairs(buff_ids) do
		local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if buff_extension then
			buff_extension:remove_buff(buff_id)
		end
	end

	table.clear(buff_ids)
end

local function display_effect(unit)
	local status_extension = ScriptUnit.has_extension(unit, "status_system")

	if status_extension then
		status_extension:healed("healing_draught")
	end
end

local function get_not_downed_units(units, not_downed_units_out)
	for _, unit in ipairs(units) do
		if ALIVE[unit] then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")
			local is_dead = status_extension and status_extension:is_dead()
			local is_knocked = status_extension and status_extension:is_knocked_down()

			if not is_dead and not is_knocked then
				table.insert(not_downed_units_out, unit)
			end
		end
	end
end

return {
	display_name = DeusBlessingSettings.blessing_of_isha.display_name,
	description = DeusBlessingSettings.blessing_of_isha.description,
	icon = DeusBlessingSettings.blessing_of_isha.icon,
	temp_not_downed_units = {},
	server_start_function = function (context, data, unit)
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		data.hero_side = hero_side
		data.buff_ids = {}
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local not_downed_units = data.template.temp_not_downed_units

		table.clear(not_downed_units)

		local player_units = data.hero_side.PLAYER_UNITS

		get_not_downed_units(player_units, not_downed_units)

		if #not_downed_units == 1 and table.contains(not_downed_units, hit_unit) then
			local health_extension = ScriptUnit.extension(hit_unit, "health_system")
			local damage = hit_data[1]
			local health = health_extension:current_health()
			local killing_blow = health <= damage

			if killing_blow then
				stagger_enemies(STAGGER_RADIUS, hit_unit, EXPLOSION_TEMPLATE_NAME)
				remove_invincibility_buffs(data.buff_ids)
				display_effect(hit_unit)
				health_extension:reset()

				local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("blessing_isha_resurrected", event_data)

				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:play_2d_audio_event(SOUND_EVENTS.player_resurrected)
				remove_blessing("blessing_of_isha")

				local player = Managers.player:owner(hit_unit)
				local local_human = player and player.local_player

				if local_human then
					Managers.state.event:trigger("add_coop_feedback", player:stats_id(), local_human, "collected_isha_reward", player, player)
				end
			end
		end
	end,
	server_update_function = function (context, data, dt, t)
		local not_downed_units = data.template.temp_not_downed_units

		table.clear(not_downed_units)
		get_not_downed_units(data.hero_side.PLAYER_UNITS, not_downed_units)

		if #not_downed_units == 1 then
			local unit = not_downed_units[1]
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local has_buff = buff_extension:has_buff_type("blessing_of_isha_invincibility")

			if not has_buff then
				local buff_id = buff_extension:add_buff("blessing_of_isha_invincibility")
				data.buff_ids[unit] = buff_id
			end
		else
			remove_invincibility_buffs(data.buff_ids)
		end
	end
}
