-- chunkname: @scripts/managers/status_effect/status_effect_templates.lua

StatusEffectTemplates = {}

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

local base_effect = {
	default_timed_duration = 7,
	on_applied = function (unit, reason, status_template, world)
		local apply_data = {}
		local link_object = status_template.link_object
		local node = link_object and Unit.has_node(unit, link_object) and Unit.node(unit, link_object) or 0
		local breed = Unit.get_data(unit, "breed")
		local effect_settings = breed and breed.status_effect_settings

		if not effect_settings then
			return
		end

		local category = effect_settings and effect_settings.category or "small"
		local particle_by_category = status_template.particle_by_category
		local vfx = particle_by_category and particle_by_category[category]

		if vfx then
			local attach_unit = unit
			local cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

			attach_unit = cosmetic_extension and cosmetic_extension:get_third_person_mesh_unit() or attach_unit

			local inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

			attach_unit = inventory_extension and inventory_extension:get_skin_unit() or attach_unit

			local material_variable = status_template.unit_material_variable

			if material_variable then
				ScriptUnit.set_material_variable(attach_unit, material_variable.variable_name, material_variable.value, true)
			end

			local particle_id = ScriptWorld.create_particles_linked(world, vfx, attach_unit, node, "destroy")

			apply_data.particle_id = particle_id
			apply_data.attach_unit = attach_unit

			local particle_material_variable = status_template.particle_material_variable

			if status_template.particle_material_variable then
				local cloud = particle_material_variable.cloud_name
				local var_name = particle_material_variable.variable_name
				local value = particle_material_variable.value

				ScriptWorld.set_material_variable_for_particles(world, particle_id, cloud, var_name, value)
			end

			local sfx = status_template.sfx

			if sfx then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, sfx, unit)
			end
		end

		local fp_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if fp_extension and not is_bot(unit) then
			local screen_space_fx = status_template.screen_space_fx

			if screen_space_fx then
				apply_data.screen_space_fx_id = fp_extension:create_screen_particles(screen_space_fx)
			end

			local mood = status_template.mood

			if mood then
				Managers.state.camera:set_mood(mood, reason, true)
			end

			local hud_sound = status_template.hud_sound

			if hud_sound then
				fp_extension:play_hud_sound_event(hud_sound)
			end
		end

		if status_template.career_state then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state(status_template.career_state)
		end

		return apply_data
	end,
	on_increment = function (unit, reason, status_template, world, apply_data)
		if not apply_data then
			return
		end

		if not apply_data.death and not HEALTH_ALIVE[unit] then
			local death_material_variable = status_template.death_unit_material_variable

			if death_material_variable then
				local var_name = death_material_variable.variable_name
				local value = death_material_variable.value
				local attach_unit = apply_data.attach_unit or unit

				ScriptUnit.set_material_variable(attach_unit, var_name, value, true)
			end

			if status_template.death_flow_event then
				UNIT_FLOW_EVENT(unit, status_template.death_flow_event)
			end

			apply_data.death = true
		end
	end,
	on_removed = function (unit, reason, status_template, world, apply_data)
		if not apply_data then
			return
		end

		local particle_id = apply_data.particle_id

		if particle_id then
			World.destroy_particles(world, particle_id)

			if apply_data.stop_sfx then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, apply_data.stop_sfx, unit)
			end
		end

		if status_template.career_state then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end

		local fp_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if fp_extension and not is_bot(unit) then
			local screen_space_fx_id = apply_data.screen_space_fx_id

			if screen_space_fx_id then
				fp_extension:stop_spawning_screen_particles(screen_space_fx_id)
			end

			local remove_screen_space = status_template.remove_screen_space_fx

			if remove_screen_space then
				fp_extension:create_screen_particles(remove_screen_space)
			end

			local mood = status_template.mood

			if mood then
				Managers.state.camera:set_mood(mood, reason, false)
			end

			local remove_hud_sound = status_template.remove_hud_sound

			if remove_hud_sound then
				fp_extension:play_hud_sound_event(remove_hud_sound)
			end
		end
	end,
}

StatusEffectTemplates.burning = table.clone(base_effect)
StatusEffectTemplates.burning.link_object = "j_hips"
StatusEffectTemplates.burning.unit_material_variable = {
	variable_name = "dissolve_emissive",
	value = {
		7,
		1,
		0.02,
	},
}
StatusEffectTemplates.burning.death_unit_material_variable = {
	variable_name = "dissolve_emissive",
	value = {
		7,
		1,
		0.02,
	},
}
StatusEffectTemplates.burning.particle_material_variable = {
	cloud_name = "fire",
	value = 0,
	variable_name = "remap_index",
}
StatusEffectTemplates.burning.sfx = "Play_enemy_on_fire_loop"
StatusEffectTemplates.burning.stop_sfx = "Stop_enemy_on_fire_loop"
StatusEffectTemplates.burning.death_flow_event = "burn_death"
StatusEffectTemplates.burning.particle_by_category = {
	large = "fx/chr_impact_fire_large_remap",
	medium = "fx/chr_impact_fire_medium_remap",
	small = "fx/chr_impact_fire_small_remap",
}
StatusEffectTemplates.burning_death_critical = table.clone(StatusEffectTemplates.burning)
StatusEffectTemplates.burning_death_critical.default_timed_duration = 2

StatusEffectTemplates.burning_death_critical.on_applied = function (unit, reason, status_template, world)
	local apply_data = StatusEffectTemplates.burning.on_applied(unit, reason, status_template, world)

	UNIT_FLOW_EVENT(unit, "burn_death_critical")

	return apply_data
end

StatusEffectTemplates.burning_death_critical.on_decrement = function (unit, reason, status_template, world, apply_data)
	if apply_data.burning_death_decremented then
		return
	end

	apply_data.burning_death_decremented = true

	local breed = Unit.get_data(unit, "breed")
	local effect_settings = breed and breed.status_effect_settings

	if not effect_settings or effect_settings.category ~= "small" then
		return
	end

	local template = StatusEffectTemplates.burning_death_critical
	local attach_unit = apply_data.attach_unit or unit
	local node = 0
	local link_object = template.link_object

	if link_object then
		node = Unit.has_node(attach_unit, link_object) and Unit.node(attach_unit, link_object) or 0
	end

	local burnup_id = ScriptWorld.create_particles_linked(world, "fx/chr_impact_burnup_fire_small_remap", attach_unit, node, "destroy")
	local particle_material_variable = status_template.particle_material_variable

	if status_template.particle_material_variable then
		local value = particle_material_variable.value
		local var_name = particle_material_variable.variable_name

		ScriptWorld.set_material_variable_for_particles(world, burnup_id, "remap_fire", var_name, value)
		ScriptWorld.set_material_variable_for_particles(world, burnup_id, "remap_fire2", var_name, value)
	end

	Managers.state.status_effect:remove_all_statuses(unit, true)
end

StatusEffectTemplates.burning_warpfire = table.clone(StatusEffectTemplates.burning)
StatusEffectTemplates.burning_warpfire.particle_by_category = {
	small = "fx/chr_impact_fire_small_remap",
}
StatusEffectTemplates.burning_warpfire.unit_material_variable.value = {
	2,
	5,
	0.02,
}
StatusEffectTemplates.burning_warpfire.death_unit_material_variable = nil
StatusEffectTemplates.burning_warpfire.particle_material_variable.value = 2
StatusEffectTemplates.burning_warpfire_death_critical = table.clone(StatusEffectTemplates.burning_death_critical)
StatusEffectTemplates.burning_warpfire_death_critical.unit_material_variable.value = {
	2,
	5,
	0.02,
}
StatusEffectTemplates.burning_warpfire_death_critical.death_unit_material_variable = nil
StatusEffectTemplates.burning_warpfire_death_critical.particle_material_variable.value = 2
StatusEffectTemplates.burning_elven_magic = table.clone(StatusEffectTemplates.burning)
StatusEffectTemplates.burning_elven_magic.unit_material_variable.value = {
	0.22,
	0.2,
	3,
}
StatusEffectTemplates.burning_elven_magic.death_unit_material_variable = nil
StatusEffectTemplates.burning_elven_magic.particle_material_variable.value = 3
StatusEffectTemplates.burning_elven_magic_death_critical = table.clone(StatusEffectTemplates.burning_death_critical)
StatusEffectTemplates.burning_elven_magic_death_critical.unit_material_variable.value = {
	0.22,
	0.2,
	3,
}
StatusEffectTemplates.burning_elven_magic_death_critical.death_unit_material_variable = nil
StatusEffectTemplates.burning_elven_magic_death_critical.particle_material_variable.value = 3
StatusEffectTemplates.burning_balefire = table.clone(StatusEffectTemplates.burning)
StatusEffectTemplates.burning_balefire.unit_material_variable.value = {
	0.02,
	5,
	3,
}
StatusEffectTemplates.burning_balefire.death_unit_material_variable = nil
StatusEffectTemplates.burning_balefire.particle_material_variable.value = 1
StatusEffectTemplates.burning_balefire_death_critical = table.clone(StatusEffectTemplates.burning_death_critical)
StatusEffectTemplates.burning_balefire_death_critical.unit_material_variable.value = {
	0.02,
	5,
	3,
}
StatusEffectTemplates.burning_balefire_death_critical.death_unit_material_variable = nil
StatusEffectTemplates.burning_balefire_death_critical.particle_material_variable.value = 1
StatusEffectTemplates.poisoned = table.clone(base_effect)
StatusEffectTemplates.poisoned.particle_by_category = {
	medium = "fx/chr_impact_poison_medium",
	small = "fx/chr_impact_poison_small",
}
StatusEffectTemplates.poisoned.link_object = "root_point"
StatusEffectTemplates.invis_ranger = table.clone(base_effect)
StatusEffectTemplates.invis_ranger.screen_space_fx = "fx/screenspace_ranger_skill_01"
StatusEffectTemplates.invis_ranger.remove_screen_space_fx = "fx/screenspace_ranger_skill_02"
StatusEffectTemplates.invis_ranger.mood = "skill_ranger"
StatusEffectTemplates.invis_ranger.hud_sound = "Play_career_ability_bardin_ranger_loop"
StatusEffectTemplates.invis_ranger.remove_hud_sound = "Stop_career_ability_bardin_ranger_loop"
StatusEffectTemplates.invis_ranger.career_state = "bardin_activate_ranger"

local names = table.keys(StatusEffectTemplates)

StatusEffectNames = table.enum(unpack(names))
StatusEffectBalefireOverrides = {
	[StatusEffectNames.burning] = StatusEffectNames.burning_balefire,
	[StatusEffectNames.burning_death_critical] = StatusEffectNames.burning_balefire_death_critical,
}
