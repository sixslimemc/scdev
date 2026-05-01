#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/each_set
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_set set from storage scdev:_ t.error.sets[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - Multiple packs with id ", color:red}, {text:"PACK_ID", color:yellow}, {text:":", color:red}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].text set from storage scdev:_ t.error.this_set.pack_id

execute if data storage scdev:_ t.error.this_set.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_pack

data remove storage scdev:_ t.error.sets[-1]
execute if data storage scdev:_ t.error.sets[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_set