﻿-- chunkname: @scripts/utils/ik_chain.lua

IkChain = class(IkChain)

local function unbox_pos_array(boxed_source_array, target_array, num)
	for i = 1, num do
		target_array[i] = boxed_source_array[i]:unbox()
	end

	return target_array
end

local function save_joints_in_boxed_array(source_array, target_array, num)
	for i = 1, num do
		target_array[i]:store(source_array[i])
	end
end

IkChain.init = function (self, joints, start_pos, target_pos, tolerance, use_max_joint_angle)
	self._nodes = {}

	local lengths = {}
	local sum = 0
	local boxed_joints = {}

	for i = 1, #joints - 1 do
		local d = Vector3.length(joints[i] - joints[i + 1])

		lengths[i] = d
		sum = sum + d
	end

	for i = 1, #joints do
		boxed_joints[i] = Vector3Box(joints[i])
	end

	self.n = #joints
	self.tolerance = tolerance or 0.1
	self.target_pos = Vector3Box(target_pos)
	self.aim_pos = Vector3Box(joints[self.n])
	self.joints = boxed_joints
	self.lengths = lengths
	self.origin_pos = Vector3Box(joints[1])
	self.totallength = sum

	if use_max_joint_angle then
		self.constrain_angle = use_max_joint_angle
		self.dot_constrain = math.cos(use_max_joint_angle)
	end
end

IkChain.set_origin_pos = function (self, pos)
	self.origin_pos:store(pos)
end

IkChain.set_target_pos = function (self, target_pos, acceleration)
	self.target_pos:store(target_pos)

	self.acc = acceleration or 1
end

IkChain.set_whip = function (self, angle_velocity)
	self.whip_angle_velocity = angle_velocity
end

IkChain.update_whip = function (self, joints, angular_velocity, t, dt)
	local n1 = 1
	local n2 = 2
	local q = Quaternion.axis_angle(Vector3.up(), t % 6.28)
	local j1 = joints[n1]
	local j2 = joints[n2]
	local k = j2 - j1
	local k2 = Quaternion.rotate(q, k)

	joints[n2] = j1 + k2

	QuickDrawer:line(joints[n1], joints[n2], Color(20, 255, 175))
end

IkChain.debug_draw = function (self, joints, num_joints)
	local line_color = self.constrain_angle and Color(120, 0, 120) or Color(120, 255, 0)
	local ball_color = Color(0, 155, 255)

	for i = 1, num_joints - 1 do
		QuickDrawer:line(joints[i], joints[i + 1], line_color)
		QuickDrawer:sphere(joints[i], 0.05 + i * 0.01, ball_color)
	end

	QuickDrawer:sphere(joints[num_joints], 0.05, ball_color)
	QuickDrawer:sphere(self.target_pos:unbox(), 0.1, Color(255, 45, 0))
	QuickDrawer:sphere(self.aim_pos:unbox(), 0.095, Color(255, 0, 200))
end

IkChain.backward = function (self, joints, lengths, num_joints, target_pos)
	joints[num_joints] = target_pos

	for i = num_joints - 1, 1, -1 do
		local r = joints[i + 1] - joints[i]
		local l = lengths[i] / Vector3.length(r)
		local pos = (1 - l) * joints[i + 1] + l * joints[i]

		joints[i] = pos
	end
end

IkChain.forward = function (self, joints, lengths, num_joints, start_pos)
	joints[1] = start_pos

	for i = 1, num_joints - 1 do
		local r = joints[i + 1] - joints[i]
		local l = lengths[i] / Vector3.length(r)
		local pos = (1 - l) * joints[i] + l * joints[i + 1]

		joints[i + 1] = pos
	end
end

local dot_constrain = 0.7
local constrain_angle = math.acos(dot_constrain)

IkChain.forward_constrained = function (self, joints, lengths, num_joints, start_pos)
	local dot_constrain = self.dot_constrain
	local constrain_angle = self.constrain_angle
	local up = Vector3.up()

	joints[1] = start_pos

	local cone_dir = Vector3.normalize(joints[2] - start_pos)

	for i = 1, num_joints - 1 do
		local r = joints[i + 1] - joints[i]
		local l = lengths[i] / Vector3.length(r)
		local pos = (1 - l) * joints[i] + l * joints[i + 1]
		local wanted_dir = Vector3.normalize(pos - joints[i])
		local dot = Vector3.dot(cone_dir, wanted_dir)

		if dot_constrain < dot then
			joints[i + 1] = pos
		else
			local axis_dir = Vector3.cross(cone_dir, wanted_dir)
			local axis_rot = Quaternion(axis_dir, constrain_angle)
			local constrained_vec = Quaternion.rotate(axis_rot, cone_dir)

			joints[i + 1] = joints[i] + constrained_vec * lengths[i]
		end

		cone_dir = Vector3.normalize(joints[i + 1] - joints[i])
	end
end

local temp_joints = {}

IkChain.solve = function (self, t, dt)
	local target_pos = self.target_pos:unbox()
	local aim_pos = self.aim_pos:unbox()
	local to_target = target_pos - aim_pos
	local target_pos = aim_pos + to_target * (self.acc or 1) * dt

	self.aim_pos:store(target_pos)

	local start_pos = self.origin_pos:unbox()
	local num_joints = self.n
	local joints = unbox_pos_array(self.joints, temp_joints, num_joints)

	if self.whip_angle_velocity then
		self:update_whip(joints, self.whip_angle_velocity, t, dt)
	end

	local lengths = self.lengths
	local count = 0
	local distance = Vector3.length(joints[1] - target_pos)

	if distance > self.totallength then
		for i = 1, num_joints - 1 do
			local r = Vector3.length(target_pos - joints[i])
			local l = lengths[i] / r

			joints[i + 1] = (1 - l) * joints[i] + l * target_pos
		end
	else
		local dif = Vector3.length(joints[num_joints] - target_pos)

		while dif > self.tolerance do
			self:backward(joints, lengths, num_joints, target_pos)

			if self.constrain_angle then
				self:forward_constrained(joints, lengths, num_joints, start_pos)
			else
				self:forward(joints, lengths, num_joints, start_pos)
			end

			dif = Vector3.length(joints[num_joints] - target_pos)
			count = count + 1

			if count > 10 then
				break
			end
		end
	end

	save_joints_in_boxed_array(joints, self.joints, num_joints)
	self:debug_draw(joints, num_joints)
	Debug.text("Solving tentacle: %d iterations, %d joints", count, self.n)
end

IkChain.solve_dragging = function (self, t, dt)
	local target_pos = self.target_pos:unbox()
	local aim_pos = self.aim_pos:unbox()
	local to_target = target_pos - aim_pos
	local target_pos = aim_pos + to_target * (self.acc or 1) * dt

	self.aim_pos:store(target_pos)

	local start_pos = self.origin_pos:unbox()
	local num_joints = self.n
	local joints = unbox_pos_array(self.joints, temp_joints, num_joints)
	local lengths = self.lengths
	local count = 0
	local distance = Vector3.length(joints[1] - target_pos)

	if distance > self.totallength then
		for i = 1, num_joints - 1 do
			local r = Vector3.length(target_pos - joints[i])
			local l = lengths[i] / r

			joints[i + 1] = (1 - l) * joints[i] + l * target_pos
		end
	else
		self:backward(joints, lengths, num_joints, target_pos)
	end

	save_joints_in_boxed_array(joints, self.joints, num_joints)
	self:debug_draw(joints, num_joints)
	Debug.text("Solving tentacle dragging: %d iterations, %d joints", count, self.n)
end
