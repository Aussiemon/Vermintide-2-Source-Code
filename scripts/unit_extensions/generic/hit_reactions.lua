HitReactions = {}
local DamageDataIndex = DamageDataIndex
local ignored_damage_types = {
	temporary_health_degen = true,
	kinetic = true,
	wounded_dot = true,
	buff = true,
	heal = true,
	knockdown_bleed = true,
	health_degen = true,
	buff_shared_medpack = true
}

local function trigger_player_friendly_fire_dialogue(player_unit, attacker_unit)
	local player_manager = Managers.player

	if player_unit ~= attacker_unit and player_manager.is_player_unit(player_manager, attacker_unit) then
		local profile_name_victim = ScriptUnit.extension(player_unit, "dialogue_system").context.player_profile
		local profile_name_attacker = ScriptUnit.extension(attacker_unit, "dialogue_system").context.player_profile
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.target = profile_name_victim
		event_data.player_profile = profile_name_attacker

		dialogue_input.trigger_dialogue_event(dialogue_input, "friendly_fire", event_data)
	end

	return 
end

local function trigger_enemy_armor_hit_dialogue(enemy_unit, player_unit, damage_dealt, hit)
	local player_manager = Managers.player
	local owner = player_manager.unit_owner(player_manager, player_unit)

	if player_manager.is_player_unit(player_manager, player_unit) and not owner.remote and player_unit ~= enemy_unit and Unit.alive(enemy_unit) then
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if buff_extension.has_buff_type(buff_extension, "armor penetration") == false and damage_dealt < 0.5 then
			local breed_data = Unit.get_data(enemy_unit, "breed")

			if breed_data and breed_data.armor_category == 2 and hit[4] ~= "head" and hit[4] ~= "neck" then
				SurroundingAwareSystem.add_event(player_unit, "armor_hit", DialogueSettings.armor_hit_broadcast_range, "profile_name", ScriptUnit.extension(player_unit, "dialogue_system").context.player_profile)
			end
		end
	end

	return 
end

HitReactions.templates = {
	ai_default = {
		unit = function (unit, dt, context, t, hit)
			local attacker_unit = hit[DamageDataIndex.ATTACKER]
			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]
			local damage_taken = hit[DamageDataIndex.DAMAGE_AMOUNT]
			local damaged_by_other = unit ~= attacker_unit

			if damage_type ~= "push" and damaged_by_other then
				ScriptUnit.extension(unit, "ai_system"):attacked(attacker_unit, t, hit)
			end

			trigger_enemy_armor_hit_dialogue(unit, attacker_unit, damage_taken, hit)

			return 
		end,
		husk = function (unit, dt, context, t, hit)
			return 
		end
	},
	player = {
		unit = function (unit, dt, context, t, hit)
			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]

			if not ignored_damage_types[damage_type] then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				if 0 < hit[DamageDataIndex.DAMAGE_AMOUNT] and Development.parameter("screen_space_player_camera_reactions") ~= false then
					first_person_extension.animation_event(first_person_extension, "shake_get_hit")
				end

				local attacker = hit[DamageDataIndex.ATTACKER]

				trigger_player_friendly_fire_dialogue(unit, attacker)
			end

			return 
		end,
		husk = function (unit, dt, context, t, hit)
			local attacker = hit[DamageDataIndex.ATTACKER]

			trigger_player_friendly_fire_dialogue(unit, attacker)

			return 
		end
	},
	level_object = {
		unit = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension.current_health(health_extension)

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")

			return 
		end,
		husk = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension.current_health(health_extension)

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")

			return 
		end
	},
	dummy = {
		unit = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension.current_health(health_extension)

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")

			return 
		end,
		husk = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension.current_health(health_extension)

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")

			return 
		end,
		hit_zones = {
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			"full",
			nil,
			"head",
			"head"
		}
	}
}
HitReactions.get_reaction = function (hit_reaction_template, is_husk)
	local templates = HitReactions.templates
	local husk_key = (is_husk and "husk") or "unit"
	local reaction_table = templates[hit_reaction_template]

	if is_husk and reaction_table.husk ~= nil then
		return reaction_table.husk
	end

	return reaction_table.unit
end

return 
