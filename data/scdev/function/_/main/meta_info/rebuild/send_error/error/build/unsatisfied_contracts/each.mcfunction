#> scdev:_/main/meta_info/rebuild/send_error/error/build/unsatisfied_contracts/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:in abstract.reference set from storage scdev:_ t.error.this_entry
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract
data modify storage scdev:_ t.error.abstract_text set from storage scdev:out abstract.result

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - "}, {}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.abstract_text

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/unsatisfied_contracts/each