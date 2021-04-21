local PlayerUnitFirstPersonTestify = {
	set_player_unit_not_visible = function (_, player_unit_first_person)
		player_unit_first_person:hide_weapons("hide_weapons_snippet", true)
		Unit.set_unit_visibility(player_unit_first_person.first_person_attachment_unit, false)
	end
}

return PlayerUnitFirstPersonTestify
