DeusArenaIdolExtension = class(DeusArenaIdolExtension)
local WITCH_HUNTER = 1
local BRIGHT_WIZARD = 2
local DWARF_RANGER = 3
local WOOD_ELF = 4
local EMPIRE_SOLDIER = 5
local UNITS_BY_HERO = {
	[WITCH_HUNTER] = "units/props/deus_idol/deus_sigmar_01",
	[BRIGHT_WIZARD] = "units/props/deus_idol/deus_myrmidia_01",
	[DWARF_RANGER] = "units/props/deus_idol/deus_valaya_01",
	[WOOD_ELF] = "units/props/deus_idol/deus_lileath_01",
	[EMPIRE_SOLDIER] = "units/props/deus_idol/deus_taal_01"
}

DeusArenaIdolExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._world = extension_init_context.world
end

DeusArenaIdolExtension.destroy = function (self)
	return
end

DeusArenaIdolExtension.on_local_player_game_starts = function (self)
	local position = POSITION_LOOKUP[self._unit]
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local unit_name = UNITS_BY_HERO[profile_index]
	local idol_unit = World.spawn_unit(self._world, unit_name, position)

	World.link_unit(self._world, idol_unit, 0, self._unit, 0)
end
