local HeroViewStateOverviewTestify = {
	close_hero_view = function (_, hero_view_state_overview)
		hero_view_state_overview:close_menu()
	end,
	set_hero_window_layout = function (index, hero_view_state_overview)
		hero_view_state_overview:set_layout(index)
	end,
	wait_for_hero_view = function ()
		return
	end
}

return HeroViewStateOverviewTestify
