ActionCareerBase = class(ActionCareerBase)

ActionCareerBase.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.world = world
	self.physics_world = World.get_data(world, "physics_world")
	self.item_name = item_name
	self.owner_player = Managers.player:owner(owner_unit)
	self.is_bot = self.owner_player and self.owner_player.bot_player
end

ActionCareerBase.finish = function (self, reason)
	if reason == "action_complete" then
		local owner_unit = self.owner_unit
		slot3 = ScriptUnit.extension(owner_unit, "first_person_system")
	end
end

return
