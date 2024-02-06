-- chunkname: @scripts/unit_extensions/wizards/shockwave_spell_extension.lua

ShockwaveSpellExtension = class(ShockwaveSpellExtension)

ShockwaveSpellExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._position = Vector3Box(Unit.local_position(unit, 0))
	self._shockwave_radius_min = Unit.get_data(unit, "wave_distance") or 2
	self._shockwave_radius_max = Unit.get_data(unit, "wave_distance") or 30
	self._vfx = Unit.get_data(unit, "spell_vfx") or "fx/wizard_tower_end_sofia_explosion"
	self._spell_triggerd = false
	self._world = extension_init_context.world
	self._start_time = 0
	self._time_to_broadphase = 0.15
	self._enemy_damage = 0
	self._players = Managers.player:players()

	Managers.state.event:register(self, "on_failed_guardians_event", "setup_shockwave")
end

local lerp_time = 1.5
local RESULT_TABLE = {}
local HIT_ENEMIES = {}
local frame = 0
local braodphase_frame = 0
local num_hits = 0
local broadphase_timer = 0.25

ShockwaveSpellExtension.update = function (self, unit, input, dt, context, t)
	if not self._spell_triggerd then
		return
	end

	broadphase_timer = broadphase_timer + dt

	local do_broadphase = broadphase_timer >= self._time_to_broadphase
	local elapsed_time = t - self._start_time
	local lerp_t = elapsed_time / lerp_time

	lerp_t = math.clamp(lerp_t, 0, 1)

	local radius = math.lerp(self._shockwave_radius_min, self._shockwave_radius_max, lerp_t)
	local position = self._position:unbox()

	if not (lerp_t >= 1) and do_broadphase then
		num_hits = AiUtils.broadphase_query(position, radius, RESULT_TABLE)
		broadphase_timer = 0
	end

	self:damage_player(position, radius)
	self:damage_enemies(position, t)

	if lerp_t >= 1 and num_hits <= 0 then
		self:reset_shockwave()
	end
end

ShockwaveSpellExtension.damage_enemies = function (self, position, t)
	if num_hits > 0 then
		local damage_num_units = math.min(num_hits, 3)

		for i = 1, damage_num_units do
			local unit = RESULT_TABLE[i]

			if ALIVE[unit] or not HIT_ENEMIES[unit] then
				local hit_unit_position = POSITION_LOOKUP[unit]
				local damage_direction = Vector3.normalize(hit_unit_position - position)
				local health_extension = ScriptUnit.extension(unit, "health_system")

				HIT_ENEMIES[unit] = true

				local hit_zone_name = "torso"
				local damage_source
				local attacker_unit = self._unit
				local damage_type = "grenade"

				DamageUtils.add_damage_network(unit, attacker_unit, 240, hit_zone_name, damage_type, hit_unit_position, damage_direction, damage_source)
			end
		end

		for i = damage_num_units, 1, -1 do
			table.swap_delete(RESULT_TABLE, i)
		end

		num_hits = #RESULT_TABLE
	end
end

ShockwaveSpellExtension.damage_player = function (self, position, radius)
	local players = self._players
	local radius_squared = radius * radius

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if ALIVE[player_unit] and not HIT_ENEMIES[player_unit] then
			local player_position = POSITION_LOOKUP[player_unit]

			if radius_squared > Vector3.distance_squared(position, player_position) then
				local hit_zone_name = "torso"
				local damage_type = "forced"
				local damage_direction = Vector3.normalize(player_position - position)
				local health_extension = ScriptUnit.extension(player_unit, "health_system")
				local current_health = health_extension:current_health()
				local damage = current_health / 2

				health_extension:add_damage(player_unit, damage, hit_zone_name, damage_type, player_position, damage_direction)

				HIT_ENEMIES[player_unit] = true

				local push_multiplier = 10
				local pushed_velocity = (damage_direction + Vector3.up() * 3) * push_multiplier
				local locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end
	end
end

ShockwaveSpellExtension.setup_shockwave = function (self, damage_data)
	self._enemy_damage = damage_data.enemy_damage

	local t = Managers.time:time("game")

	self._start_time = t
	self._spell_triggerd = true

	World.create_particles(self._world, self._vfx, self._position:unbox())
end

ShockwaveSpellExtension.reset_shockwave = function (self)
	self._spell_triggerd = false

	table.clear(HIT_ENEMIES)
end

ShockwaveSpellExtension.destroy = function (self)
	Managers.state.event:unregister("on_failed_guardians_event", self)
end
