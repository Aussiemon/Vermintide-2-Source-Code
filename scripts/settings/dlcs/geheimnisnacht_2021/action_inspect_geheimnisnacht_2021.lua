ActionInspectGeheimnisnacht2021 = class(ActionInspectGeheimnisnacht2021, ActionDummy)
local INFLUENCE_RATE_MULT = 0.05
local INFLUENCE_RATE_MULT_DOWN = 0.5
local MAX_INFLUENCE_AT_ANGLE_MULT = 1.05
local MAX_INFLUENCE_FLOOR = 0
local MIN_INFLUNECE = 0
local MAX_INFLUENCE = 1
local SCREEN_FX_2_NAME = "fx/invisible_screen_distortion_extreme"
local CURSE_INTERVAL = 0.5
local CURSE_COVERT_AMOUNT = 5
local immune_careers = {
	es_questingknight = true,
	dr_slayer = true,
	wh_priest = true,
	we_thornsister = true
}

ActionInspectGeheimnisnacht2021.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionInspectGeheimnisnacht2021.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self._dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._health_extension = ScriptUnit.has_extension(owner_unit, "health_system")
	self._influence_str = 0
	self._influence_str_max = 0
	self._screen_fx_id = nil
	self._is_immune = immune_careers[self._career_extension:career_name()]
	self._next_curse_time_t = 0
	self._take_curse_damage = false
	self._buff_system = Managers.state.entity:system("buff_system")
end

ActionInspectGeheimnisnacht2021.client_owner_start_action = function (self, new_action, t)
	ActionInspectGeheimnisnacht2021.super.client_owner_start_action(self, new_action, t)

	self._influence_str = 0
	self._influence_str_max = 0
	self._next_curse_time_t = 0
	self._take_curse_damage = false

	self._first_person_extension:animation_set_variable("influence", self._influence_str)
end

ActionInspectGeheimnisnacht2021.client_owner_post_update = function (self, dt, t, world, can_damage)
	local old_influnece = self._influence_str

	if not self._is_immune then
		local skull_rotation = Unit.world_rotation(self.weapon_unit, 0)
		local look_rotation = self._first_person_extension:current_rotation()
		local skull_look_dir = Quaternion.forward(skull_rotation)
		local owner_look_dir = Quaternion.forward(look_rotation)
		local angle = Vector3.dot(skull_look_dir, owner_look_dir)
		local max_influence_at_angle = angle > 0.9 and math.max(angle * MAX_INFLUENCE_AT_ANGLE_MULT, MAX_INFLUENCE_FLOOR) or 0
		local influence_inc = INFLUENCE_RATE_MULT * dt

		if max_influence_at_angle < self._influence_str then
			influence_inc = INFLUENCE_RATE_MULT_DOWN * dt
		end

		local influence_rate = max_influence_at_angle * INFLUENCE_RATE_MULT
		self._influence_str = math.min(math.lerp(self._influence_str, max_influence_at_angle, influence_inc), MAX_INFLUENCE)
	end

	self._first_person_extension:animation_set_variable("influence", self._influence_str)

	self._influence_str_max = math.max(self._influence_str_max, self._influence_str)

	if old_influnece < 0.3 and self._influence_str >= 0.3 then
		Unit.animation_event(self.first_person_unit, "gehemnisnacht_egg_heartbeat_start")
	end

	if old_influnece > 0.3 and self._influence_str <= 0.3 then
		Unit.animation_event(self.first_person_unit, "gehemnisnacht_egg_heartbeat_stop")
	end

	if old_influnece < 0.7 and self._influence_str >= 0.7 then
		Unit.animation_event(self.first_person_unit, "gehemnisnacht_egg_level2")
		self:_create_screen_particles()
		self._first_person_extension:set_weapon_sway_settings({
			recentering_lerp_speed = 250,
			lerp_speed = 3,
			sway_range = 1,
			camera_look_sensitivity = 0.03,
			look_sensitivity = 8
		})
	end

	if old_influnece > 0.7 and self._influence_str <= 0.7 then
		Unit.animation_event(self.first_person_unit, "gehemnisnacht_egg_level1")
		self._first_person_extension:set_weapon_sway_settings({
			recentering_lerp_speed = 0,
			lerp_speed = 10,
			sway_range = 1,
			camera_look_sensitivity = 1,
			look_sensitivity = 1.5
		})
	end

	if old_influnece < 0.9 and self._influence_str >= 0.9 then
		Unit.animation_event(self.first_person_unit, "gehemnisnacht_egg_level3")
		self._first_person_extension:set_weapon_sway_settings({
			recentering_lerp_speed = 10,
			lerp_speed = 10,
			sway_range = 1,
			camera_look_sensitivity = 1,
			look_sensitivity = 1.5
		})

		self._take_curse_damage = true
	end

	if self._take_curse_damage and self._next_curse_time_t <= t then
		self._next_curse_time_t = t + CURSE_INTERVAL

		self._health_extension:convert_to_temp(CURSE_COVERT_AMOUNT)
	end

	if self._screen_fx_id then
		local player = Managers.player:owner(self.owner_unit)
		local viewport_name = player.viewport_name
		local viewport = ScriptWorld.viewport(self.world, viewport_name)
		local camera = ScriptViewport.camera(viewport)
		local screen_width = RESOLUTION_LOOKUP.res_w
		local screen_height = RESOLUTION_LOOKUP.res_h
		local center_pos_x = screen_width / 2
		local center_pos_y = screen_height / 2
		local skull_world_pos = Unit.world_position(self.weapon_unit, 0)
		local view_pos = Camera.world_to_screen(camera, skull_world_pos)
		local screen_pos = Vector3((view_pos.x - center_pos_x) / center_pos_x, 0, (view_pos.y - center_pos_y) / center_pos_y)

		World.move_particles(self.world, self._screen_fx_id, screen_pos)
	end
end

ActionInspectGeheimnisnacht2021.finish = function (self, reason)
	ActionInspectGeheimnisnacht2021.super.finish(self, reason)
	self:_destroy_screen_particles()
end

ActionInspectGeheimnisnacht2021._create_screen_particles = function (self)
	if not self._screen_fx_id then
		self._screen_fx_id = self._first_person_extension:create_screen_particles(SCREEN_FX_2_NAME, Vector3(1, 0, 0))
	end
end

ActionInspectGeheimnisnacht2021._destroy_screen_particles = function (self)
	if self._screen_fx_id then
		self._first_person_extension:stop_spawning_screen_particles(self._screen_fx_id)

		self._screen_fx_id = nil
	end
end
