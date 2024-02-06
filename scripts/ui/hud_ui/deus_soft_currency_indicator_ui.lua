-- chunkname: @scripts/ui/hud_ui/deus_soft_currency_indicator_ui.lua

local definitions = local_require("scripts/ui/hud_ui/deus_soft_currency_indicator_ui_definitions")

DeusSoftCurrencyIndicatorUI = class(DeusSoftCurrencyIndicatorUI)

DeusSoftCurrencyIndicatorUI.init = function (self, parent, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui_context = ingame_ui_context

	self:_create_ui_elements()
end

DeusSoftCurrencyIndicatorUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._cached_coin_count = nil
	self._animation_id = nil
	self._coin_widget = UIWidget.init(definitions.coin_widget_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

DeusSoftCurrencyIndicatorUI.play_animation = function (self, animation_name, from_coin_count, to_coin_count)
	local params = {
		from_coin_count = from_coin_count,
		to_coin_count = to_coin_count,
		coin_delta = to_coin_count - from_coin_count,
	}
	local initial_delay = 0

	self._animation_id = self._ui_animator:start_animation(animation_name, self._coin_widget, definitions.scenegraph_definition, params, nil, initial_delay)
end

DeusSoftCurrencyIndicatorUI._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local id = self._animation_id

	if id and ui_animator:is_animation_completed(id) then
		self._animation_id = nil
	end
end

DeusSoftCurrencyIndicatorUI.set_visible = function (self, status)
	return
end

DeusSoftCurrencyIndicatorUI._get_coins = function (self)
	local mechanism = Managers.mechanism:game_mechanism()

	if not mechanism or not mechanism.get_deus_run_controller then
		return 0
	end

	local deus_run_controller = mechanism:get_deus_run_controller()

	if deus_run_controller then
		local peer_id = deus_run_controller:get_own_peer_id()

		return deus_run_controller:get_player_soft_currency(peer_id)
	else
		local deus_backend = Managers.backend:get_interface("deus")

		return deus_backend:get_rolled_over_soft_currency()
	end
end

DeusSoftCurrencyIndicatorUI.update = function (self, dt, t)
	local coin_count = self:_get_coins()

	if not self._animation_id and self._cached_coin_count ~= coin_count then
		if self._cached_coin_count ~= nil then
			self:play_animation("coin_change", self._cached_coin_count, coin_count)
		else
			self._coin_widget.content.coin_count_text = math.floor(coin_count)
		end

		self._cached_coin_count = coin_count
	end

	self:_update_animations(dt)
	self:_draw(dt, t)
end

DeusSoftCurrencyIndicatorUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self._coin_widget)
	UIRenderer.end_pass(ui_renderer)
end
