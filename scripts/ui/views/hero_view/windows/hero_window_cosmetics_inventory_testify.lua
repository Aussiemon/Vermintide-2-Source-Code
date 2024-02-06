﻿-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_cosmetics_inventory_testify.lua

local HeroWindowCosmeticsInventoryTestify = {
	get_hero_window_cosmetics_inventory_item_grid = function (hero_window_cosmetics_inventory)
		return hero_window_cosmetics_inventory._item_grid
	end,
	set_slot_hotspot_on_right_click = function (hero_window_cosmetics_inventory, params)
		hero_window_cosmetics_inventory._item_grid._widget.content[params.hotspot_name].on_right_click = params.value
	end,
	wait_for_cosmetics_inventory_window = function ()
		return
	end,
}

return HeroWindowCosmeticsInventoryTestify
