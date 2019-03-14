local settings = DLCSettings.celebrate
settings.pickups = {
	potions = {
		beer_bottle = {
			only_once = true,
			item_description = "interaction_beer",
			spawn_weighting = 1e-06,
			debug_pickup_category = "consumables",
			pickup_sound_event = "pickup_potion",
			consumable_item = true,
			item_name = "wpn_beer_bottle",
			unit_name = "units/weapons/player/pup_ale/pup_ale",
			type = "inventory_item",
			slot_name = "slot_level_event",
			wield_on_pickup = true,
			local_pickup_sound = true,
			hud_description = "interaction_beer",
			action_on_wield = {
				action = "action_one",
				sub_action = "default"
			},
			on_pick_up_func = function (world, interactor_unit, is_server)
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

				buff_extension:add_buff("intoxication_base")

				local player_manager = Managers.player
				local local_player = player_manager:local_player()
				local statistics_db = player_manager:statistics_db()
				local stats_id = local_player:stats_id()

				statistics_db:increment_stat(stats_id, "crawl_total_ales_drunk")
			end,
			can_interact_func = function (interactor_unit, interactable_unit, data)
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
				local is_in_cooldown = buff_extension:has_buff_type("beer_bottle_pickup_cooldown")
				local is_falling_down = buff_extension:has_buff_perk("falling_down")

				return not is_in_cooldown and not is_falling_down
			end
		},
		beer_bottle_unique = {
			only_once = true,
			item_description = "interaction_beer",
			spawn_weighting = 1e-06,
			debug_pickup_category = "consumables",
			pickup_sound_event = "pickup_potion",
			consumable_item = true,
			item_name = "wpn_beer_bottle",
			unit_name = "units/weapons/player/pup_ale/pup_ale",
			type = "inventory_item",
			slot_name = "slot_level_event",
			wield_on_pickup = true,
			local_pickup_sound = true,
			hud_description = "interaction_beer",
			action_on_wield = {
				action = "action_one",
				sub_action = "default"
			},
			on_pick_up_func = function (world, interactor_unit, is_server)
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

				buff_extension:add_buff("intoxication_base")
				buff_extension:add_buff("hinder_career_ability")
			end,
			can_interact_func = function (interactor_unit, interactable_unit, data)
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
				local is_in_cooldown = buff_extension:has_buff_type("beer_bottle_pickup_cooldown")
				local is_falling_down = buff_extension:has_buff_perk("falling_down")

				return not is_in_cooldown and not is_falling_down
			end
		}
	}
}

return
