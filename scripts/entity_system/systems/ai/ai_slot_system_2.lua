require("scripts/unit_extensions/human/ai_player_unit/ai_utils")
require("scripts/settings/slot_templates")
require("scripts/settings/slot_settings")
require("scripts/entity_system/systems/ai/ai_enemy_slot_extension")
require("scripts/entity_system/systems/ai/ai_player_slot_extension")
require("scripts/entity_system/systems/ai/ai_aggroable_slot_extension")

local DEFAULT_SLOT_TYPE = "normal"
local extensions = {
	"AIEnemySlotExtension",
	"AIPlayerSlotExtension",
	"AIAggroableSlotExtension"
}
AISlotSystem2 = class(AISlotSystem2, ExtensionSystemBase)
local SlotTypeSettings = SlotTypeSettings
local debug_draw_slots, debug_print_slots_count = nil

AISlotSystem2.init = function (self, context, system_name)
	AISlotSystem2.super.init(self, context, system_name, extensions)

	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.unit_extension_data = {}
	self.frozen_unit_extension_data = {}
	self.update_slots_ai_units = {}
	self.update_slots_ai_units_prioritized = {}
	self.target_units = {}
	self.current_ai_index = 1
	self.next_total_slot_count_update = 0
	self.next_disabled_slot_count_update = 0
	self.next_slot_sound_update = 0
	self.network_transmit = context.network_transmit
	self.num_total_enemies = 0
	self.num_occupied_slots = 0
	local nav_tag_layer_costs = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		fire_grenade = 1
	}

	table.merge(nav_tag_layer_costs, NAV_TAG_VOLUME_LAYER_COST_AI)

	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()
	self._navtag_layer_cost_table = navtag_layer_cost_table

	AiUtils.initialize_cost_table(navtag_layer_cost_table, nav_tag_layer_costs)

	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()
	self._nav_cost_map_cost_table = nav_cost_map_cost_table

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

	self._traverse_logic = GwNavTraverseLogic.create(self.nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(self._traverse_logic, navtag_layer_cost_table)
end

AISlotSystem2.destroy = function (self)
	if self._traverse_logic ~= nil then
		GwNavTagLayerCostTable.destroy(self._navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(self._nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self._traverse_logic)
	end
end

local unit_alive = AiUtils.unit_alive

AISlotSystem2.hot_join_sync = function (self, peer_id, player)
	return
end

local AI_UPDATES_PER_FRAME = 1

AISlotSystem2.do_slot_search = function (self, ai_unit, set)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if ai_unit_extension then
		ai_unit_extension.do_search = set
	end
end

AISlotSystem2.ai_unit_have_slot = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return false
	end

	local ai_have_slot = ai_unit_extension.gathering_ball or ai_unit_extension.sloid_id

	if ai_have_slot then
		return true
	end

	local slot = ai_unit_extension.slot

	if not slot then
		return false
	end

	return true
end

AISlotSystem2.ai_unit_have_wait_slot = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return false
	end

	local slot = ai_unit_extension.waiting_on_slot

	if not slot then
		return false
	end

	return true
end

AISlotSystem2.ai_unit_wait_slot_distance = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return math.huge
	end

	local slot = ai_unit_extension.slot

	if slot then
		return math.huge
	end

	local waiting_on_slot = ai_unit_extension.waiting_on_slot

	if not waiting_on_slot then
		return math.huge
	end

	local distance = ai_unit_extension.wait_slot_distance or math.huge

	return distance
end

AISlotSystem2.ai_unit_slot_position = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return nil
	end

	local slot = ai_unit_extension.slot or ai_unit_extension.waiting_on_slot

	if slot then
		return slot.absolute_position:unbox()
	end

	return nil
end

AISlotSystem2.ai_unit_blocked_attack = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if ai_unit_extension and ai_unit_extension.on_unit_blocked_attack then
		ai_unit_extension:on_unit_blocked_attack(ai_unit, self)
	end
end

AISlotSystem2.ai_unit_staggered = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if ai_unit_extension and ai_unit_extension.ai_unit_staggered then
		ai_unit_extension:ai_unit_staggered(ai_unit, self)
	end
end

AISlotSystem2.get_target_unit_slot_data = function (self, target_unit, slot_type)
	local target_unit_extension = self.unit_extension_data[target_unit]
	local slot_data = target_unit_extension.all_slots[slot_type]

	if not slot_data then
		return
	end

	local slots = slot_data.slots

	return slots
end

AISlotSystem2.slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]

	return slot_data.slots_count
end

AISlotSystem2.total_slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]

	return slot_data.total_slots_count
end

AISlotSystem2.disabled_slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]

	return slot_data.disabled_slots_count
end

AISlotSystem2.set_release_slot_lock = function (self, unit, release_slot_lock)
	local unit_extension = self.unit_extension_data[unit]

	if unit_extension then
		unit_extension.release_slot_lock = release_slot_lock
	end
end

AISlotSystem2.update_target_slots = function (self, t)
	local target_units = self.target_units

	for i = 1, #target_units do
		local target_unit_extension = target_units[i]
		local successful = target_unit_extension:update_target_slots(t, target_units, self.nav_world, self._traverse_logic)

		if successful then
			break
		end
	end
end

AISlotSystem2.update_disabled_slots_count = function (self, t)
	local target_units = self.target_units

	for i = 1, #target_units do
		local target_unit_extension = target_units[i]

		target_unit_extension:update_disabled_slots_count(t)
	end
end

AISlotSystem2.update_slot_sound = function (self, t)
	local target_units = self.target_units

	for unit_i = 1, #target_units do
		local target_unit_extension = target_units[unit_i]

		target_unit_extension:update_slot_sound(t)
	end
end

AISlotSystem2.update = function (self, context, t, dt)
	if not script_data.navigation_thread_disabled then
		local nav_world = self.nav_world

		GwNavWorld.join_async_update(nav_world)

		NAVIGATION_RUNNING_IN_THREAD = false
	end
end

local TOTAL_SLOTS_COUNT_UPDATE_INTERVAL = 1
local DISABLED_SLOTS_COUNT_UPDATE_INTERVAL = 1
local SLOT_SOUND_UPDATE_INTERVAL = 1

AISlotSystem2.update_slot_providers = function (self, t)
	local target_units = self.target_units
	local target_units_n = #target_units

	if target_units_n == 0 then
		return
	end

	self:update_target_slots(t)

	if self.next_total_slot_count_update < t then
		self:update_total_slots_count(t)

		self.next_total_slot_count_update = t + TOTAL_SLOTS_COUNT_UPDATE_INTERVAL
	end

	if self.next_disabled_slot_count_update < t then
		self:update_disabled_slots_count(t)

		self.next_disabled_slot_count_update = t + DISABLED_SLOTS_COUNT_UPDATE_INTERVAL
	end

	if self.next_slot_sound_update < t then
		self:update_slot_sound(t)

		self.next_slot_sound_update = t + SLOT_SOUND_UPDATE_INTERVAL
	end
end

AISlotSystem2.traverse_logic = function (self)
	return self._traverse_logic
end

AISlotSystem2.update_slot_consumers = function (self, t)
	local nav_world = self.nav_world
	local unit_extension_data = self.unit_extension_data
	local update_slots_ai_units = self.update_slots_ai_units
	local update_slots_ai_units_n = #update_slots_ai_units

	if update_slots_ai_units_n < self.current_ai_index then
		self.current_ai_index = 1
	end

	local start_index = self.current_ai_index
	local end_index = math.min(start_index + AI_UPDATES_PER_FRAME - 1, update_slots_ai_units_n)
	self.current_ai_index = end_index + 1
	local update_slots_ai_units_prioritized = self.update_slots_ai_units_prioritized

	for i = start_index, end_index do
		local ai_unit = update_slots_ai_units[i]
		local extension = unit_extension_data[ai_unit]

		extension:update(ai_unit, unit_extension_data, nav_world, t, self._traverse_logic, self)

		update_slots_ai_units_prioritized[ai_unit] = nil
	end

	for ai_unit, _ in pairs(update_slots_ai_units_prioritized) do
		local extension = unit_extension_data[ai_unit]

		if extension then
			extension:update(ai_unit, unit_extension_data, nav_world, t, self._traverse_logic, self)
		end

		update_slots_ai_units_prioritized[ai_unit] = nil
	end
end

AISlotSystem2.physics_async_update = function (self, context, t)
	self.t = t
	local target_units = self.target_units
	local target_units_n = #target_units

	if target_units_n == 0 then
		return
	end

	local nav_world = self.nav_world
	local unit_extension_data = self.unit_extension_data

	self:update_slot_providers(t)
	self:update_slot_consumers(t)
end

AISlotSystem2.update_total_slots_count = function (self, t)
	local target_units = self.target_units
	local num_slots = 0
	local num_slots_occupied_total = 0

	for j = 1, #target_units do
		local target_unit_extension = target_units[j]
		local available, occupied = target_unit_extension:update_total_slots_count(t)
		num_slots = num_slots + available
		num_slots_occupied_total = num_slots_occupied_total + occupied
	end

	self.num_total_enemies = num_slots
	self.num_occupied_slots = num_slots_occupied_total
end

AISlotSystem2.register_prioritized_ai_unit_update = function (self, unit)
	self.update_slots_ai_units_prioritized[unit] = true
end

AISlotSystem2.prioritize_queued_units_on_slot = function (self, slot)
	if slot and slot.queue then
		local queue = slot.queue
		local queue_n = #queue

		for i = 1, queue_n do
			local queued_unit = queue[i].unit

			self:register_prioritized_ai_unit_update(queued_unit)
		end
	end
end

AISlotSystem2.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = nil

	if extension_name == "AIPlayerSlotExtension" or extension_name == "AIAggroableSlotExtension" then
		extension = AISlotSystem2.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
		self.unit_extension_data[unit] = extension
		local target_units = self.target_units
		local target_index = #target_units + 1
		extension.index = target_index
		target_units[target_index] = extension
		local nav_world = self.nav_world
		local traverse_logic = self._traverse_logic

		extension:update_target_slots(0, target_units, nav_world, traverse_logic)
	end

	if extension_name == "AIEnemySlotExtension" then
		extension = AISlotSystem2.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
		self.update_slots_ai_units[#self.update_slots_ai_units + 1] = unit
		self.unit_extension_data[unit] = extension
	end

	return extension
end

AISlotSystem2.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

AISlotSystem2.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit was already frozen.")

	if extension == nil then
		return
	end

	local slot_template = extension.slot_template

	if slot_template and slot_template.prioritize_queued_units_on_death then
		local slot = extension.slot

		if slot_template.prioritize_queued_units_on_death_time then
			local t = Managers.time:time("game")
			extension.delayed_prioritized_ai_unit_update_time = t + slot_template.prioritize_queued_units_on_death_time
		else
			self:prioritize_queued_units_on_slot(slot)
		end
	end

	self.frozen_unit_extension_data[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

AISlotSystem2._cleanup_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return
	end

	local update_slots_ai_units = self.update_slots_ai_units
	local update_slots_ai_units_n = #update_slots_ai_units

	if extension_name == "AIEnemySlotExtension" then
		self.update_slots_ai_units_prioritized[unit] = nil

		extension:cleanup_extension(unit, update_slots_ai_units, update_slots_ai_units_n)
	end

	if extension_name == "AIPlayerSlotExtension" or extension_name == "AIAggroableSlotExtension" then
		extension:cleanup_extension(unit, update_slots_ai_units, update_slots_ai_units_n, self.unit_extension_data)

		local all_slot_proviers = self.target_units
		local target_units_n = #all_slot_proviers

		for i = 1, target_units_n do
			if all_slot_proviers[i] == extension then
				all_slot_proviers[i] = all_slot_proviers[target_units_n]
				all_slot_proviers[target_units_n] = nil

				break
			end
		end
	end

	self.unit_extension_data[unit] = nil
end

AISlotSystem2.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	frozen_extensions[unit] = extension
end

AISlotSystem2.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]
	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension

	fassert(extension, "Unit to freeze didn't have unfrozen extension")

	if extension.unfreeze then
		extension:unfreeze(unit)
	end

	self.update_slots_ai_units[#self.update_slots_ai_units + 1] = unit
end

function debug_draw_slots(unit_extension_data, nav_world, t)
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "AISlotSystem2_immediate"
	})

	for unit, extension in pairs(unit_extension_data) do
		if extension.debug_draw then
			extension:debug_draw(drawer, t, nav_world)
		end
	end
end

function debug_print_slots_count(target_units)
	local target_slots_n = #target_units

	Debug.text("OCCUPIED SLOTS")

	for unit_i = 1, target_slots_n do
		local target_unit_extension = target_units[unit_i]
		local target_unit = target_unit_extension.unit
		local player_manager = Managers.player
		local owner_player = player_manager:owner(target_unit)
		local display_name = nil

		if owner_player then
			display_name = owner_player:profile_display_name()
		else
			display_name = tostring(target_unit)
		end

		local debug_text = display_name .. "-> "
		local all_slots = target_unit_extension.all_slots
		local total_slots = 0
		local total_enabled = 0

		for slot_type, slot_data in pairs(all_slots) do
			local disabled_slots_count = slot_data.disabled_slots_count
			local occupied_slots = slot_data.slots_count
			local total_slots_count = slot_data.total_slots_count
			local enabled_slots_count = total_slots_count - disabled_slots_count
			total_slots = total_slots + total_slots_count
			total_enabled = total_enabled + enabled_slots_count
			debug_text = debug_text .. string.format("%s: [%d|%d(%d)]. ", slot_type, occupied_slots, enabled_slots_count, total_slots_count)
		end

		local num_occupied_slots = target_unit_extension.num_occupied_slots
		local delayed_occupied_slots = target_unit_extension.delayed_num_occupied_slots
		debug_text = debug_text .. string.format("total: [%d(%d)|%d(%d)]. ", num_occupied_slots, delayed_occupied_slots, total_enabled, total_slots)

		Debug.text(debug_text)
	end
end

AISlotSystem2.set_allowed_layer = function (self, layer_name, allowed)
	local layer_id = LAYER_ID_MAPPING[layer_name]

	if allowed then
		GwNavTagLayerCostTable.allow_layer(self._navtag_layer_cost_table, layer_id)
	else
		GwNavTagLayerCostTable.forbid_layer(self._navtag_layer_cost_table, layer_id)
	end
end
