# IMPL > scdev :-/ info/list/contracts
# each
#--------------------
# ./main
#--------------------
# forward iter

data modify storage scdev:_ v.contracts.this_contract set from storage scdev:_ v.contracts.contracts[0]

# {..contract_text}:
data modify storage scdev:in contract.reference set from storage scdev:_ v.contracts.this_contract
data modify storage scdev:in contract.use_this_entity set value true
function scdev:format/contract
data modify storage scdev:_ v.contracts.contract_text set from storage scdev:out contract.result

# line:
data modify storage scdev:_ v.contracts.lines append value [{text:" - ", color:gray}, {}]
data modify storage scdev:_ v.contracts.lines[-1][1] set from storage scdev:_ v.contracts.contract_text

data remove storage scdev:_ v.contracts.contracts[0]
execute if data storage scdev:_ v.contracts.contracts[0] run function scdev:_/impl/-/info/list/contracts/each