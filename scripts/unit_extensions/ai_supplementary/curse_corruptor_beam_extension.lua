-- chunkname: @scripts/unit_extensions/ai_supplementary/curse_corruptor_beam_extension.lua

CurseCorruptorBeamExtension = class(CurseCorruptorBeamExtension, CorruptorBeamExtension)

CurseCorruptorBeamExtension._get_positions = function (self, dt, self_pos, real_target_position)
	return real_target_position, real_target_position
end
