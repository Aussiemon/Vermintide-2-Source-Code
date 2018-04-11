require("scripts/managers/camera/transitions/camera_transition_base")

CameraTransitionRotationLerp = class(CameraTransitionRotationLerp, CameraTransitionBase)
CameraTransitionRotationLerp.init = function (self, node_1, node_2, duration, speed, settings)
	CameraTransitionBase.init(self, node_1, node_2, duration, speed, settings)

	self._freeze_node_1 = settings.freeze_start_node

	if self._freeze_node_1 then
		local node_1_rot = node_1.rotation(node_1)
		self._node_1_rot_table = QuaternionBox(node_1_rot)
	end

	return 
end
CameraTransitionRotationLerp.update = function (self, dt, rotation, update_time)
	CameraTransitionBase.update(self, dt, update_time)

	local node_1_rot = (self._freeze_node_1 and self._node_1_rot_table:unbox()) or rotation
	local node_2_rot = self._node_2:rotation()
	local duration = self._duration
	local t = self._time / self._duration
	local done = 1 <= t
	local rot = Quaternion.lerp(node_1_rot, node_2_rot, math.min(t, 1))

	return rot, done
end

return 
