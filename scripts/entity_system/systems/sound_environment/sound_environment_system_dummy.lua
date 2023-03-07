require("foundation/scripts/util/api_verification")
require("scripts/entity_system/systems/sound_environment/sound_environment_system")

SoundEnvironmentSystemDummy = class(SoundEnvironmentSystemDummy, ExtensionSystemBase)
local RPCS = {}
local extensions = {}

SoundEnvironmentSystemDummy.init = function (self, entity_system_creation_context, system_name)
	SoundEnvironmentSystemDummy.super.init(self, entity_system_creation_context, system_name, extensions)

	local world = self.world
	self.wwise_world = Managers.world:wwise_world(world)
end

SoundEnvironmentSystemDummy.register_sound_environment = function (self, volume_name, prio, ambient_sound_event, fade_time, aux_bus_name, environment_state)
	return
end

SoundEnvironmentSystemDummy.set_source_environment = function (self, source, position)
	return
end

SoundEnvironmentSystemDummy.register_source_environment_update = function (self, source, unit, object)
	return
end

SoundEnvironmentSystemDummy.unregister_source_environment_update = function (self, source)
	return
end

SoundEnvironmentSystemDummy.local_player_created = function (self, player)
	return
end

SoundEnvironmentSystemDummy.update = function (self, context, t)
	return
end

SoundEnvironmentSystemDummy.enter_environment = function (self, t, volume_name, current_environment_name)
	return
end

ApiVerification.ensure_public_api(SoundEnvironmentSystem, SoundEnvironmentSystemDummy)
