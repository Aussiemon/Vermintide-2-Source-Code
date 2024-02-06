-- chunkname: @scripts/unit_extensions/health/loot_rat_health_extension.lua

LootRatHealthExtension = class(LootRatHealthExtension, GenericHealthExtension)

LootRatHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	LootRatHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)
end

LootRatHealthExtension.extensions_ready = function (self, world, unit, extension_name)
	local blackboard = BLACKBOARDS[unit]

	blackboard.dodge_damage_points = blackboard.breed.dodge_damage_points
	blackboard.dodge_damage_success = false
end

LootRatHealthExtension.destroy = function (self)
	LootRatHealthExtension.super.destroy(self)

	self.blackboard = nil
end

LootRatHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

LootRatHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)
	local blackboard = BLACKBOARDS[self.unit]
	local dodge_points = blackboard.dodge_damage_points
	local dodge_success = false

	if blackboard.is_dodging then
		dodge_points = math.max(dodge_points - damage_amount, 0)

		if dodge_points > 0 then
			dodge_success = true
		end

		blackboard.dodge_damage_points = dodge_points
	end

	if not dodge_success then
		LootRatHealthExtension.super.add_damage(self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)
	end

	blackboard.dodge_damage_success = dodge_success
end

LootRatHealthExtension.regen_dodge_damage_points = function (self)
	local blackboard = BLACKBOARDS[self.unit]

	blackboard.dodge_damage_points = blackboard.breed.dodge_damage_points
end
