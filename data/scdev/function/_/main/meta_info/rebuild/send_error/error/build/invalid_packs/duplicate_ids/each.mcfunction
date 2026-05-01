#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.dup_id set from storage scdev:_ t.error.this_entry.error.duplicate_ids[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - Elements in array '"}, {text:"ARRAY", color:white}, {text:"' should be unique by key '"}, {text:"KEY", color:white}, {text:"' but are not."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].text set from storage scdev:_ t.error.dup_id.in
data modify storage scdev:_ t.error.lines[-1].extra[3].text set from storage scdev:_ t.error.dup_id.id

data remove storage scdev:_ t.error.this_entry.error.duplicate_ids[-1]
execute if data storage scdev:_ t.error.this_entry.error.duplicate_ids[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each