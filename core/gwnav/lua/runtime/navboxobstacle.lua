require("core/gwnav/lua/safe_require")

local NavBoxObstacle = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavBoxObstacle = NavClass(NavBoxObstacle)
local NavHelpers = safe_require("core/gwnav/lua/runtime/navhelpers")
local Math = stingray.Math
local Vector3 = stingray.Vector3
local Vector3Box = stingray.Vector3Box
local Matrix4x4 = stingray.Matrix4x4
local Matrix4x4Box = stingray.Matrix4x4Box
local Quaternion = stingray.Quaternion
local QuaternionBox = stingray.QuaternionBox
local Unit = stingray.Unit
local GwNavWorld = stingray.GwNavWorld
local GwNavTagVolume = stingray.GwNavTagVolume
local GwNavBoxObstacle = stingray.GwNavBoxObstacle
local _navboxstacles = {}
NavBoxObstacle.get_navboxstacle = function (unit)
	return _navboxstacles[unit]
end
NavBoxObstacle.init = function (self, navworld, unit)
	self.unit = unit
	self.navworld = navworld
	local half_extents = Vector3(NavHelpers.unit_script_data(unit, 0.2, "GwNavBoxObstacle", "half_extent", "x"), NavHelpers.unit_script_data(unit, 1, "GwNavBoxObstacle", "half_extent", "y"), NavHelpers.unit_script_data(unit, 2, "GwNavBoxObstacle", "half_extent", "z"))
	local local_center = Vector3(NavHelpers.unit_script_data(unit, 0, "GwNavBoxObstacle", "offset", "x"), NavHelpers.unit_script_data(unit, 0, "GwNavBoxObstacle", "offset", "y"), NavHelpers.unit_script_data(unit, 0, "GwNavBoxObstacle", "offset", "z"))
	local is_exclusive, color, layer_id, smartobject_id, user_data_id = NavHelpers.get_layer_and_smartobject(unit, "GwNavBoxObstacle")
	local unitPos = Matrix4x4.transform(navworld.transform:unbox(), Unit.world_position(unit, 1))
	self.lastpos = Vector3Box(unitPos)
	self.last_rotation = QuaternionBox()
	self.nav_boxobstacle = GwNavBoxObstacle.create(self.navworld.gwnavworld, unitPos, local_center, half_extents, is_exclusive, color, layer_id, smartobject_id, user_data_id)
	self.does_trigger_tag_volume = NavHelpers.unit_script_data(unit, false, "GwNavBoxObstacle", "does_trigger_tag_volume")

	self.set_does_trigger_tagvolume(self, trigger_tag_volume)

	self.rotation_mode = NavHelpers.unit_script_data(unit, "free", "GwNavBoxObstacle", "rotation_mode") == "yaw"

	self.set_rotation_mode_around_yaw(self, self.rotation_mode)

	_navboxstacles[self.unit] = self

	return 
end
NavBoxObstacle.set_does_trigger_tagvolume = function (self, does_trigger_tag_volume)
	GwNavBoxObstacle.set_does_trigger_tagvolume(self.nav_boxobstacle, does_trigger_tag_volume)

	return 
end
NavBoxObstacle.set_rotation_mode_around_yaw = function (self, rotation_mode_around_yaw_only)
	GwNavBoxObstacle.set_rotation_mode_around_yaw_only(self.nav_boxobstacle, rotation_mode_around_yaw_only)

	return 
end
NavBoxObstacle.set_next_update_config = function (self, transform, linear_velocity, angular_velocity)
	GwNavBoxObstacle.set_transform(self.nav_boxobstacle, transform)
	GwNavBoxObstacle.set_linear_velocity(self.nav_boxobstacle, linear_velocity)
	GwNavBoxObstacle.set_angular_velocity(self.nav_boxobstacle, angular_velocity)

	return 
end
NavBoxObstacle.update = function (self, dt)
	local transform = Unit.local_pose(self.unit, 1)
	local pos = Matrix4x4.translation(transform)
	local linear_velocity = (pos - self.lastpos:unbox())/dt
	local rotation = Unit.local_rotation(self.unit, 1)

	self.set_does_trigger_tagvolume(self, self.does_trigger_tag_volume and Vector3.length(linear_velocity) == 0)

	local angular_velocity = Vector3(0, 0, 0)
	local last_rot = self.last_rotation:unbox()

	if Quaternion.is_valid(rotation) and Quaternion.is_valid(last_rot) then
		local rotation_delta = Quaternion.multiply(Quaternion.inverse(rotation), last_rot)
		local angular_velocity_vector, angular_delta = Quaternion.decompose(rotation_delta)
		angular_velocity = (angular_velocity_vector*angular_delta)/dt
	end

	self.set_next_update_config(self, transform, linear_velocity, angular_velocity)
	self.lastpos:store(pos)
	self.last_rotation:store(rotation)

	return 
end
NavBoxObstacle.shutdown = function (self)
	self.navworld:remove_boxobstacle(self.unit)
	GwNavBoxObstacle.destroy(self.nav_boxobstacle)

	self.nav_boxobstacle = nil
	_navboxstacles[self.unit] = nil

	return 
end
NavBoxObstacle.add_to_world = function (self)
	GwNavBoxObstacle.add_to_world(self.nav_boxobstacle)

	return 
end
NavBoxObstacle.remove_from_world = function (self)
	GwNavBoxObstacle.remove_from_world(self.nav_boxobstacle)

	return 
end

return NavBoxObstacle
