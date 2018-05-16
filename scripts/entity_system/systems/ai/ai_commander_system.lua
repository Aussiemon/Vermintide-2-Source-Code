AICommanderSystem = class(AICommanderSystem, ExtensionSystemBase)
local extensions = {
	"AICommanderExtension"
}
local BLACKBOARDS = BLACKBOARDS

AICommanderSystem.init = function (self, context, name)
	AICommanderSystem.super.init(self, context, name, extensions)

	self.commander_units = {}
	self.commander_cooldown = 5
	self.last_update_t = 0
	local update_frequency = 2
	self.update_cooldown = 1 / update_frequency
	self.last_slot_count = 0
end

AICommanderSystem.destroy = function (self)
	for commander_unit, extension in pairs(self.commander_units) do
		ScriptUnit.remove_extension(commander_unit, self.name)
	end

	self.commander_units = nil
end

local dummy_input = {}

AICommanderSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {
		last_command_t = 0
	}

	ScriptUnit.set_extension(unit, self.name, extension, dummy_input)

	self.commander_units[unit] = extension

	return extension
end

AICommanderSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	self.commander_units[unit] = nil
end

AICommanderSystem.update = function (self, context, t)
	local lol = math.random()

	if t < self.last_update_t + self.update_cooldown then
		return
	end

	self.last_update_t = t

	AICommanderSystem.super.update(self, context, t)
	self:command_noncore_rats(t)
	self:command_core_rats(t)
end

AICommanderSystem.command_noncore_rats = function (self, t)
	local specials = Managers.state.conflict._alive_specials

	if specials then
		local command_to_give, special_unit = nil

		for _, unit in ipairs(specials) do
			if Unit.alive(unit) then
				local blackboard = BLACKBOARDS[unit]
				local breed_name = blackboard.breed.name

				if breed_name == "skaven_rat_ogre" then
					if blackboard.chasing_timer then
						local command_to_give = "command_rat_ogre"
						special_unit = unit

						break
					end
				elseif breed_name == "skaven_gutter_runner" then
					if blackboard.jump_data then
						local command_to_give = "command_gutter_runner"
						special_unit = unit

						break
					end
				elseif breed_name == "skaven_poison_wind_globadier" and blackboard.move_state == "throwing" then
					local command_to_give = "command_globadier"
					special_unit = unit

					break
				end
			end
		end

		if command_to_give ~= nil then
			local special_position = POSITION_LOOKUP[special_unit]
			local commander_units = self.commander_units
			local best_commander = nil
			local best_commander_score = 0

			for commander_unit, commander_extension in pairs(commander_units) do
				if commander_extension.last_command_t <= t - self.commander_cooldown then
					local commander_position = POSITION_LOOKUP[commander_unit]
					local distance_to_special_sq = Vector3.distance_squared(commander_position, special_position)

					if distance_to_special_sq > 4 then
						local commander_score = 1 / distance_to_special_sq

						if best_commander_score < commander_score then
							best_commander_score = commander_score
							best_commander = commander_unit
						end
					end
				end
			end

			if best_commander then
				commander_units[best_commander].last_command_t = t
				local blackboard = BLACKBOARDS[best_commander]
				blackboard.give_command = command_to_give
			end
		end
	end
end

local nearby_ais = {}

AICommanderSystem.command_core_rats = function (self, t)
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	local target_units = ai_slot_system.target_units
	local target_units_n = #target_units
	local most_targeted_player = nil
	local target_unit_extensions = ai_slot_system.unit_extension_data
	local slots_n = 0

	for i = 1, target_units_n, 1 do
		local target_unit = target_units[i]
		local target_unit_extension = target_unit_extensions[target_unit]
		local target_unit_slots = target_unit_extension.slots_count

		if slots_n < target_unit_slots then
			slots_n = target_unit_slots
			most_targeted_player = target_unit
		end
	end

	if most_targeted_player then
		local player_pos = POSITION_LOOKUP[most_targeted_player]
		local commander_units = self.commander_units
		local best_commander = nil
		local best_commander_score = 0

		for commander_unit, commander_extension in pairs(commander_units) do
			if commander_extension.last_command_t <= t - self.commander_cooldown then
				local commander_position = POSITION_LOOKUP[commander_unit]
				local nearby_ais_n = AiUtils.broadphase_query(commander_position, 10, nearby_ais)
				nearby_ais_n = nearby_ais_n - 1
				local distance_to_target_player = Vector3.distance_squared(commander_position, player_pos)
				local commander_score = (nearby_ais_n * nearby_ais_n) / distance_to_target_player

				if distance_to_target_player < 16 then
					commander_score = 0
				end

				if best_commander_score < commander_score then
					best_commander_score = commander_score
					best_commander = commander_unit
				end
			end
		end

		if best_commander then
			commander_units[best_commander].last_command_t = t
			local blackboard = BLACKBOARDS[best_commander]
			blackboard.give_command = "clan_rat_attack"
			blackboard.command_target = most_targeted_player
			blackboard.command_num_units = slots_n
		end
	end
end

return
