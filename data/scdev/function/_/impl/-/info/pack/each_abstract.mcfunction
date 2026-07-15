#> scdev :-/ info/pack
# each_abstract
#--------------------
# ./main
#--------------------

data modify storage scdev:in abstract.reference.pack_ref set from storage scdev:_ v.packinfo.entry.pack.pack_id
data modify storage scdev:in abstract.reference.id set from storage scdev:_ v.packinfo.interfaces[0].id
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:dark_gray}, {}]
data modify storage scdev:_ v.packinfo.lines[-1][1] set from storage scdev:out abstract.result

data remove storage scdev:_ v.packinfo.interfaces[0]
execute if data storage scdev:_ v.packinfo.interfaces[0] run function scdev:_/impl/-/info/pack/each_abstract