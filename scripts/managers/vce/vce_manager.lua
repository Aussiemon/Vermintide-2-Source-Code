-- chunkname: @scripts/managers/vce/vce_manager.lua

VCEManager = class(VCEManager)

VCEManager.init = function (self)
	self._vce_by_unit = {}
	self._vce_free_list = {}
end

VCEManager.trigger_vce = function (self, vce_unit, wwise_world, ...)
	local dialogue_system = Managers.state.entity:system("dialogue_system")

	if dialogue_system:is_unit_playing_dialogue(vce_unit) then
		return
	end

	local vce_id = WwiseWorld.trigger_event(wwise_world, ...)

	self:_register_vce(vce_unit, wwise_world, vce_id)
end

VCEManager.trigger_vce_unit = function (self, vce_unit, ...)
	local dialogue_system = Managers.state.entity:system("dialogue_system")

	if dialogue_system:is_unit_playing_dialogue(vce_unit) then
		return
	end

	local vce_id, _, wwise_world = WwiseUtils.trigger_unit_event(...)

	self:_register_vce(vce_unit, wwise_world, vce_id)
end

VCEManager._register_vce = function (self, vce_unit, wwise_world, vce_id)
	local vce_data = self:_rent_vce_data()

	vce_data.vce_id = vce_id
	vce_data.wwise_world = wwise_world

	local vce = self._vce_by_unit[vce_unit] or {}

	self._vce_by_unit[vce_unit] = vce
	vce[#vce + 1] = vce_data
end

VCEManager.interrupt_vce = function (self, unit)
	local vce = self._vce_by_unit[unit]

	if not vce then
		return
	end

	for i = 1, #vce do
		local vce_data = vce[i]
		local vce_id = vce_data.vce_id
		local wwise_world = vce_data.wwise_world

		if WwiseWorld.is_playing(wwise_world, vce_id) then
			WwiseWorld.stop_event(wwise_world, vce_id)
		end

		self:_return_vce_data(vce_data)

		vce[i] = nil
	end
end

VCEManager._rent_vce_data = function (self)
	local free_list = self._vce_free_list
	local last_idx = #free_list
	local to_return = free_list[last_idx] or {}

	free_list[last_idx] = nil

	return to_return
end

VCEManager._return_vce_data = function (self, vce_data)
	local free_list = self._vce_free_list

	free_list[#free_list] = vce_data
end
