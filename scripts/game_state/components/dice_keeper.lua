DiceKeeper = class(DiceKeeper)
DiceKeeper.init = function (self, num_normal)
	self._dice = {
		gold = 0,
		metal = 0,
		warpstone = 0,
		wood = num_normal
	}
	self._new_dice = {}

	return 
end
DiceKeeper.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	return 
end
DiceKeeper.unregister_rpc = function (self)
	self._network_event_delegate = nil

	return 
end
DiceKeeper.get_dice = function (self)
	return self._dice
end
DiceKeeper.num_dices = function (self, die_type)
	return self._dice[die_type]
end
DiceKeeper.num_new_dices = function (self, die_type)
	return self._new_dice[die_type] or 0
end
DiceKeeper.add_die = function (self, die_type, amount)
	Managers.state.debug_text:output_screen_text(string.format("Awarded %d extra die/dice of type %s", amount, die_type), 42, 5)

	self._dice[die_type] = self._dice[die_type] + amount
	self._dice.wood = self._dice.wood - amount
	self._new_dice[die_type] = (self._new_dice[die_type] or 0) + 1

	return 
end
DiceKeeper.bonus_dice_spawned = function (self)
	self._bonus_dice_spawned = (self._bonus_dice_spawned and self._bonus_dice_spawned + 1) or 1

	return 
end
DiceKeeper.num_bonus_dice_spawned = function (self)
	return self._bonus_dice_spawned or 0
end
DiceKeeper.chest_loot_dice_chance = function (self)
	return self._chest_loot_dice_chance or 0.05
end
DiceKeeper.calculcate_loot_die_chance_on_remaining_chests = function (self, percentage_chests_left)
	if 0 < percentage_chests_left then
		self._chest_loot_dice_chance = 0.05 * 1 / percentage_chests_left
	end

	return 
end

return 
