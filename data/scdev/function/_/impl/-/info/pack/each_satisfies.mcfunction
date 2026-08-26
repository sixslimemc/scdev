#> scdev :-/ info/pack
# each_satisfies
#--------------------
# ./main
#--------------------

data modify storage scdev:in contract.reference set from storage scdev:_ v.packinfo.satisfies[0]
data modify storage scdev:in contract.use_this_entity set value true
function scdev:format/contract

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:white}, {}]
data modify storage scdev:_ v.packinfo.lines[-1][1] set from storage scdev:out contract.result

data remove storage scdev:_ v.packinfo.satisfies[0]
execute if data storage scdev:_ v.packinfo.satisfies[0] run function scdev:_/impl/-/info/pack/each_satisfies