-- chunkname: @scripts/settings/mutators/mutator_blessing_of_isha.lua

require("scripts/settings/dlcs/morris/deus_blessing_settings")

local STAGGER_RADIUS = 5
local EXPLOSION_TEMPLATE_NAME = "blessing_of_isha_stagger"
local SOUND_EVENTS = {
	player_resurrected = "Play_blessing_of_isha_activate",
}
local VALID_DISABLE_EVENTS = {
	assassin_pounced = true,
	corruptor_grab = true,
	pack_master_grab = true,
}

local function stagger_enemies(radius, attacker_unit, explosion_template_name, position)
	position = position or POSITION_LOOKUP[attacker_unit]

	local world = Application.main_world()
	local rotation = Quaternion.identity()
	local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")
	local career_power_level = career_extension and career_extension:get_career_power_level()
	local explosion_template = ExplosionUtils.get_template(explosion_template_name)

	explosion_template.explosion.radius = radius

	DamageUtils.create_explosion(world, attacker_unit, position, rotation, explosion_template, 1, "buff", true, false, attacker_unit, career_power_level, false)
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

local function get_not_disabled_units(units, not_disabled_units_out)
	for _, unit in ipairs(units) do
		local status_extension = ALIVE[unit] and ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			local is_dead = status_extension:is_dead()
			local is_knocked = status_extension:is_knocked_down()
			local is_grabbed_by_corruptor = status_extension:is_grabbed_by_corruptor()
			local is_grabbed_by_pack_master = status_extension:is_grabbed_by_pack_master()
			local is_pounced_down = status_extension:is_pounced_down()

			if not is_dead and not is_knocked and not is_grabbed_by_corruptor and not is_grabbed_by_pack_master and not is_pounced_down then
				table.insert(not_disabled_units_out, unit)
			end
		end
	end
end

return {
	display_name = DeusBlessingSettings.blessing_of_isha.display_name,
	description = DeusBlessingSettings.blessing_of_isha.description,
	icon = DeusBlessingSettings.blessing_of_isha.icon,
	temp_not_disabled_units = {},
	server_start_function = function (context, data, unit)
		local hero_side = Managers.state.side:get_side_from_name("heroes")

		data.hero_side = hero_side
		data.buff_ids = {}
	end,
	try_activate_blessing = function (context, data, blessed_unit)
		if ALIVE[blessed_unit] then
			stagger_enemies(STAGGER_RADIUS, blessed_unit, EXPLOSION_TEMPLATE_NAME)
			remove_invincibility_buffs(data.buff_ids)
			display_effect(blessed_unit)

			local health_extension = ScriptUnit.extension(blessed_unit, "health_system")

			health_extension:reset()

			local dialogue_input = ScriptUnit.extension_input(blessed_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("blessing_isha_resurrected", event_data)

			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_2d_audio_event(SOUND_EVENTS.player_resurrected)
			remove_blessing("blessing_of_isha")

			local player_manager = Managers.player
			local player = player_manager:owner(blessed_unit)
			local local_player = player_manager:local_player()
			local local_human = player == local_player
			local predicate = "collected_isha_reward"

			Managers.state.event:trigger("add_coop_feedback", player:stats_id(), local_human, predicate, player, player)
			Managers.state.network.network_transmit:send_rpc_clients("rpc_coop_feedback", player:network_id(), player:local_player_id(), NetworkLookup.coop_feedback[predicate], player:network_id(), player:local_player_id())

			return true
		end

		return false
	end,
	server_player_disabled_function = function (context, data, disabling_event, target_unit, attacker_unit)
		if target_unit ~= data.blessed_unit then
			return
		end

		if not VALID_DISABLE_EVENTS[disabling_event] then
			return
		end

		if not data.hero_side then
			return
		end

		local successful = data.template.try_activate_blessing(context, data, target_unit)

		if successful and disabling_event == "corruptor_grab" then
			local position = POSITION_LOOKUP[attacker_unit]
			local radius = 1

			stagger_enemies(radius, target_unit, EXPLOSION_TEMPLATE_NAME, position)
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		if hit_unit ~= data.blessed_unit then
			return
		end

		if not data.hero_side then
			return
		end

		local health_extension = ScriptUnit.extension(hit_unit, "health_system")
		local health = health_extension:current_health()

		if health == 1 then
			data.template.try_activate_blessing(context, data, hit_unit)
		end
	end,
	server_update_function = function (context, data, dt, t)
		if not data.hero_side then
			return
		end

		local not_disabled_units = data.template.temp_not_disabled_units

		table.clear(not_disabled_units)
		get_not_disabled_units(data.hero_side.PLAYER_AND_BOT_UNITS, not_disabled_units)

		if #not_disabled_units == 1 then
			local unit = not_disabled_units[1]

			if data.blessed_unit ~= unit then
				remove_invincibility_buffs(data.buff_ids)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local has_buff = buff_extension:has_buff_type("blessing_of_isha_invincibility")

			if not has_buff then
				local buff_id = buff_extension:add_buff("blessing_of_isha_invincibility")

				data.buff_ids[unit] = buff_id
			end

			data.buff_active = true
			data.blessed_unit = unit
		else
			remove_invincibility_buffs(data.buff_ids)

			data.buff_active = false
			data.blessed_unit = nil
		end
	end,
}
