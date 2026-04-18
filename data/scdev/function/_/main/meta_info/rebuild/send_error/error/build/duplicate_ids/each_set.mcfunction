#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/each_set
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_set set from storage scdev:_ t.error.sets[-1]

tellraw @a[tag=scdev.listener] [{text:" - Packs sharing id ", color:red}, {plain:true, }]

data remove storage scdev:_ t.error.sets[-1]
execute if data storage scdev:_ t.error.sets[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_set