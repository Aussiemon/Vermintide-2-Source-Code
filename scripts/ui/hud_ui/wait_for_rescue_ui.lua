local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	waiting_for_rescue_text = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			800,
			40
		}
	}
}
local text_definition = {
	scenegraph_id = "waiting_for_rescue_text",
	element = {
		passes = {
			{
				pass_type = "text",
				text_id = "text"
			}
		}
	},
	content = {
		text = "waiting_to_be_rescued"
	},
	style = {
		font_size = 45,
		localize = true,
		word_wrap = true,
		pixel_perfect = true,
		horizontal_alignment = "center",
		vertical_alignment = "center",
		dynamic_font = true,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("white", 255)
	}
}
local RELOAD_UI = true
WaitForRescueUI = class(WaitForRescueUI)

WaitForRescueUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.local_player = Managers.player:local_player()

	self:create_ui_elements()
end

WaitForRescueUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.waiting_for_rescue_text = UIWidget.init(text_definition)
	RELOAD_UI = false
end

WaitForRescueUI.destroy = function (self)
	return
end

WaitForRescueUI.update = function (self, dt, t)
	if RELOAD_UI then
		self:create_ui_elements()
	end

	local player_unit = self.local_player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local status_extension = ScriptUnit.extension(player_unit, "status_system")

	if not status_extension:is_ready_for_assisted_respawn(player_unit) then
		return
	end

	local alpha = math.sirp(0, 255, t)
	self.waiting_for_rescue_text.style.text_color[1] = alpha
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.waiting_for_rescue_text)
	UIRenderer.end_pass(ui_renderer)
end

return
