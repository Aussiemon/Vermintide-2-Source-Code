-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/buff_utils.lua

require("scripts/managers/game_mode/mechanisms/mechanism_overrides")

local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

BuffUtils = BuffUtils or {}

if script_data then
	script_data.debug_legendary_traits = script_data.debug_legendary_traits or Development.parameter("debug_legendary_traits")
end

BuffUtils.apply_buff_tweak_data = function (buffs, tweak_data)
	for name, buff_data in pairs(buffs) do
		local data = tweak_data[name]

		if data then
			table.merge(buff_data.buffs[1], data)
		end
	end
end

BuffUtils.copy_talent_buff_names = function (buffs)
	for name, buff_data in pairs(buffs) do
		local buffs = buff_data.buffs

		fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

		local buff = buffs[1]

		buff.name = name
	end
end

BuffUtils.get_max_stacks = function (buff_name, buff_index)
	local buffs = BuffUtils.get_buff_template(buff_name).buffs
	local max_stacks = buffs[buff_index or 1].max_stacks

	return max_stacks or nil
end

BuffUtils.remove_stacked_buffs = function (buffed_unit, stacked_buff_ids)
	local buff_extension = buffed_unit and ScriptUnit.has_extension(buffed_unit, "buff_system")

	if not buff_extension then
		return
	end

	for _, buff_id in ipairs(stacked_buff_ids) do
		buff_extension:remove_buff(buff_id)
	end

	table.clear(stacked_buff_ids)
end

BuffUtils.buffs_from_rpc_params = function (num_buffs, buff_ids, buff_data_type_ids, buff_values)
	local lookup_templates = NetworkLookup.buff_templates
	local lookup_data_types = NetworkLookup.buff_data_types
	local buffs = {}

	for i = 1, num_buffs do
		local id = buff_ids[i]
		local data_type_id = buff_data_type_ids[i]
		local value = buff_values[i]
		local name = lookup_templates[id]
		local data_type = lookup_data_types[data_type_id]

		buffs[name] = {
			[data_type] = value,
		}
	end

	return buffs
end

BuffUtils.buffs_to_rpc_params = function (buffs)
	local lookup_templates = NetworkLookup.buff_templates
	local lookup_data_types = NetworkLookup.buff_data_types
	local num_buffs = 0
	local buff_ids = {}
	local buff_data_type_ids = {}
	local buff_values = {}

	for name, data in pairs(buffs) do
		num_buffs = num_buffs + 1

		local id = lookup_templates[name]
		local data_type, value = next(data)
		local data_type_id = lookup_data_types[data_type or "n/a"]

		buff_ids[num_buffs] = id
		buff_data_type_ids[num_buffs] = data_type_id
		buff_values[num_buffs] = value or 1
	end

	return {
		num_buffs,
		buff_ids,
		buff_data_type_ids,
		buff_values,
	}
end

local unit_node = Unit.node

local function _get_particle_link_node(fx, link_target)
	return fx.link_node and unit_node(link_target, fx.link_node) or 0
end

BuffUtils.create_attached_particles = function (world, particle_fx, unit, is_first_person, buff_id, end_t)
	if not world or not particle_fx then
		return nil
	end

	local fx_state = {
		end_t = end_t,
	}

	for i = 1, #particle_fx do
		local fx = particle_fx[i]

		if is_first_person and fx.first_person or not is_first_person and fx.third_person then
			local link_target = unit

			if link_target then
				local node_id = _get_particle_link_node(fx, link_target)
				local pose = fx.pose

				pose = pose and Matrix4x4.from_quaternion_position_scale(Quaternion.from_euler_angles_xyz(pose.rotation[1], pose.rotation[2], pose.rotation[3]), Vector3Aux.unbox(pose.position), Vector3Aux.unbox(pose.scale)) or nil

				local fx_id = ScriptWorld.create_particles_linked(world, fx.effect, link_target, node_id, fx.orphaned_policy, pose)

				if fx.custom_variables then
					for i = 1, #fx.custom_variables do
						local data = fx.custom_variables[i]
						local name = data.name

						data.cached_id = data.cached_id or World.find_particles_variable(world, fx.effect, name)

						local value = data.value or data.dynamic_value()
						local unit_scale = Unit.local_scale(unit, 0)
						local effect_variable = Vector3.divide_elements(Vector3Aux.unbox(value), unit_scale)

						World.set_particles_variable(world, fx_id, data.cached_id, effect_variable)
					end
				end

				if fx.material_variables then
					for i = 1, #fx.material_variables do
						local data = fx.material_variables[i]
						local cloud_name = data.cloud_name
						local material_variable = data.material_variable
						local value = data.value or data.dynamic_value()

						ScriptWorld.set_material_variable_for_particles(world, fx_id, cloud_name, material_variable, value)
					end
				end

				if fx.continuous then
					if fx.destroy_policy == "stop" then
						local stop_fx = fx_state.stop_fx or {}

						fx_state.stop_fx = stop_fx
						stop_fx[#stop_fx + 1] = fx_id
					else
						local destroy_fx = fx_state.destroy_fx or {}

						fx_state.destroy_fx = destroy_fx
						destroy_fx[#destroy_fx + 1] = fx_id
					end
				end

				if fx.update then
					local update_fx = fx_state.update_fx or {}

					fx_state.update_fx = update_fx
					update_fx[fx_id] = fx.update
				end
			end
		end
	end

	return fx_state
end

BuffUtils.update_attached_particles = function (world, fx_state, t)
	local update_fx = fx_state.update_fx

	for fx_id, update_func in pairs(update_fx) do
		update_func(fx_id, world, t, fx_state.end_t)
	end
end

BuffUtils.destroy_attached_particles = function (world, fx_state)
	if fx_state and world then
		local destroy_fx = fx_state.destroy_fx

		if destroy_fx then
			for i = 1, #destroy_fx do
				World.destroy_particles(world, destroy_fx[i])
			end
		end

		local stop_fx = fx_state.stop_fx

		if stop_fx then
			for i = 1, #stop_fx do
				World.stop_spawning_particles(world, stop_fx[i])
			end
		end
	end
end

BuffUtils.create_liquid_forward = function (unit, buff)
	if ALIVE[unit] then
		local function safe_navigation_callback()
			local position = POSITION_LOOKUP[unit]

			if position then
				local template = buff.template
				local rotation = Unit.local_rotation(unit, 0)
				local dir = Quaternion.forward(rotation)
				local extension_init_data = {
					area_damage_system = {
						flow_dir = dir,
						liquid_template = template.liquid_template,
						source_unit = unit,
					},
				}
				local aoe_unit_name = "units/hub_elements/empty"
				local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position)
				local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

				liquid_area_damage_extension:ready()
			end
		end

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)

		local fx_name = buff.template.fx_name

		if fx_name then
			local effect_name_id = NetworkLookup.effects[fx_name]
			local node_id = 0
			local position = POSITION_LOOKUP[unit]
			local rotation_offset = Quaternion.identity()
			local network_manager = Managers.state.network

			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, position, rotation_offset, false)
		end
	end
end

BuffUtils.get_buff_template = function (name, optional_mechanism_name)
	if not BuffTemplates[name] then
		return
	end

	return MechanismOverrides.get(BuffTemplates[name], optional_mechanism_name)
end

BalefireDots = BalefireDots or {}
BalefireBurnDotLookup = BalefireBurnDotLookup or {}

BuffUtils.generate_balefire_burn_variants = function (buff_templates)
	for template_name, template in pairs(buff_templates) do
		local balefire_i = string.find(template_name, "_balefire")

		if not balefire_i then
			local new_name = template_name .. "_balefire"
			local new_buff_template = table.clone(template)

			for buff_i, sub_buff in ipairs(new_buff_template.buffs) do
				local perks = sub_buff.perks

				if perks and table.find(perks, buff_perk_names.burning) then
					table.remove_array_value(perks, buff_perk_names.burning)
					table.insert_unique(perks, buff_perk_names.burning_balefire)

					BalefireDots[new_name] = true
					BalefireBurnDotLookup[template_name] = new_name
					DotTypeLookup[new_name] = DotTypeLookup[template_name]
					buff_templates[new_name] = new_buff_template

					break
				end
			end
		else
			local original_name = string.sub(template_name, 1, balefire_i - 1)

			DotTypeLookup[template_name] = DotTypeLookup[original_name]
			BalefireDots[template_name] = true
		end
	end
end

InfiniteBurnDotLookup = InfiniteBurnDotLookup or {}

BuffUtils.generate_infinite_burn_variants = function (buff_templates)
	for template_name, template in pairs(buff_templates) do
		if not string.find(template_name, "_infinite") then
			local new_name = template_name .. "_infinite"
			local new_buff_template = table.clone(template)

			for _, sub_buff in ipairs(new_buff_template.buffs) do
				local perks = sub_buff.perks

				if perks and table.find(perks, buff_perk_names.burning) then
					sub_buff.name = "infinite_burning_dot"
					sub_buff.duration = nil
					sub_buff.on_max_stacks_overflow_func = "reapply_infinite_burn"
					sub_buff.max_stacks = 1

					local max_stacks_func = sub_buff.max_stacks_func

					if max_stacks_func ~= nil then
						sub_buff.max_stacks_func = function (...)
							return math.min(max_stacks_func(...), 1)
						end
					end

					if sub_buff.time_between_dot_damages then
						sub_buff.time_between_dot_damages = sub_buff.time_between_dot_damages / 2
					end

					InfiniteBurnDotLookup[template_name] = new_name
					buff_templates[new_name] = new_buff_template

					break
				end
			end
		end
	end
end
