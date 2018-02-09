FreeFlight = class(FreeFlight)
FreeFlight.init = function (self, camera, unit)
	self.camera = camera
	self.unit = unit
	self.translation_speed = 0.2

	if PLATFORM == "win32" then
		self.rotation_speed = 0.003
	else
		self.rotation_speed = 0.03
	end

	return 
end
FreeFlight.update = function (self, dt)
	local input = {}

	if PLATFORM == "win32" then
		input.pan = Mouse.axis(Mouse.axis_index("mouse"))
		input.accelerate = Vector3.y(Mouse.axis(Mouse.axis_index("wheel")))
		input.move = Vector3(Keyboard.button(Keyboard.button_index("d")) - Keyboard.button(Keyboard.button_index("a")), Keyboard.button(Keyboard.button_index("w")) - Keyboard.button(Keyboard.button_index("s")), Keyboard.button(Keyboard.button_index("e")) - Keyboard.button(Keyboard.button_index("q")))
	end

	if PLATFORM == "ps3" then
		input.pan = Pad1.axis(Pad1.axis_index("right"))

		Vector3.set_y(input.pan, -input.pan.y)

		input.move = Pad1.axis(Pad1.axis_index("left"))
		input.accelerate = Pad1.button(Pad1.button_index("r2_trigger")) - Pad1.button(Pad1.button_index("r1_trigger"))
	end

	local translation_change_speed = self.translation_speed*0.1
	self.translation_speed = self.translation_speed + input.accelerate*translation_change_speed

	if self.translation_speed < 0.001 then
		self.translation_speed = 0.001
	end

	local cm = Camera.local_pose(self.camera)
	local trans = Matrix4x4.translation(cm)

	Matrix4x4.set_translation(cm, Vector3(0, 0, 0))

	local q1 = Quaternion(Vector3(0, 0, 1), -Vector3.x(input.pan)*self.rotation_speed)
	local q2 = Quaternion(Matrix4x4.x(cm), -Vector3.y(input.pan)*self.rotation_speed)
	local q = Quaternion.multiply(q1, q2)
	cm = Matrix4x4.multiply(cm, Matrix4x4.from_quaternion(q))
	local offset = Matrix4x4.transform(cm, input.move*self.translation_speed)
	trans = Vector3.add(trans, offset)

	Matrix4x4.set_translation(cm, trans)
	Camera.set_local_pose(self.camera, self.unit, cm)

	return 
end

return 
