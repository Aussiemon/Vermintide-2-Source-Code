local HeroViewStateOverviewTestify = {}

HeroViewStateOverviewTestify.close_hero_view = function (hero_view_state_overview)
	hero_view_state_overview:close_menu()
end

HeroViewStateOverviewTestify.set_hero_window_layout = function (hero_view_state_overview, index)
	hero_view_state_overview:set_layout(index)
end

HeroViewStateOverviewTestify.wait_for_hero_view = function ()
	return
end

return HeroViewStateOverviewTestify
