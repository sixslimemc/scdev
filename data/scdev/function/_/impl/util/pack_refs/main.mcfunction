# IMPL > scdev:util/pack_refs
# main

data modify storage scdev:out pack_refs.result set value []

execute if data storage scdev:in pack_refs.pack_ids[0] run function scdev:_/impl/util/pack_refs/each
