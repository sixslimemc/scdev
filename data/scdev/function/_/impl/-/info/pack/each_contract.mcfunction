#> scdev :-/ info/pack
# each_contract
#--------------------
# ./main
#--------------------

data modify storage scdev:in contract.reference.pack_ref set from storage scdev:_ v.packinfo.entry.pack.pack_id
data modify storage scdev:in contract.reference.id set from storage scdev:_ v.packinfo.contracts[0].id
data modify storage scdev:in contract.use_this_entity set value true
function scdev:format/contract

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:white}, {}]
data modify storage scdev:_ v.packinfo.lines[-1][1] set from storage scdev:out contract.result

data remove storage scdev:_ v.packinfo.contracts[0]
execute if data storage scdev:_ v.packinfo.contracts[0] run function scdev:_/impl/-/info/pack/each_contract