PlayerCharacterState = class(PlayerCharacterState)

PlayerCharacterState.init = function (self, character_state_init_context, name)
	local unit = character_state_init_context.unit
	self.name = name
	self.world = character_state_init_context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.unit = unit
	self.csm = character_state_init_context.csm
	self.player = character_state_init_context.player
	self.network_transmit = character_state_init_context.network_transmit
	self.unit_storage = character_state_init_context.unit_storage
	self.nav_world = character_state_init_context.nav_world
	self.is_server = Managers.player.is_server
	self.temp_params = {}
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.input_extension = ScriptUnit.extension(unit, "input_system")
	self.interactor_extension = ScriptUnit.extension(unit, "interactor_system")
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self.health_extension = ScriptUnit.extension(unit, "health_system")
	self.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.ai_extension = ScriptUnit.has_extension(unit, "ai_system") and ScriptUnit.extension(unit, "ai_system")
end

return
