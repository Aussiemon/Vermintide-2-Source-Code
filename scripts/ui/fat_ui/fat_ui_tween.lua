local sin = math.sin
FatUIEasing = {
	ease_linear = function (t)
		return t
	end,
	ease_in_quad = function (t)
		return t * t
	end,
	ease_out_quad = function (t)
		return t * (2 - t)
	end,
	ease_in_out_quad = function (t)
		if t < 0.5 then
			return 2 * t * t
		end

		return -1 + (4 - 2 * t) * t
	end,
	ease_in_cubic = function (t)
		return t * t * t
	end,
	ease_out_cubic = function (t)
		t = t - 1

		return t * t * t + 1
	end,
	ease_in_out_cubic = function (t)
		if t < 0.5 then
			return 4 * t * t * t
		end

		return (t - 1) * (2 * t - 2) * (2 * t - 2) + 1
	end,
	ease_in_quart = function (t)
		return t * t * t * t
	end,
	ease_out_quart = function (t)
		t = t - 1

		return 1 - t * t * t * t
	end,
	ease_in_out_quart = function (t)
		if t < 0.5 then
			return 8 * t * t * t * t
		end

		t = t - 1

		return 1 - 8 * t * t * t * t
	end,
	ease_in_quint = function (t)
		return t * t * t * t * t
	end,
	ease_out_quint = function (t)
		t = t - 1

		return 1 + t * t * t * t * t
	end,
	ease_in_out_quint = function (t)
		if t < 0.5 then
			return 16 * t * t * t * t * t
		end

		t = t - 1

		return 1 + 16 * t * t * t * t * t
	end,
	ease_in_elastic = function (t)
		return (0.04 - 0.04 / t) * sin(25 * t) + 1
	end,
	ease_out_elastic = function (t)
		return (0.04 * t) / (t - 1) * sin(25 * (t - 1))
	end,
	ease_in_out_elastic = function (t)
		t = t - 0.5

		if t < 0 then
			return (0.02 + 0.01 / t) * sin(50 * t)
		end

		return (0.02 - 0.01 / t) * sin(50 * t) + 1
	end
}
FatUITween = class(FatUITween)

FatUITween.init = function (self, duration, delay)
	self._p = 0
	self._inverse_duration = 1 / duration
	self._delay = delay or 0
end

FatUITween.update = function (self, dt)
	self._p = (t - self._delay) * self._inverse_duration
end

FatUITween.lerp = function (self, a, b)
	return math.lerp(a, b, self._p)
end

FatUITween.lerp_vector3 = function (self, a, b)
	return Vector3.lerp(a, b, self._p)
end

FatUITween.lerp_vector2_table = function (self, a, b, out)
	out = out or {}
	local p = self._p
	local s = 1 - p
	out[1] = a[1] * s + b[1] * p
	out[2] = a[2] * s + b[2] * p

	return out
end

FatUITween.lerp_color_table = function (self, a, b, out)
	return Colors.lerp_color_tables(a, b, self._p, out)
end

return
