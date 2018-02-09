local pool_profiling_enabled = true
local PoolTableTemplates = {}
local num_ais = 140
PoolTableTemplates.blackboard = {
	hash_count = 75,
	pool_size = num_ais,
	profiling_enabled = pool_profiling_enabled
}
PoolTableTemplates.generic_extension = {
	hash_count = 30,
	pool_size = 320,
	profiling_enabled = pool_profiling_enabled
}

return PoolTableTemplates
