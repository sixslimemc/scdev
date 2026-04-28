# IMPL > scdev :-/ info/list/packs
# each
#--------------------
# ./main
#--------------------

data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.packs.pack_ids[0]
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack

data modify storage scdev:_ v.packs.lines append value [{text:" - ", color:gray}, {}]
data modify storage scdev:_ v.packs.lines[-1][1] set from storage scdev:out pack.result

data remove storage scdev:_ v.packs.pack_ids[0]
execute if data storage scdev:_ v.packs.pack_ids[0] run function scdev:_/impl/-/info/list/packs/each