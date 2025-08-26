-- chunkname: @scripts/unit_extensions/generic/hit_reactions.lua

HitReactions = {}

local DamageDataIndex = DamageDataIndex
local ignored_damage_types = {
	buff = true,
	buff_shared_medpack = true,
	buff_shared_medpack_temp_health = true,
	curse_empathy = true,
	heal = true,
	health_degen = true,
	kinetic = true,
	knockdown_bleed = true,
	life_drain = true,
	life_tap = true,
	push = true,
	temporary_health_degen = true,
	wounded_dot = true,
}

local function trigger_player_friendly_fire_dialogue(player_unit, attacker_unit)
	local player_manager = Managers.player

	if player_unit ~= attacker_unit and player_manager:is_player_unit(attacker_unit) then
		local profile_name_victim = ScriptUnit.extension(player_unit, "dialogue_system").context.player_profile
		local profile_name_attacker = ScriptUnit.extension(attacker_unit, "dialogue_system").context.player_profile
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		event_data.target = profile_name_victim
		event_data.player_profile = profile_name_attacker

		dialogue_input:trigger_dialogue_event("friendly_fire", event_data)
	end
end

local function trigger_enemy_armor_hit_dialogue(enemy_unit, player_unit, damage_dealt, hit)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if player_manager:is_player_unit(player_unit) and not owner.remote and player_unit ~= enemy_unit and Unit.alive(enemy_unit) then
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if buff_extension:has_buff_perk("potion_armor_penetration") == false and damage_dealt < 0.5 then
			local breed_data = Unit.get_data(enemy_unit, "breed")

			if breed_data and breed_data.armor_category == 2 and hit[4] ~= "head" and hit[4] ~= "neck" then
				SurroundingAwareSystem.add_event(player_unit, "armor_hit", DialogueSettings.armor_hit_broadcast_range, "profile_name", ScriptUnit.extension(player_unit, "dialogue_system").context.player_profile)
			end
		end
	end
end

local dot_hit_types = {
	arrow_poison_dot = true,
	bleed = true,
	burninating = true,
}

HitReactions.templates = {
	ai_default = {
		unit = function (unit, dt, context, t, hit)
			local attacker_unit = hit[DamageDataIndex.ATTACKER]
			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]
			local damage_taken = hit[DamageDataIndex.DAMAGE_AMOUNT]
			local damaged_by_other = unit ~= attacker_unit

			if damage_type ~= "push" and damaged_by_other then
				ScriptUnit.extension(unit, "ai_system"):attacked(attacker_unit, t, hit)
				trigger_enemy_armor_hit_dialogue(unit, attacker_unit, damage_taken, hit)
			end

			Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, hit)
		end,
		husk = function (unit, dt, context, t, hit)
			local attacker_unit = hit[DamageDataIndex.ATTACKER]

			Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, hit)
		end,
	},
	player = {
		unit = function (unit, dt, context, t, hit)
			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]

			if not ignored_damage_types[damage_type] then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				if hit[DamageDataIndex.DAMAGE_AMOUNT] > 0 and Development.parameter("screen_space_player_camera_reactions") ~= false then
					first_person_extension:animation_event("shake_get_hit")
				end

				local attacker = hit[DamageDataIndex.ATTACKER]

				if not dot_hit_types[damage_type] then
					trigger_player_friendly_fire_dialogue(unit, attacker)
				end
			end
		end,
		husk = function (unit, dt, context, t, hit)
			local attacker = hit[DamageDataIndex.ATTACKER]
			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]

			if not ignored_damage_types[damage_type] and not dot_hit_types[damage_type] then
				trigger_player_friendly_fire_dialogue(unit, attacker)
			end
		end,
	},
	level_object = {
		unit = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension:current_health()

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")
		end,
		husk = function (unit, dt, context, t, hit)
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local current_health = health_extension:current_health()

			Unit.set_flow_variable(unit, "current_health", current_health)
			Unit.flow_event(unit, "lua_on_damage_taken")
		end,
	},
	dummy = {
		unit = function (unit, dt, context, t, hit)
			local hit_type = hit[2]
			local ignore_damage_taken_flow_event = false

			if hit_type then
				ignore_damage_taken_flow_event = dot_hit_types[hit_type]
			end

			if not ignore_damage_taken_flow_event then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local current_health = health_extension:current_health()

				Unit.set_flow_variable(unit, "current_health", current_health)
				Unit.flow_event(unit, "lua_on_damage_taken")
			end
		end,
		husk = function (unit, dt, context, t, hit)
			local hit_type = hit[2]
			local ignore_damage_taken_flow_event = false

			if hit_type then
				ignore_damage_taken_flow_event = dot_hit_types[hit_type]
			end

			if not ignore_damage_taken_flow_event then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local current_health = health_extension:current_health()

				Unit.set_flow_variable(unit, "current_health", current_health)
				Unit.flow_event(unit, "lua_on_damage_taken")
			end
		end,
	},
	ai_ethereal_skull_knock_back = {
		unit = function (unit, dt, context, t, hit)
			local attacker_unit = hit[DamageDataIndex.ATTACKER]
			local is_player = Managers.player:is_player_unit(attacker_unit)

			if not is_player then
				return
			end

			local damage_type = hit[DamageDataIndex.DAMAGE_TYPE]
			local damage_taken = hit[DamageDataIndex.DAMAGE_AMOUNT]
			local hit_direction = hit[DamageDataIndex.DIRECTION]
			local hit_position = hit[DamageDataIndex.POSITION]
			local damaged_by_other = unit ~= attacker_unit

			if damage_type ~= "push" and damaged_by_other then
				ScriptUnit.extension(unit, "ai_system"):attacked(attacker_unit, t, hit)
				trigger_enemy_armor_hit_dialogue(unit, attacker_unit, damage_taken, hit)
			end

			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

			if locomotion_extension and hit[2] ~= "bleed" and hit[7] ~= "dot_debuff" then
				locomotion_extension:set_knockback(attacker_unit, hit_direction, hit_position, t)
			end

			Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, hit)
		end,
		husk = function (unit, dt, context, t, hit)
			local attacker_unit = hit[DamageDataIndex.ATTACKER]
			local is_player = Managers.player:is_player_unit(attacker_unit)

			if not is_player then
				return
			end

			Managers.state.game_mode:ai_hit_by_player(unit, attacker_unit, hit)
		end,
	},
	chaos_bulwark = {
		unit = function (unit, dt, context, t, hit)
			HitReactions.templates.ai_default.unit(unit, dt, context, t, hit)

			local hit_weakspot = hit[DamageDataIndex.HIT_ZONE] == "weakspot"

			if hit_weakspot then
				local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

				if not ai_shield_extension.is_blocking then
					Unit.flow_event(unit, "lua_on_weakspot_hit")
				end
			end
		end,
		husk = function (unit, dt, context, t, hit)
			HitReactions.templates.ai_default.husk(unit, dt, context, t, hit)

			local hit_weakspot = hit[DamageDataIndex.HIT_ZONE] == "weakspot"

			if hit_weakspot then
				local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

				if not ai_shield_extension:get_is_blocking() then
					Unit.flow_event(unit, "lua_on_weakspot_hit")
				end
			end
		end,
	},
}

HitReactions.get_reaction = function (hit_reaction_template, is_husk)
	local templates = HitReactions.templates
	local reaction_table = templates[hit_reaction_template]

	if is_husk and reaction_table.husk ~= nil then
		return reaction_table.husk
	end

	return reaction_table.unit
end
