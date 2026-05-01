#> scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_ t.error.lines append value {text:" - Conflicting group of entrypoints: ", color:red}

execute if data storage scdev:_ t.error.this_entry.cycle[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each_entrypoint

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each