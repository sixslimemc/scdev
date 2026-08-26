#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/packs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.this_entry.source set from storage scdev:_ t.error.this_entry.sources[-1]


data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ t.error.this_entry.source.pack_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.pack_text set from storage scdev:out pack.result

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - "}, {}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.pack_text

data remove storage scdev:_ t.error.this_entry.sources[-1]
execute if data storage scdev:_ t.error.this_entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/oversatisfied_contracts/packs/each