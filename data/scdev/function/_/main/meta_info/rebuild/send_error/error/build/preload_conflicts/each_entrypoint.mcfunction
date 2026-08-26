#> scdev:_/main/meta_info/rebuild/send_error/error/build/preload_conflicts/each_entrypoint
#--------------------
# ./each
#--------------------

data modify storage scdev:_ t.error.this_entrypoint set from storage scdev:_ t.error.this_entry.conflicting_group[0]

data modify storage scdev:in preload_entrypoint.reference set from storage scdev:_ t.error.this_entrypoint
data modify storage scdev:in preload_entrypoint.use_this_entity set value true
function scdev:format/preload_entrypoint
data modify storage scdev:_ t.error.entrypoint_text set from storage scdev:out preload_entrypoint.result

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - "}, {}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.entrypoint_text

data remove storage scdev:_ t.error.this_entry.conflicting_group[0]
execute if data storage scdev:_ t.error.this_entry.conflicting_group[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/preload_conflicts/each_entrypoint