TelemetryEvent = class(TelemetryEvent)
TelemetryEvent.NAME = "TelemetryEvent"
local type_name = Script.type_name

TelemetryEvent.init = function (self, source, subject, type, session)
	fassert(type_name(source) == "table", "'source' needs to be table")
	fassert(type_name(subject) == "table" or subject == nil, "'subject' needs to be a table or nil")
	fassert(type_name(type) == "string", "'type' needs to be a string")
	fassert(type_name(session) == "table" or session == nil, "'session' needs to be a table or nil")

	self._event = {
		specversion = "1.2",
		source = source,
		subject = subject,
		type = type,
		session = session
	}
end

TelemetryEvent.set_revision = function (self, revision)
	fassert(type_name(revision) == "number" or revision == nil, "'revision' needs to be a number or nil")

	self._event.revision = revision
end

TelemetryEvent.set_data = function (self, data)
	assert(type_name(data) == "table" or data == nil, "'data' needs to be a table or nil")

	self._event.data = data
end

TelemetryEvent.raw = function (self)
	return self._event
end

TelemetryEvent.__tostring = function (self)
	return table.tostring(self._event, math.huge)
end
