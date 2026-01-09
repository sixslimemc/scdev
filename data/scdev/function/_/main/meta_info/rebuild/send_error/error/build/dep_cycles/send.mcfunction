#> scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/send
#--------------------
# ../../../do
#--------------------

tellraw @s {text: "> There exist dependency cycle(s):", color:red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.dependency_cycles
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each