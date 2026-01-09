#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s {text:" - Cycle including packs: ", color:red}

execute if data storage scdev:_ t.error.entry.cycle[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each_pack

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each