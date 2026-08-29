#> scdev :-/ info/pack
# each_preload
#--------------------
# ./main
#--------------------

data modify storage scdev:in preload_entrypoint.reference.pack_ref set from storage scdev:_ v.packinfo.pack.pack_id
data modify storage scdev:in preload_entrypoint.reference.id set from storage scdev:_ v.packinfo.preloads[0].id
data modify storage scdev:in preload_entrypoint.use_this_entity set value true
function scdev:format/preload_entrypoint

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:white}]
data modify storage scdev:_ v.packinfo.lines[-1] append from storage scdev:out preload_entrypoint.result

data remove storage scdev:_ v.packinfo.preloads[0]
execute if data storage scdev:_ v.packinfo.preloads[0] run function scdev:_/impl/-/info/pack/each_preload