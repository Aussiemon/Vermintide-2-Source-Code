script_data.infinite_ammo = script_data.infinite_ammo or Development.parameter("infinite_ammo")
ActiveReloadAmmoUserExtension = class(ActiveReloadAmmoUserExtension)

ActiveReloadAmmoUserExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.owner_unit = extension_init_data.owner_unit
	local ammo_data = extension_init_data.ammo_data
	self.reload_time = ammo_data.reload_time
	self.max_ammo = ammo_data.max_ammo
	self.start_ammo = ammo_data.start_ammo or self.max_ammo
	self.ammo_per_clip = ammo_data.ammo_per_clip or self.start_ammo
	self.time_penalty = ammo_data.time_penalty

	if ScriptUnit.has_extension(self.owner_unit, "first_person_system") then
		self.first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
	end

	if ScriptUnit.has_extension(self.owner_unit, "input_system") then
		self.input_extension = ScriptUnit.extension(self.owner_unit, "input_system")
	end

	self._gui = World.create_screen_gui(extension_init_context.world, "immediate")

	self:reset()
end

ActiveReloadAmmoUserExtension.extensions_ready = function (self, world, unit)
	return
end

ActiveReloadAmmoUserExtension.destroy = function (self)
	return
end

ActiveReloadAmmoUserExtension.reset = function (self)
	self.current_ammo = self.ammo_per_clip
	self.available_ammo = self.start_ammo - self.current_ammo
	self.shots_fired = 0
end

ActiveReloadAmmoUserExtension.update = function (self, unit, input, dt, context, t)
	if self.shots_fired > 0 then
		self.current_ammo = self.current_ammo - self.shots_fired
		self.shots_fired = 0

		assert(self.current_ammo >= 0)

		if self.current_ammo == 0 then
			Unit.flow_event(unit, "used_last_ammo")

			if self.available_ammo == 0 then
				local inventory_system = ScriptUnit.extension(self.owner_unit, "inventory_system")
				local equipment = inventory_system:equipment()
				local slot_name = equipment.wielded_slot
				local slots = equipment.slots
				local slot_data = slots[slot_name]
				local item_data = slot_data.item_data
				local item_template = BackendUtils.get_item_template(item_data)
				local ammo_data = item_template.ammo_data

				if ammo_data.destroy_when_out_of_ammo then
					inventory_system:destroy_slot(slot_name)
					inventory_system:wield_previous_weapon()
				end
			end
		end
	end

	if self.next_reload_time then
		if self.next_reload_time < t then
			if not self.start_reloading then
				self.current_ammo = self.current_ammo + 1
				self.available_ammo = self.available_ammo - 1
			end

			self.start_reloading = nil
			local num_missing = self.ammo_per_clip - self.current_ammo

			if num_missing > 0 and self.available_ammo > 0 then
				local reload_event = "reload"
				self.next_reload_time = t + self.reload_time

				if num_missing == 1 or self.available_ammo == 1 then
					reload_event = "reload_last"
				end

				if self.first_person_extension then
					self.first_person_extension:play_animation_event(reload_event)
				end

				Unit.animation_event(self.owner_unit, reload_event)

				if not LEVEL_EDITOR_TEST then
					Managers.state.network:anim_event(self.owner_unit, reload_event)
				end

				self:_setup_indicator_area()
			else
				self.next_reload_time = nil
			end

			self.event_missed = nil
		end

		if self.next_reload_time and not self.event_missed then
			self:_update_active_reload(dt, t)
			self:_debug_draw(dt, t)
		end
	end
end

local EVENT_TIME = 0.2
local DEAD_ZONE_PERCENT = 0.3

ActiveReloadAmmoUserExtension._update_active_reload = function (self, dt, t)
	if not self.input_extension:get("weapon_reload") then
		return
	end

	local reload_start_time = self:reload_start_time()
	local dead_zone_time = self.reload_time * DEAD_ZONE_PERCENT

	if t < reload_start_time + dead_zone_time then
		return
	end

	local event_start = reload_start_time + self.event_start
	local event_end = event_start + EVENT_TIME

	if event_start <= t and t <= event_end then
		self.next_reload_time = t
	else
		self.next_reload_time = self.next_reload_time + self.time_penalty
		self.event_missed = true
	end
end

ActiveReloadAmmoUserExtension._debug_draw = function (self, dt, t)
	local gui = self._gui
	local w, h = Gui.resolution()
	local pos = Vector3(w * 0.5, h * 0.4, 100)
	local bg_size = Vector2(150, 35)
	local bg_pos_offset = Vector3(-bg_size.x / 2, -bg_size.y / 2, 0)

	Gui.rect(gui, pos + bg_pos_offset, bg_size, Color(200, 237, 237, 237))

	local current_time = self.next_reload_time - t
	local progress = 1 - current_time / self.reload_time
	local marker_size = Vector2(3, 35)
	local marker_pos_offset = Vector3(bg_size.x * progress - marker_size.x * 0.5, 0, 10)

	Gui.rect(gui, pos + bg_pos_offset + marker_pos_offset, marker_size, Color(255, 0, 0, 0))

	local event_start = self.event_start
	local event_end = event_start + EVENT_TIME
	local start_percentage = event_start / self.reload_time
	local end_percentage = math.min(1, 1 - event_end / self.reload_time)
	local percentage = EVENT_TIME / self.reload_time
	local area_size = Vector2(bg_size.x * percentage, 35)
	local area_pos_offset = Vector3(bg_size.x * start_percentage, 0, 5)

	Gui.rect(gui, pos + bg_pos_offset + area_pos_offset, area_size, Color(255, 107, 106, 105))

	local indicator_size = Vector2(1, 35)
	local indicator_pos_offset = Vector3(bg_size.x * DEAD_ZONE_PERCENT, 0, 5)

	Gui.rect(gui, pos + bg_pos_offset + indicator_pos_offset, indicator_size, Color(255, 255, 0, 0))
end

local EVENT_START_PERCENT = 0.6

ActiveReloadAmmoUserExtension._setup_indicator_area = function (self)
	assert(self.next_reload_time)

	local reload_start = self:reload_start_time()
	self.event_start = self.reload_time * EVENT_START_PERCENT
end

ActiveReloadAmmoUserExtension.reload_start_time = function (self)
	assert(self.next_reload_time)

	return self.next_reload_time - self.reload_time
end

ActiveReloadAmmoUserExtension.add_ammo = function (self, ammo_amount)
	self.available_ammo = math.min(self.available_ammo + ammo_amount, self.max_ammo - self.current_ammo - self.shots_fired)
end

ActiveReloadAmmoUserExtension.use_ammo = function (self, ammo_used)
	self.shots_fired = self.shots_fired + ammo_used

	assert(self:ammo_count() >= 0)
end

ActiveReloadAmmoUserExtension.start_reload = function (self, play_reload_animation)
	assert(self:can_reload())
	assert(self.next_reload_time == nil)

	self.start_reloading = true
	self.next_reload_time = 0
end

ActiveReloadAmmoUserExtension.abort_reload = function (self)
	assert(self:is_reloading())

	self.start_reloading = nil
	self.next_reload_time = nil
end

ActiveReloadAmmoUserExtension.ammo_count = function (self)
	return self.current_ammo - self.shots_fired
end

ActiveReloadAmmoUserExtension.clip_size = function (self)
	return self.ammo_per_clip
end

ActiveReloadAmmoUserExtension.remaining_ammo = function (self)
	return self.available_ammo
end

ActiveReloadAmmoUserExtension.can_reload = function (self)
	if self:is_reloading() then
		return false
	end

	if self:ammo_count() == self.ammo_per_clip then
		return false
	end

	if script_data.infinite_ammo then
		return true
	end

	return self.available_ammo > 0
end

ActiveReloadAmmoUserExtension.is_reloading = function (self)
	return self.next_reload_time ~= nil
end

return
