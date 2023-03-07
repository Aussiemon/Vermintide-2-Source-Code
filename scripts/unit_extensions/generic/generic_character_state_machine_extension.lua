require("scripts/unit_extensions/generic/generic_state_machine")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_helper")
require("scripts/unit_extensions/default_player_unit/states/player_character_state")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_dead")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_interacting")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_jumping")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_leaping")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_ledge_hanging")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_leave_ledge_hanging_falling")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_leave_ledge_hanging_pull_up")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_climbing_ladder")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_leaving_ladder_top")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_enter_ladder_top")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_falling")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_knocked_down")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_pounced_down")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_standing")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_inspecting")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_emote")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_walking")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_dodging")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_lunging")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_waiting_for_assisted_respawn")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_catapulted")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_stunned")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_overpowered")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_using_transport")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_grabbed_by_pack_master")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_grabbed_by_corruptor")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_grabbed_by_tentacle")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_grabbed_by_chaos_spawn")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_in_hanging_cage")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_in_vortex")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_overcharge_exploding")
require("scripts/unit_extensions/default_player_unit/states/player_character_state_charged")
DLCUtils.dofile_list("character_states")

GenericCharacterStateMachineExtension = class(GenericCharacterStateMachineExtension)

GenericCharacterStateMachineExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.network_transmit = extension_init_context.network_transmit
	self.unit_storage = extension_init_context.unit_storage
	self.unit = unit
	self.player = extension_init_data.player
	self.start_state = extension_init_data.start_state
	self.character_state_class_list = extension_init_data.character_state_class_list
	self.nav_world = extension_init_data.nav_world
	self.state_machine = GenericStateMachine:new(self.world, self.unit)
end

GenericCharacterStateMachineExtension.extensions_ready = function (self)
	local character_state_init_context = {
		world = self.world,
		unit = self.unit,
		player = self.player,
		csm = self.state_machine,
		network_transmit = self.network_transmit,
		unit_storage = self.unit_storage,
		nav_world = self.nav_world
	}
	local states = {}
	local character_state_class_list = self.character_state_class_list

	for i = 1, #character_state_class_list do
		local state_instance = character_state_class_list[i]:new(character_state_init_context)
		local name = state_instance.name

		assert(name and states[name] == nil)

		states[name] = state_instance
	end

	local start_state = self.start_state

	self.state_machine:post_init(states, start_state)
end

GenericCharacterStateMachineExtension.destroy = function (self)
	self.state_machine:exit_current_state()
end

GenericCharacterStateMachineExtension.reset = function (self)
	self.state_machine:reset()
end

GenericCharacterStateMachineExtension.update = function (self, unit, input, dt, context, t)
	self.state_machine:update(unit, input, dt, context, t)
end

GenericCharacterStateMachineExtension.current_state = function (self)
	return self.state_machine:current_state()
end
