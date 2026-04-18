#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_set set from storage scdev:_ t.error.sets[-1]

execute store result score *x _scdev if data storage scdev:_ t.error.this_set.packs[]

data remove storage scdev:_ t.error.sets[-1]
execute if data storage scdev:_ t.error.sets[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each