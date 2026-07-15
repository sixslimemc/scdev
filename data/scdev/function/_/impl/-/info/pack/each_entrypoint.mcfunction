#> scdev :-/ info/pack
# each_entrypoint
#--------------------
# ./main
#--------------------

data modify storage scdev:in entrypoint.reference.pack_ref set from storage scdev:_ v.packinfo.entry.pack.pack_id
data modify storage scdev:in entrypoint.reference.id set from storage scdev:_ v.packinfo.entrypoints[0].id
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:dark_gray}]
data modify storage scdev:_ v.packinfo.lines[-1] append from storage scdev:out entrypoint.result

data remove storage scdev:_ v.packinfo.entrypoints[0]
execute if data storage scdev:_ v.packinfo.entrypoints[0] run function scdev:_/impl/-/info/pack/each_entrypoint