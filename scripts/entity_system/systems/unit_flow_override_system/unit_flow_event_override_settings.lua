local BREED_FLOW_EVENT_OVERRIDE_DATA_LOOKUP = require("scripts/entity_system/systems/unit_flow_override_system/breed_unit_flow_event_overrides")
local unit_alive = unit_alive or Unit.alive

local function set_material_variable_for_unit(unit, material_variable, value, include_children)
	if type(value) == "number" then
		Unit.set_scalar_for_materials(unit, material_variable, value, include_children)
	elseif type(value) == "table" then
		local num_values = #value

		if num_values == 2 then
			Unit.set_vector2_for_materials(unit, material_variable, Vector2(value[1], value[2]), include_children)
		elseif num_values == 3 then
			Unit.set_vector3_for_materials(unit, material_variable, Vector3(value[1], value[2], value[3]), include_children)
		else
			Unit.set_vector4_for_materials(unit, material_variable, Color(value[1], value[2], value[3], value[4]), include_children)
		end
	end
end

local function set_material_variable_for_particles(world, particle_id, cloud_name, material_variable, value)
	if type(value) == "number" then
		World.set_particles_material_scalar(world, particle_id, cloud_name, material_variable, value)
	elseif type(value) == "table" then
		local num_values = #value

		if num_values == 2 then
			World.set_particles_material_vector2(world, particle_id, cloud_name, material_variable, Vector2(value[1], value[2]))
		elseif num_values == 3 then
			World.set_particles_material_vector3(world, particle_id, cloud_name, material_variable, Vector3(value[1], value[2], value[3]))
		elseif num_values == 4 then
			World.set_particles_material_vector3(world, particle_id, cloud_name, material_variable, Color(value[1], value[2], value[3], value[4]))
		end
	end
end

local EMPTY_TABLE = {}
UnitFlowEventOverrideSettings = {}
UnitFlowEventOverrideSettings.burn = {
	is_dynamic = true,
	link_object = "j_hips",
	duration = 5,
	default_sfx = "Play_enemy_on_fire_loop",
	run_flow_event = false,
	default_vfx = {
		small = "fx/chr_impact_fire_small_remap",
		medium = "fx/chr_impact_fire_medium_remap",
		large = "fx/chr_impact_fire_large_remap"
	},
	default_destroy_vfx = {},
	unit_material_variables = {
		dissolve_emissive = {
			include_children = true,
			value = {
				20,
				8,
				1
			}
		}
	},
	particle_material_variables = {
		remap_index = {
			value = 0,
			cloud_name = "fire"
		}
	},
	init = function (parent, event_data, unit, event_name, params)
		if not unit_alive(unit) then
			return
		end

		params = params or EMPTY_TABLE
		local event_settings = UnitFlowEventOverrideSettings[event_name]
		local breed = Unit.get_data(unit, "breed")
		local breed_name = breed.name
		local breed_event_settings = BREED_FLOW_EVENT_OVERRIDE_DATA_LOOKUP[breed_name]

		if not breed_event_settings then
			return
		end

		local current_breed_event_settings = breed_event_settings[event_name] or EMPTY_TABLE

		if current_breed_event_settings == false then
			return
		end

		local stop_all_events = event_settings.stop_all_events

		if stop_all_events then
			for event_to_stop_name, _ in pairs(UnitFlowEventOverrideSettings) do
				parent:destroy_data(unit, event_to_stop_name)
			end
		else
			local events_to_stop = event_settings.events_to_stop or EMPTY_TABLE

			for i = 1, #events_to_stop do
				local event_to_stop_name = events_to_stop[i]

				parent:destroy_data(unit, event_to_stop_name)
			end
		end

		local attacker_unit = params.source_attacker_unit

		if not attacker_unit then
			local health_ext = ScriptUnit.extension(unit, "health_system")
			local last_damage_data = health_ext.last_damage_data
			local last_attacker_unit_id = last_damage_data and last_damage_data.attacker_unit_id
			attacker_unit = last_attacker_unit_id and Managers.state.unit_storage:unit(last_attacker_unit_id)
		end

		local career_ext = attacker_unit and ScriptUnit.has_extension(attacker_unit, "career_system")
		local attacker_career_name = career_ext and career_ext:career_name()
		local unit_material_variables = event_settings.unit_material_variables or EMPTY_TABLE

		for material_variable, data in pairs(unit_material_variables) do
			local include_children = data.include_children
			local career_override = data.career_override_values or EMPTY_TABLE
			local value = career_override[attacker_career_name] or data.value

			set_material_variable_for_unit(unit, material_variable, value, include_children)
		end

		local category = breed_event_settings.category
		local vfx = current_breed_event_settings.vfx or event_settings.default_vfx[category]
		local destroy_vfx = current_breed_event_settings.destroy_vfx or event_settings.default_destroy_vfx[category]
		local sfx = current_breed_event_settings.sfx or event_settings.default_sfx
		local duration = current_breed_event_settings.duration or event_settings.duration
		local t = Managers.time:time("game")

		if event_data and event_data.time then
			event_data.time = t + duration

			return
		end

		local world = parent.world
		local node = 0
		local link_object = event_settings.link_object

		if link_object then
			node = Unit.has_node(unit, link_object) and Unit.node(unit, link_object) or 0
		end

		local particle_id, event_id, source_id = nil

		if vfx then
			particle_id = ScriptWorld.create_particles_linked(world, vfx, unit, node, "destroy")
		end

		local particle_material_variables = event_settings.particle_material_variables or EMPTY_TABLE

		for material_variable, particle_material_data in pairs(particle_material_variables) do
			local cloud_name = particle_material_data.cloud_name
			local career_override = particle_material_data.career_override_values or EMPTY_TABLE
			local value = career_override[attacker_career_name] or particle_material_data.value

			set_material_variable_for_particles(world, particle_id, cloud_name, material_variable, value)
		end

		if sfx then
			local wwise_world = Managers.world:wwise_world(world)
			event_id, source_id = WwiseWorld.trigger_event(wwise_world, sfx, unit, node)
		end

		event_data.particle_id = particle_id
		event_data.event_id = event_id
		event_data.source_id = source_id
		event_data.time = t + duration
		event_data.destroy_vfx = destroy_vfx
	end,
	update = function (parent, unit, event_name, event_data, t)
		local is_done = false

		if not unit_alive(unit) or event_data.time < t then
			is_done = true
		end

		return is_done
	end,
	destroy = function (parent, unit, event_name, event_data)
		local event_settings = UnitFlowEventOverrideSettings[event_name]
		local world = parent.world
		local wwise_world = Managers.world:wwise_world(world)
		local particle_id = event_data.particle_id
		local event_id = event_data.event_id
		local destroy_vfx = event_data.destroy_vfx

		if particle_id then
			World.stop_spawning_particles(world, particle_id)
		end

		if event_id then
			WwiseWorld.stop_event(wwise_world, event_id)
		end

		if destroy_vfx and unit_alive(unit) then
			local node = 0
			local link_object = event_settings.link_object

			if link_object then
				node = Unit.has_node(unit, link_object) and Unit.node(unit, link_object) or 0
			end

			ScriptWorld.create_particles_linked(world, destroy_vfx, unit, node, "destroy")
		end

		table.clear(event_data)
	end
}
UnitFlowEventOverrideSettings.burn_force_fire = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.burn_force_fire.unit_material_variables = nil
UnitFlowEventOverrideSettings.burn_force_fire.particle_material_variables = nil
UnitFlowEventOverrideSettings.elven_magic = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.elven_magic.events_to_stop = {
	"burn_infinity",
	"burn"
}
UnitFlowEventOverrideSettings.elven_magic.default_sfx = "Stop_enemy_on_fire_loop"
UnitFlowEventOverrideSettings.elven_magic.is_dynamic = true
UnitFlowEventOverrideSettings.elven_magic.run_flow_event = true
UnitFlowEventOverrideSettings.elven_magic.flow_event_name = "burn_death"
UnitFlowEventOverrideSettings.elven_magic.unit_material_variables = {
	dissolve_emissive = {
		include_children = true,
		value = {
			5,
			10,
			12
		}
	}
}
UnitFlowEventOverrideSettings.elven_magic.particle_material_variables = {
	remap_index = {
		value = 1,
		cloud_name = "fire"
	}
}
UnitFlowEventOverrideSettings.warpfire_burn = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.warpfire_burn.is_dynamic = true
UnitFlowEventOverrideSettings.warpfire_burn.duration = 5
UnitFlowEventOverrideSettings.warpfire_burn.run_flow_event = false
UnitFlowEventOverrideSettings.warpfire_burn.default_sfx = "Play_enemy_on_fire_loop"
UnitFlowEventOverrideSettings.warpfire_burn.default_vfx = {
	small = "fx/chr_impact_fire_small_remap"
}
UnitFlowEventOverrideSettings.warpfire_burn.particle_material_variables = {
	remap_index = {
		value = 2,
		cloud_name = "fire"
	}
}
UnitFlowEventOverrideSettings.burn_infinity = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.burn_infinity.duration = math.huge

UnitFlowEventOverrideSettings.burn_infinity.update = function (parent, unit, event_name, event_data, t)
	return false
end

UnitFlowEventOverrideSettings.burn_infinity_force_fire = table.clone(UnitFlowEventOverrideSettings.burn_infinity)
UnitFlowEventOverrideSettings.burn_infinity_force_fire.unit_material_variables = nil
UnitFlowEventOverrideSettings.burn_infinity_force_fire.particle_material_variables = nil
UnitFlowEventOverrideSettings.poisoned = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.poisoned.link_object = "root_point"
UnitFlowEventOverrideSettings.poisoned.is_dynamic = false
UnitFlowEventOverrideSettings.poisoned.default_sfx = nil
UnitFlowEventOverrideSettings.poisoned.unit_material_variables = nil
UnitFlowEventOverrideSettings.poisoned.particle_material_variables = nil
UnitFlowEventOverrideSettings.poisoned.default_vfx = {
	small = "fx/chr_impact_poison_small",
	medium = "fx/chr_impact_poison_medium"
}
UnitFlowEventOverrideSettings.burn_death = table.clone(UnitFlowEventOverrideSettings.burn)
UnitFlowEventOverrideSettings.burn_death.run_flow_event = true
UnitFlowEventOverrideSettings.burn_death.unit_material_variables = {
	dissolve_emissive = {
		include_children = true,
		value = {
			30,
			10,
			1
		}
	}
}
UnitFlowEventOverrideSettings.warpfire_burn_death = table.clone(UnitFlowEventOverrideSettings.burn_death)
UnitFlowEventOverrideSettings.warpfire_burn_death.is_dynamic = true
UnitFlowEventOverrideSettings.warpfire_burn_death.run_flow_event = true
UnitFlowEventOverrideSettings.warpfire_burn_death.flow_event_name = "burn_death"
UnitFlowEventOverrideSettings.warpfire_burn_death.default_sfx = nil
UnitFlowEventOverrideSettings.warpfire_burn_death.events_to_stop = {
	"warpfire_burn"
}
UnitFlowEventOverrideSettings.warpfire_burn_death.default_vfx = {
	small = "fx/chr_impact_fire_small_remap"
}
UnitFlowEventOverrideSettings.warpfire_burn_death.destroy_vfx = {
	small = "fx/chr_impact_burnup_fire_small_remap"
}
UnitFlowEventOverrideSettings.warpfire_burn_death.particle_material_variables = {
	remap_index = {
		value = 2,
		cloud_name = "fire"
	}
}
UnitFlowEventOverrideSettings.warpfire_burn_death.unit_material_variables = {
	dissolve_emissive = {
		include_children = true,
		value = {
			5,
			20,
			1
		}
	}
}
UnitFlowEventOverrideSettings.burn_death_force_fire = table.clone(UnitFlowEventOverrideSettings.burn_death)
UnitFlowEventOverrideSettings.burn_death_force_fire.unit_material_variables = nil
UnitFlowEventOverrideSettings.burn_death_force_fire.particle_material_variables = nil
UnitFlowEventOverrideSettings.burn_death_force_fire.flow_event_name = "burn_death"
UnitFlowEventOverrideSettings.burn_death_critical = table.clone(UnitFlowEventOverrideSettings.burn_death)
UnitFlowEventOverrideSettings.burn_death_critical.duration = 2
UnitFlowEventOverrideSettings.burn_death_critical.default_destroy_vfx = {
	small = "fx/chr_impact_burnup_fire_small_remap"
}
UnitFlowEventOverrideSettings.smoke = {
	events_to_stop = {
		"burn_infinity"
	},
	sound_events = {
		"Stop_enemy_on_fire_loop"
	},
	init = function (parent, event_data, unit, event_name, ...)
		if not unit_alive(unit) then
			return
		end

		local event_settings = UnitFlowEventOverrideSettings[event_name]
		local stop_all_events = event_settings.stop_all_events

		if stop_all_events then
			for event_to_stop_name, _ in pairs(UnitFlowEventOverrideSettings) do
				parent:destroy_data(unit, event_to_stop_name)
			end
		else
			local events_to_stop = event_settings.events_to_stop

			for i = 1, #events_to_stop do
				local event_to_stop_name = events_to_stop[i]

				parent:destroy_data(unit, event_to_stop_name)
			end
		end

		local sound_events = event_settings.sound_events

		if sound_events then
			local world = parent.world
			local wwise_world = Managers.world:wwise_world(world)

			for i = 1, #sound_events do
				local sound_event = sound_events[i]

				WwiseWorld.trigger_event(wwise_world, sound_event)
			end
		end
	end
}
UnitFlowEventOverrideSettings.lua_on_death = table.clone(UnitFlowEventOverrideSettings.smoke)
UnitFlowEventOverrideSettings.lua_on_death.run_flow_event = true
UnitFlowEventOverrideSettings.lua_freeze_unit = table.clone(UnitFlowEventOverrideSettings.smoke)
UnitFlowEventOverrideSettings.lua_freeze_unit.stop_all_events = true
UnitFlowEventOverrideSettings.lua_freeze_unit.run_flow_event = true
UnitFlowEventOverrideSettings.reset_state = table.clone(UnitFlowEventOverrideSettings.lua_freeze_unit)
