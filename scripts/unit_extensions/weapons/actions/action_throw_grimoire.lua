ActionThrowGrimoire = class(ActionThrowGrimoire, ActionBase)

ActionThrowGrimoire.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionThrowGrimoire.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionThrowGrimoire.client_owner_start_action = function (self, new_action, t)
	ActionThrowGrimoire.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
	self.ammo_extension = ScriptUnit.extension(self.weapon_unit, "ammo_system")
end

ActionThrowGrimoire.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionThrowGrimoire.finish = function (self, reason)
	if reason ~= "action_complete" then
		return
	end

	local current_action = self.current_action
	local ammo_usage = current_action.ammo_usage

	self.ammo_extension:use_ammo(ammo_usage)

	local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()
	event_data.item_type = "grimoire"

	dialogue_input:trigger_networked_dialogue_event("throwing_item", event_data)

	local player = Managers.player:unit_owner(self.owner_unit)
	local position = POSITION_LOOKUP[self.owner_unit]

	Managers.telemetry.events:player_used_item(player, self.item_name, position)

	local is_player_controlled = player:is_player_controlled()
	local peer_id = player.peer_id
	local predicate = "discarded_grimoire"
	local owner_name = player:name()

	if not IS_CONSOLE then
		owner_name = is_player_controlled and (rawget(_G, "Steam") and Steam.user_name(peer_id) or tostring(peer_id)) or player:name()
	end

	local pop_chat = true
	local message = string.format(Localize("system_chat_player_discarded_grimoire"), owner_name)

	Managers.chat:add_local_system_message(1, message, pop_chat)
	Managers.state.event:trigger("add_coop_feedback", player:stats_id(), not player.bot_player, predicate, player)

	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_coop_feedback", player:network_id(), player:local_player_id(), NetworkLookup.coop_feedback[predicate], player:network_id(), player:local_player_id())
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_coop_feedback", player:network_id(), player:local_player_id(), NetworkLookup.coop_feedback[predicate], player:network_id(), player:local_player_id())
	end
end
