require("core/gwnav/lua/safe_require")

local NavBotConfiguration = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavBotConfiguration = NavClass(NavBotConfiguration)
local NavHelpers = safe_require("core/gwnav/lua/runtime/navhelpers")
local Unit = stingray.Unit
local GwNavTagLayerCostTable = stingray.GwNavTagLayerCostTable
NavBotConfiguration.get_configuration_value = function (self, default, ...)
	return NavHelpers.unit_script_data(self.unit, default, ...)
end
NavBotConfiguration.init = function (self, bot_configuration_unit)
	self.unit = bot_configuration_unit
	self.config_name = "GwNavBotConfiguration"
	self.navtag_layer_cost_table = GwNavTagLayerCostTable.create()
	self.height = self.get_configuration_value(self, 1.8, self.config_name, "height")
	self.radius = self.get_configuration_value(self, 0.4, self.config_name, "radius")
	self.speed = self.get_configuration_value(self, 5, self.config_name, "speed")
	self.enable_avoidance = self.get_configuration_value(self, false, self.config_name, "avoidance", "enable")
	self.collider_collector_half_height = self.get_configuration_value(self, 5, self.config_name, "avoidance", "collider_collector", "half_height")
	self.collider_collector_radius = self.get_configuration_value(self, 30, self.config_name, "avoidance", "collider_collector", "radius")
	self.collider_collector_frame_delay = self.get_configuration_value(self, 15, self.config_name, "avoidance", "collider_collector", "frame_delay")
	self.avoidance_angle_span = self.get_configuration_value(self, 90, self.config_name, "avoidance", "computer", "angle_span")
	self.avoidance_minimal_time_to_collision = self.get_configuration_value(self, 3, self.config_name, "avoidance", "computer", "minimal_time_to_collision")
	self.avoidance_sample_count = self.get_configuration_value(self, 20, self.config_name, "avoidance", "computer", "sample_count")
	self.avoidance_enable_slowing_down = self.get_configuration_value(self, true, self.config_name, "avoidance", "behavior", "enable_slowing_down")
	self.avoidance_enable_force_passage = self.get_configuration_value(self, true, self.config_name, "avoidance", "behavior", "enable_force_passage")
	self.avoidance_enable_stop = self.get_configuration_value(self, true, self.config_name, "avoidance", "behavior", "enable_stop")
	self.avoidance_stop_wait_time_s = self.get_configuration_value(self, 0.5, self.config_name, "avoidance", "behavior", "stop_wait_time_s")
	self.avoidance_force_passage_time_limit_s = self.get_configuration_value(self, 0.5, self.config_name, "avoidance", "behavior", "force_passage_time_limit_s")
	self.avoidance_wait_passage_time_limit_s = self.get_configuration_value(self, 1, self.config_name, "avoidance", "behavior", "wait_passage_time_limit_s")
	self.use_channel = self.get_configuration_value(self, false, self.config_name, "use_channel")
	self.channel_radius = self.get_configuration_value(self, 4, self.config_name, "channel", "channel_radius")
	self.turn_sampling_angle = self.get_configuration_value(self, 30, self.config_name, "channel", "turn_sampling_angle")
	self.channel_smoothing_angle = self.get_configuration_value(self, 30, self.config_name, "channel", "channel_smoothing_angle")
	self.min_distance_between_gates = self.get_configuration_value(self, 0.5, self.config_name, "channel", "min_distance_between_gates")
	self.max_distance_between_gates = self.get_configuration_value(self, 10, self.config_name, "channel", "max_distance_between_gates")
	self.animation_driven = self.get_configuration_value(self, true, self.config_name, "splinetrajectory", "animation_driven")
	self.max_distance_to_spline_position = self.get_configuration_value(self, 0.3, self.config_name, "splinetrajectory", "max_distance_to_spline_position")
	self.spline_length = self.get_configuration_value(self, 100, self.config_name, "splinetrajectory", "spline_length")
	self.spline_distance_to_borders = self.get_configuration_value(self, 0.2, self.config_name, "splinetrajectory", "spline_distance_to_borders")
	self.spline_recomputation_distance = self.get_configuration_value(self, 0.3, self.config_name, "splinetrajectory", "spline_recomputation_distance_ratio")
	self.target_on_spline_distance = self.get_configuration_value(self, 0.6, self.config_name, "splinetrajectory", "target_on_spline_distance")
	self.pathfinder_from_outside_navmesh_distance = self.get_configuration_value(self, 1, self.config_name, "pathfinder", "from_outside_navmesh_distance")
	self.pathfinder_propagation_box_extent = self.get_configuration_value(self, 200, self.config_name, "pathfinder", "propagation_box_extent")
	self.pathfinder_to_outside_navmesh_distance = self.get_configuration_value(self, 0.5, self.config_name, "pathfinder", "to_outside_navmesh_distance")

	if self.unit and Unit.alive(self.unit) and Unit.has_data(self.unit, self.config_name, "navtag_layers") then
		local i = 0

		while Unit.has_data(self.unit, self.config_name, "navtag_layers", i) == true do
			local layer_id = Unit.get_data(self.unit, self.config_name, "navtag_layers", i, "layer_id")
			local layer_cost_multiplier = Unit.get_data(self.unit, self.config_name, "navtag_layers", i, "layer_cost_multiplier")

			GwNavTagLayerCostTable.set_layer_cost_multiplier(self.navtag_layer_cost_table, layer_id, layer_cost_multiplier)

			i = i + 1
		end
	end

	self.target_group = self.get_configuration_value(self, "default", self.config_name, "target_group")
	self.is_player = self.get_configuration_value(self, false, self.config_name, "is_player")

	return 
end
NavBotConfiguration.configure_bot = function (self, bot)
	bot.set_use_avoidance(bot, self.enable_avoidance)
	bot.set_use_channel(bot, self.use_channel)
	bot.set_avoidance_computer_config(bot, self.avoidance_angle_span, self.avoidance_minimal_time_to_collision, self.avoidance_sample_count)
	bot.set_avoidance_collider_collector_config(bot, self.collider_collector_half_height, self.collider_collector_radius, self.collider_collector_frame_delay)
	bot.set_avoidance_behavior(bot, self.avoidance_enable_slowing_down, self.avoidance_enable_force_passage, self.avoidance_enable_stop, self.avoidance_stop_wait_time_s, self.avoidance_force_passage_time_limit_s, self.avoidance_wait_passage_time_limit_s)
	bot.set_channel_config(bot, self.channel_radius, self.turn_sampling_angle, self.channel_smoothing_angle, self.min_distance_between_gates, self.max_distance_between_gates)
	bot.set_spline_trajectory_config(bot, self.animation_driven, self.max_distance_to_spline_position, self.spline_length, self.spline_distance_to_borders, self.spline_recomputation_distance, self.target_on_spline_distance)
	bot.set_propagation_box(bot, self.pathfinder_propagation_box_extent)
	bot.set_outside_navmesh_distance(bot, self.pathfinder_from_outside_navmesh_distance, self.pathfinder_to_outside_navmesh_distance)
	bot.set_navtag_layer_cost_table(bot, self.navtag_layer_cost_table)

	return 
end
NavBotConfiguration.shutdown = function (self)
	GwNavTagLayerCostTable.destroy(self.navtag_layer_cost_table)

	self.navtag_layer_cost_table = nil

	return 
end

return NavBotConfiguration
