require("foundation/scripts/util/error")

ApiVerification = ApiVerification or {}

ApiVerification.ensure_public_api = function (interface_class, implementation_class)
	for name, value in pairs(interface_class) do
		if type(value) == "function" and string.sub(tostring(name), 1, 1) ~= "_" then
			fassert(implementation_class[name] ~= nil, "Missing function %q in API", name)
		end
	end
end
