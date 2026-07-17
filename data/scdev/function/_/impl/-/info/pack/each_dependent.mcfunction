#> scdev :-/ info/pack
# each_dependent
#--------------------
# ./main
#--------------------

data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.packinfo.dependents[0]
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:white}]
data modify storage scdev:_ v.packinfo.lines[-1] append from storage scdev:out pack.result

data remove storage scdev:_ v.packinfo.dependents[0]
execute if data storage scdev:_ v.packinfo.dependents[0] run function scdev:_/impl/-/info/pack/each_dependent