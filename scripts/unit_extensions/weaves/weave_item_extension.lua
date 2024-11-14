-- chunkname: @scripts/unit_extensions/weaves/weave_item_extension.lua

WeaveItemExtension = class(WeaveItemExtension, BaseObjectiveExtension)
WeaveItemExtension.NAME = "WeaveItemExtension"

WeaveItemExtension.init = function (self, extension_init_context, unit, extension_init_data)
	WeaveItemExtension.super.init(self, extension_init_context, unit, extension_init_data)
end

WeaveItemExtension.initial_sync_data = function (self, game_object_data_table)
	game_object_data_table.value = 1
end

WeaveItemExtension._set_objective_data = function (self, objective_data)
	return
end

WeaveItemExtension._server_update = function (self)
	return
end

WeaveItemExtension._client_update = function (self)
	return
end

WeaveItemExtension._activate = function (self)
	return
end

WeaveItemExtension._deactivate = function (self)
	return
end

WeaveItemExtension.get_percentage_done = function (self)
	return 1
end
