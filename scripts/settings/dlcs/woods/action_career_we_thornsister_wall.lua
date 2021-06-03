ActionCareerWEThornsisterWall = class(ActionCareerWEThornsisterWall, ActionBase)
local UNIT_TEMPLATE_NAME = "thornsister_thorn_wall_unit"
local WALL_FORWARD_OFFSET_RANGE = 0.1
local WALL_RIGHT_OFFSET_RANGE = 0.05
local WALL_MAX_HEIGHT_OFFSET = 0.5

ActionCareerWEThornsisterWall.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEThornsisterWall.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._wall_index = 0
end

ActionCareerWEThornsisterWall.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerWEThornsisterWall.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local target_data = chain_action_data
	local num_segments = (target_data and target_data.num_segments) or 0

	if num_segments > 0 then
		self:_play_vo()

		local position = target_data.position:unbox()
		local rotation = target_data.rotation:unbox()
		local segments = target_data.segments

		self:_spawn_wall(num_segments, segments, rotation)

		local explosion_template = "we_thornsister_career_skill_wall_explosion"
		local scale = 1
		local career_extension = self.career_extension
		local career_power_level = career_extension:get_career_power_level()
		local area_damage_system = Managers.state.entity:system("area_damage_system")

		if self.talent_extension:has_talent("kerillian_thorn_sister_explosive_wall") then
			explosion_template = "we_thornsister_career_skill_explosive_wall_explosion"
		elseif self.talent_extension:has_talent("kerillian_thorn_sister_debuff_wall") then
			explosion_template = "we_thornsister_career_skill_debuff_wall_spawn_explosion"
		end

		area_damage_system:create_explosion(self.owner_unit, position, rotation, explosion_template, scale, "career_ability", career_power_level, false)
		career_extension:start_activated_ability_cooldown()
	end
end

ActionCareerWEThornsisterWall.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionCareerWEThornsisterWall.finish = function (self, reason)
	self.inventory_extension:wield_previous_non_level_slot()
end

ActionCareerWEThornsisterWall._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionCareerWEThornsisterWall._spawn_wall = function (self, num_segments, segments, wall_rotation)
	local wall_index = self._wall_index + 1
	self._wall_index = wall_index
	local owner_unit = self.owner_unit
	local forward = Quaternion.forward(wall_rotation)
	local right = Quaternion.right(wall_rotation)

	for i = 1, num_segments, 1 do
		local position = segments[i]:unbox()
		local rotation = wall_rotation
		local spawn_position = position + forward * (math.random() * WALL_FORWARD_OFFSET_RANGE * 2 - WALL_FORWARD_OFFSET_RANGE) + right * (math.random() * WALL_RIGHT_OFFSET_RANGE * 2 - WALL_RIGHT_OFFSET_RANGE)

		Managers.state.unit_spawner:request_spawn_network_unit(UNIT_TEMPLATE_NAME, spawn_position, rotation, owner_unit, wall_index, i)
	end
end

return
