local HeroWindowCosmeticsInventoryTestify = {
	get_hero_window_cosmetics_inventory_item_grid = function (_, hero_window_cosmetics_inventory)
		return hero_window_cosmetics_inventory._item_grid
	end,
	set_slot_hotspot_on_right_click = function (params, hero_window_cosmetics_inventory)
		hero_window_cosmetics_inventory._item_grid._widget.content[params.hotspot_name].on_right_click = params.value
	end,
	wait_for_cosmetics_inventory_window = function ()
		return
	end
}

return HeroWindowCosmeticsInventoryTestify
