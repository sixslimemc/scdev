#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:in contract.reference set from storage scdev:_ t.error.this_entry.contract
data modify storage scdev:in contract.use_this_entity set value true
function scdev:format/contract
data modify storage scdev:_ t.error.contract_text set from storage scdev:out contract.result

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text: " - "}, {}, {text: " would be satisfied by:"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.contract_text

execute if data storage scdev:_ t.error.this_entry.satisfiers[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/oversatisfied_contracts/satisfiers/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/oversatisfied_contracts/each