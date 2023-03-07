ThornWallHealthExtension = class(ThornWallHealthExtension, GenericHealthExtension)
local unit_alive = Unit.alive
local unit_flow_event = Unit.flow_event
local unit_set_flow_variable = Unit.set_flow_variable

ThornWallHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	ThornWallHealthExtension.super.init(self, extension_init_context, unit, extension_init_data)
end

ThornWallHealthExtension.extensions_ready = function (self, world, unit, extension_name)
	return
end

ThornWallHealthExtension.destroy = function (self)
	ThornWallHealthExtension.super.destroy(self)
end

ThornWallHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

local allowed_damage_sources = {
	chaos_exalted_champion_norsca = true,
	chaos_exalted_champion_warcamp = true,
	skaven_storm_vermin_warlord = true
}

ThornWallHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)
	local unit = self.unit
	local is_attacker_enemy = DamageUtils.is_enemy(attacker_unit, unit)
	local damage_override = 0

	if allowed_damage_sources[damage_source_name] then
		damage_override = 100
	end

	Managers.state.achievement:trigger_event("register_thorn_wall_damage", self.unit, attacker_unit, damage_override, attack_type)

	if is_attacker_enemy or attack_type == "heavy_attack" or attack_type == "light_attack" then
		ThornWallHealthExtension.super.add_damage(self, attacker_unit, damage_override, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)

		if unit and unit_alive(unit) then
			unit_set_flow_variable(unit, "hit_direction", damage_direction)
			unit_set_flow_variable(unit, "hit_position", hit_position)
			unit_flow_event(unit, "lua_simple_damage")
		end
	end
end
