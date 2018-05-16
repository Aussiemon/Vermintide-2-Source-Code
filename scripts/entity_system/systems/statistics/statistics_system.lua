require("scripts/entity_system/systems/statistics/statistics_templates")

StatisticsSystem = class(StatisticsSystem, ExtensionSystemBase)
local extensions = {
	"StatisticsExtension"
}
local RPCS = {
	"rpc_register_kill",
	"rpc_set_unsigned_number_session_stat"
}

StatisticsSystem.init = function (self, context, name)
	StatisticsSystem.super.init(self, context, name, extensions)

	self.unit_extension_data = {}
	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	if not self.is_server then
		network_event_delegate:register(self, unpack(RPCS))
	end
end

StatisticsSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

local dummy_input = {}

StatisticsSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local template_category_name = extension_init_data.template
	local statistics_id = extension_init_data.statistics_id

	assert(template_category_name, "No statistic template set for statistics extension on unit %s", tostring(unit))
	assert(statistics_id, "No statistic id set for statistics extension on unit %s", tostring(unit))

	local extension = {
		template_category_name = template_category_name,
		statistics_id = statistics_id
	}
	local templates = StatisticsTemplateCategories[template_category_name]

	for i = 1, #templates, 1 do
		local template_name = templates[i]
		local template = StatisticsTemplates[template_name]
		extension[template_name] = template.init()
	end

	ScriptUnit.set_extension(unit, self.name, extension, dummy_input)

	self.unit_extension_data[unit] = extension

	return extension
end

StatisticsSystem.on_remove_extension = function (self, unit, extension_name)
	self.unit_extension_data[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)
end

StatisticsSystem.update = function (self, context, t)
	local statistics_db = context.statistics_db
	local StatisticsTemplateCategories = StatisticsTemplateCategories
	local StatisticsTemplates = StatisticsTemplates

	for unit, extension in pairs(self.unit_extension_data) do
		if statistics_db:is_registered(extension.statistics_id) then
			local template_category_name = extension.template_category_name
			local templates = StatisticsTemplateCategories[template_category_name]

			for i = 1, #templates, 1 do
				local template_name = templates[i]
				local template = StatisticsTemplates[template_name]

				template.update(unit, extension, context, t)
			end
		end
	end
end

StatisticsSystem.hot_join_sync = function (self, sender)
	local db = self.extension_init_context.statistics_db

	for stat_name, data in pairs(StatisticsDefinitions.session) do
		local sync_rpc = data.hot_join_sync_rpc

		if sync_rpc then
			local stat_id = NetworkLookup.session_stats[stat_name]
			local value = db:get_stat("session", stat_name)

			self.network_transmit:send_rpc(sync_rpc, sender, stat_id, value)
		end
	end
end

StatisticsSystem.rpc_set_unsigned_number_session_stat = function (self, sender, stat_id, value)
	local stat = NetworkLookup.session_stats[stat_id]
	local statistics_db = self.extension_init_context.statistics_db

	statistics_db:set_stat("session", stat, value)
end

local TEMP_ARGS = {}

StatisticsSystem.rpc_register_kill = function (self, sender, victim_unit_go_id)
	local unit_storage = self.unit_storage
	local victim_unit = unit_storage:unit(victim_unit_go_id)

	table.clear(TEMP_ARGS)

	TEMP_ARGS[DamageDataIndex.DAMAGE_AMOUNT] = NetworkConstants.damage.max
	TEMP_ARGS[DamageDataIndex.DAMAGE_TYPE] = "forced"
	TEMP_ARGS[DamageDataIndex.ATTACKER] = victim_unit
	TEMP_ARGS[DamageDataIndex.HIT_ZONE] = "full"
	TEMP_ARGS[DamageDataIndex.DIRECTION] = Vector3.down()
	TEMP_ARGS[DamageDataIndex.DAMAGE_SOURCE_NAME] = "suicide"
	TEMP_ARGS[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME] = "n/a"
	TEMP_ARGS[DamageDataIndex.DAMAGING_UNIT] = "n/a"
	TEMP_ARGS[DamageDataIndex.HIT_REACT_TYPE] = "light"
	TEMP_ARGS[DamageDataIndex.CRITICAL_HIT] = false
	local statistics_db = self.statistics_db

	StatisticsUtil.register_kill(victim_unit, TEMP_ARGS, statistics_db, false)
end

return
