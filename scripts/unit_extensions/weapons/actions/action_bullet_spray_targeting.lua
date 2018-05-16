ActionBulletSprayTargeting = class(ActionBulletSprayTargeting)
local POSITION_TWEAK = -1
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 10
local SPRAY_RADIUS = 4
local CIRCLE_POSITION = math.abs(POSITION_TWEAK) + 0.5

ActionBulletSprayTargeting.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.item_name = item_name
	self.world = world
end

ActionBulletSprayTargeting.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self._target_index = 1
	local cone_hypotenuse = math.sqrt(SPRAY_RANGE * SPRAY_RANGE + SPRAY_RADIUS * SPRAY_RADIUS)
	self.CONE_COS_ALPHA = SPRAY_RANGE / cone_hypotenuse
	self.CIRCLE_RADIUS = SPRAY_RADIUS / (SPRAY_RANGE + POSITION_TWEAK) * (CIRCLE_POSITION + POSITION_TWEAK)
end

ActionBulletSprayTargeting.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit_1p = self.owner_unit_first_person
	local player_position = POSITION_LOOKUP[owner_unit_1p]
	local player_rotation = Unit.world_rotation(owner_unit_1p, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))

	self:_draw_circle(player_position, player_direction)

	if script_data.debug_weapons then
		local start_point = player_position + player_direction * POSITION_TWEAK
		local end_point = player_position + player_direction * POSITION_TWEAK + player_direction * SPRAY_RANGE

		QuickDrawer:cone(player_position + player_direction * POSITION_TWEAK, end_point, SPRAY_RADIUS, Color(255, 255, 0, 255), 50, 50)
	end
end

ActionBulletSprayTargeting.finish = function (self, reason)
	return
end

ActionBulletSprayTargeting._draw_circle = function (self, player_position, player_direction)
	local circle_position = player_position + POSITION_TWEAK * player_direction + CIRCLE_POSITION * player_direction

	QuickDrawer:circle(circle_position, self.CIRCLE_RADIUS, -player_direction, Color(255, 255, 0, 255))
end

return
