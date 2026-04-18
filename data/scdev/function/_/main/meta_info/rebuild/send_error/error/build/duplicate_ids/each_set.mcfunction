#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/each_set
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_set set from storage scdev:_ t.error.sets[-1]

tellraw @a[tag=scdev.listener] [{text:" - Multiple packs with id ", color:red}, {plain:true, storage:"scdev:_", nbt:"t.error.this_set.pack_id", color:gold}, {text:":", color:red}]

execute if data storage scdev:_ t.error.this_set.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_pack

data remove storage scdev:_ t.error.sets[-1]
execute if data storage scdev:_ t.error.sets[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_set