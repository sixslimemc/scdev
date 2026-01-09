#> scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s {text:" - Conflicting group of entrypoints: ", color:red}

execute if data storage scdev:_ t.error.entry.cycle[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each_pack

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each