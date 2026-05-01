#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack
#--------------------
# ./each_entry
#--------------------

data modify storage scdev:in pack.pack set from storage scdev:_ t.error.this_entry.packs[-1]
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.pack_text set from storage scdev:out pack.result

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - "}, {}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.pack_text

data remove storage scdev:_ t.error.this_entry.packs[-1]
execute if data storage scdev:_ t.error.this_entry.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack