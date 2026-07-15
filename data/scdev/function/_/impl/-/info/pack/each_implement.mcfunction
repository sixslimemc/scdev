#> scdev :-/ info/pack
# each_implement
#--------------------
# ./main
#--------------------

data modify storage scdev:in abstract.reference set from storage scdev:_ v.packinfo.implements[0]
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:dark_gray}, {}]
data modify storage scdev:_ v.packinfo.lines[-1][1] set from storage scdev:out abstract.result

data remove storage scdev:_ v.packinfo.implements[0]
execute if data storage scdev:_ v.packinfo.implements[0] run function scdev:_/impl/-/info/pack/each_implement