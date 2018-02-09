ChainActionPassthrough = class(ChainActionPassthrough, ActionDummy)
ChainActionPassthrough.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ChainActionPassthrough.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self.chain_action_data = chain_action_data

	return 
end
ChainActionPassthrough.finish = function (self, reason)
	return self.chain_action_data
end

return 
