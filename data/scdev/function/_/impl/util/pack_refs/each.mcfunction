## IMPL > scdev:util/pack_refs
# each
#--------------------
# ./main
#--------------------

data modify storage scdev:out pack_refs.result append value {pack_ref:""}
data modify storage scdev:out pack_refs.result[-1].pack_ref set from storage scdev:in pack_refs.pack_ids[0]

data remove storage scdev:in pack_refs.pack_ids[0]
execute if data storage scdev:in pack_refs.pack_ids[0] run function scdev:_/impl/util/pack_refs/each