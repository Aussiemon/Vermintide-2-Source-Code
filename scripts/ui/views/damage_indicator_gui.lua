local SIZE_X = 1920
local SIZE_Y = 1080
local MAX_INDICATOR_WIDGETS = 10
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	indicator_centre = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	}
}
local ignored_damage_types = {
	temporary_health_degen = true,
	vomit_face = true,
	buff_shared_medpack = true,
	buff = true,
	damage_over_time = true,
	life_tap = true,
	health_degen = true,
	warpfire_ground = true,
	vomit_ground = true,
	warpfire_face = true,
	wounded_dot = true,
	overcharge = true,
	heal = true,
	knockdown_bleed = true,
	life_drain = true
}
local damage_indicator_widget_definition = {
	scenegraph_id = "indicator_centre",
	element = UIElements.RotatedTexture,
	content = {
		texture_id = "damage_direction_indicator"
	},
	style = {
		rotating_texture = {
			angle = 90,
			size = {
				423,
				174
			},
			pivot = {
				211.5,
				-200
			},
			offset = {
				-211.5,
				200,
				0
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
}
local colors_by_type = {
	enemy = {
		255,
		205,
		50,
		50
	},
	friendly_fire = {
		255,
		50,
		205,
		50
	}
}
DamageIndicatorGui = class(DamageIndicatorGui)

DamageIndicatorGui.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager

	self:create_ui_elements()

	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
end

DamageIndicatorGui.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.indicator_widgets = {}
	self.indicator_positions = {}

	for i = 1, MAX_INDICATOR_WIDGETS do
		self.indicator_widgets[i] = UIWidget.init(damage_indicator_widget_definition)
		self.indicator_positions[i] = {}
	end

	self.num_active_indicators = 0
end

DamageIndicatorGui.destroy = function (self)
	return
end

DamageIndicatorGui.update = function (self, dt)
	if Development.parameter("screen_space_player_camera_reactions") == false then
		return
	end

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local indicator_widgets = self.indicator_widgets
	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local health_extension = ScriptUnit.extension(player_unit, "health_system")
	local strided_array, array_length = health_extension:recent_damages()
	local indicator_positions = self.indicator_positions

	if array_length > 0 then
		for i = 1, array_length / DamageDataIndex.STRIDE do
			local index = (i - 1) * DamageDataIndex.STRIDE
			local attacker = strided_array[index + DamageDataIndex.ATTACKER]
			local damage_type = strided_array[index + DamageDataIndex.DAMAGE_TYPE]
			local self_damage = attacker == player_unit
			local show_direction = not ignored_damage_types[damage_type] and not self_damage

			if attacker and Unit.alive(attacker) and show_direction then
				local next_active_indicator = self.num_active_indicators + 1

				if next_active_indicator <= MAX_INDICATOR_WIDGETS then
					self.num_active_indicators = next_active_indicator
				else
					next_active_indicator = 1
				end

				local widget = indicator_widgets[next_active_indicator]
				local indicator_position = indicator_positions[next_active_indicator]
				local attacker_position = POSITION_LOOKUP[attacker] or Unit.world_position(attacker, 0)

				Vector3Aux.box(indicator_position, attacker_position)

				indicator_position[3] = 0
				local rotating_texture_color = widget.style.rotating_texture.color
				local is_friendly_fire = Managers.state.side:is_player_friendly_fire(attacker, player_unit)
				local target_color = nil
			end
		end
	end

	local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
	local my_pos = Vector3.copy(POSITION_LOOKUP[player_unit])
	local my_rotation = first_person_extension:current_rotation()
	local my_direction = Quaternion.forward(my_rotation)
	my_direction.z = 0
	my_direction = Vector3.normalize(my_direction)
	local my_left = Vector3.cross(my_direction, Vector3.up())
	my_pos.z = 0
	local i = 1
	local num_active_indicators = self.num_active_indicators

	while i <= num_active_indicators do
		local widget = indicator_widgets[i]

		if not UIWidget.has_animation(widget) then
			local swap = indicator_widgets[num_active_indicators]
			indicator_widgets[i] = swap
			indicator_widgets[num_active_indicators] = widget
			num_active_indicators = num_active_indicators - 1
		else
			local direction = Vector3.normalize(Vector3Aux.unbox(indicator_positions[i]) - my_pos)
			local forward_dot_dir = Vector3.dot(my_direction, direction)
			local left_dot_dir = Vector3.dot(my_left, direction)
			local angle = math.atan2(left_dot_dir, forward_dot_dir)
			widget.style.rotating_texture.angle = angle
			i = i + 1

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	self.num_active_indicators = num_active_indicators

	UIRenderer.end_pass(ui_renderer)
end
